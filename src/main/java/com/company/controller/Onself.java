package com.company.controller;

import com.company.bean.Account;
import com.company.bean.Collect;
import com.company.bean.Collectbrand;
import com.company.bean.User;
import com.company.pojo.Moneytran;
import com.company.service.IOrderService;
import com.company.service.IUserService;
import com.company.util.YijuUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("onself")
public class Onself {
    @Autowired
    private IUserService userService;
    @Autowired
    private IOrderService orderService;
    @RequestMapping("findcollect.do")
    public ModelAndView findcollect(@RequestParam(defaultValue = "1")int currentpage, HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        List<Collect> collect = userService.findcollect(currentpage,user.getUserid());
        PageInfo<Collect> pageInfo=new PageInfo<>(collect);
        mv.addObject("pageInfo",pageInfo);
        List<Collectbrand> collectbrand = userService.findcollectbrand(currentpage, user.getUserid());
        PageInfo<Collectbrand> pageInfo1=new PageInfo<>(collectbrand);
        mv.addObject("pageInfo1",pageInfo1);
        mv.setViewName("favorite");
        return mv;
    }
//    @RequestMapping("findcollectbrand.do")
//    public ModelAndView findcollectbrand(@RequestParam(defaultValue = "1")int currentpage, HttpSession session){
//        ModelAndView mv=new ModelAndView();
//        User user= (User) session.getAttribute("user");
//        List<Collectbrand> collectbrand = userService.findcollectbrand(currentpage, user.getUserid());
//        PageInfo<Collectbrand> pageInfo=new PageInfo<>(collectbrand);
//        mv.addObject("pageInfo",pageInfo);
//        mv.setViewName("favorite");
//        return mv;
//    }
    @RequestMapping("insertcollect.do")
    @ResponseBody
    public String insertcollect(Collect collect,HttpSession session){
        User user= (User) session.getAttribute("user");
        Collect flagcollect = userService.flagcollect(user.getUserid(),collect.getCollectname());
        JSONObject jsonObject=new JSONObject();
        if (flagcollect==null){
            collect.setUserid(user.getUserid());
            userService.insertcollect(collect);
            jsonObject.put("result","1");
        }
        else {
            jsonObject.put("result","0");
        }
        return jsonObject.toString();
    }
    @RequestMapping("insertcollectbrand.do")
    @ResponseBody
    public String insertcollectbrand(Collectbrand collectbrand, HttpSession session){
        User user= (User) session.getAttribute("user");
        Collectbrand flagcollectbrand = userService.flagcollectbrand(user.getUserid(),collectbrand.getBrandname());
        JSONObject jsonObject=new JSONObject();
        if (flagcollectbrand==null){
            collectbrand.setUserid(user.getUserid());
            userService.insertcollectbrand(collectbrand);
            jsonObject.put("result","1");
        }
        else {
            jsonObject.put("result","0");
        }
        return jsonObject.toString();
    }
    @RequestMapping("deletecollect.do")
    public String deletecollect(int id){
        userService.deletecollect(id);
        return "redirect:/onself/findcollect.do";
    }
    @RequestMapping("deletecollectbrand.do")
    public String deletecollectbrand(int id){
        userService.deletecollectbrand(id);
        return "redirect:/onself/findcollect.do";
    }
    @RequestMapping("updataonself.do")
    public String updataonself(User user, HttpSession session, @Param(value = "headimage1") MultipartFile headimage1) throws IOException {
        User user1= (User) session.getAttribute("user");
        user1.setHeadimage(user.getHeadimage());
        user1.setNickname(user.getNickname());
        user1.setTruename(user.getTruename());
        user1.setPhone(user.getPhone());
        user1.setEmail(user.getEmail());
        user1.setHeadimage(user.getHeadimage());
        Map<String, byte[]> images=new HashMap<>();
        if (headimage1.getSize()!=0){
            String picName = YijuUtil.getPicName();
            user1.setHeadimage(picName);
            images.put(picName,headimage1.getBytes());
            Set<String> keys=images.keySet();
            for (String key:keys){
                byte[] file=images.get(key);
                YijuUtil.upload(file,key);
        }
      }
        userService.updataonself(user1);
        session.setAttribute("user",user1);
        return "user";
    }
    @RequestMapping("findaccount.do")
    public ModelAndView findaccount(@RequestParam(defaultValue = "1")int currentpage, HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        PageHelper.startPage(currentpage,6);
        List<Moneytran> findaccount = orderService.findaccount(user.getUserid());
        PageInfo<Moneytran> pageInfo=new PageInfo<>(findaccount);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("account");
        return mv;
    }
    @RequestMapping("updatamoney.do")
    @ResponseBody
    public String updatamoney(Moneytran moneytran,HttpSession session){
        User user= (User) session.getAttribute("user");
        JSONObject jsonObject=new JSONObject();
        moneytran.setUserid(user.getUserid());
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=sim.format(new Date().getTime());
        if ("充值".equals(moneytran.getAccounttype())){
            orderService.updatamoneynew(moneytran.getTransaction(),user.getUserid());
            Account account=new Account();
            account.setUserid(user.getUserid());
            account.setAccounttype(moneytran.getAccounttype());
            account.setAccounttime(time);
            account.setThatbalance(user.getBalance()+moneytran.getTransaction());
            account.setTransaction(moneytran.getTransaction());
            orderService.insertmoney(account);
            User user1 = userService.findUser(user.getUsername());
            session.setAttribute("user",user1);
        }
        else {
            if (user.getBalance()<moneytran.getTransaction()){
                jsonObject.put("result","0");
            }
            else {
                moneytran.setTransaction(-moneytran.getTransaction());
                orderService.updatamoneynew(moneytran.getTransaction(),user.getUserid());
                jsonObject.put("result","1");
                Account account=new Account();
                account.setUserid(user.getUserid());
                account.setAccounttype(moneytran.getAccounttype());
                account.setAccounttime(time);
                account.setThatbalance(user.getBalance()+moneytran.getTransaction());
                account.setTransaction(moneytran.getTransaction());
                orderService.insertmoney(account);
                User user1 = userService.findUser(user.getUsername());
                session.setAttribute("user",user1);
            }
        }
        return jsonObject.toString();
    }

}
