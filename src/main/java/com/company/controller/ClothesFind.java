package com.company.controller;

import com.company.bean.Cart;
import com.company.bean.Clothes;
import com.company.bean.User;
import com.company.pojo.Brandclothes;
import com.company.service.IUserService;
import com.company.service.impl.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("clothes")
public class ClothesFind {
    @Autowired
    private IUserService userService;
    private Logger log4j=Logger.getLogger(ClothesFind.class);
    @RequestMapping("findmain.do")
    public ModelAndView findmain(){
        ModelAndView mv=new ModelAndView();
        List<Clothes> woman = userService.findpageClothes(0,10);
        List<Clothes> man = userService.findpageClothes(1,10);
        mv.addObject("woman",woman);
        mv.addObject("man",man);
        mv.setViewName("main");
        return mv;
    }
    @RequestMapping("findmaninfo.do")
    public ModelAndView findmaninfo(String name,@RequestParam(defaultValue = "999") int type){
        ModelAndView mv=new ModelAndView();
            Clothes maninfo = userService.findmaninfo(type,name);
            List<Clothes> boutique = userService.findpageClothes(type,4);
       // List<Clothes> boutique = userService.findtopClothes();
         //   log4j.info("clothesname:"+maninfo.getImages());
            mv.addObject("maninfo",maninfo);
            mv.addObject("boutique",boutique);
            mv.setViewName("product");
        return mv;
    }

    @RequestMapping("findCart.do")
    public ModelAndView findCart(@RequestParam(defaultValue = "1") int currentpage,HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        List<Cart> cart = userService.findCart(currentpage,user.getUserid());
        PageInfo<Cart> pageInfo=new PageInfo<>(cart);
        mv.addObject("pageInfo",pageInfo);
        if (cart.size()==0){
            mv.addObject("buybuy1",0);
        }
        else {
            int buybuy1=userService.cartSettlement(user.getUserid());
            mv.addObject("buybuy1",buybuy1);
        }
        mv.setViewName("cart");
        return mv;
    }
    @RequestMapping("settlement.do")
    public ModelAndView settlement(HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        int buybuybuy=userService.cartSettlement(user.getUserid());
        if (user.getBalance()<buybuybuy){
            mv.setViewName("redirect:/onself/findaccount.do");
        }
        else {
            List<Cart> settlement = userService.settlement(user.getUserid());
            mv.addObject("settlement",settlement);
            mv.addObject("buybuybuy",buybuybuy);
            mv.setViewName("order_confirm");
        }
        return mv;
    }
    @RequestMapping("buyCarts.do")
    @ResponseBody
    public String buyCarts(String goodname,int nums,HttpSession session,String attribute,String color){
        User user= (User) session.getAttribute("user");
        JSONObject jsonObject=new JSONObject();
        Cart cart1=userService.addCart(goodname,attribute,color);
        if (cart1!=null){
            if (cart1.getNums()+nums>cart1.getStock()){
                jsonObject.put("result","0");
            }
            else {
                userService.addCartnums(goodname,attribute,color,nums);
                jsonObject.put("result","1");
            }

        }
        else {
            Clothes findmaninfo = userService.findmaninfo(999, goodname);
            Cart cart=new Cart();
            cart.setUserid(user.getUserid());
            cart.setGoodsname(findmaninfo.getClothesname());
            cart.setImage(findmaninfo.getImages());
            cart.setNums(nums);
            cart.setAttribute(attribute);
            cart.setColor(color);
            cart.setPrice(findmaninfo.getPrice());
            cart.setStock(findmaninfo.getStock());
            userService.buygood(cart);
            jsonObject.put("result","1");
        }
        return jsonObject.toString();
    }
    @RequestMapping("deleteCart.do")
    public String deleteCart(int id){
        userService.deletegoods(id);
        return "redirect:/clothes/findCart.do";
    }
    @RequestMapping("login.do")
    @ResponseBody
    public String login(User user, HttpSession session){
        JSONObject jsonObject=new JSONObject();
        boolean flag = userService.login(user);
        if (flag){
            User user1 = userService.findUser(user.getUsername());
            //log4j.info("user uname :"+user1.getUserid());
            session.setAttribute("user",user1);
            jsonObject.put("result","1");
        }
        else {
            jsonObject.put("result","0");
        }
        return jsonObject.toString();
    }
    @RequestMapping("register.do")
    @ResponseBody
    public String register(User user){
        userService.register(user);
        return new JSONObject().toString();
    }
    @RequestMapping("setCartnums.do")
    @ResponseBody
    public String setCartnums(int cartId,int nums){
        JSONObject jsonObject=new JSONObject();
//        Cart stock1 = userService.findStock(cartId);
//        if (stock<stock1.getStock()){
//            jsonObject.put("result","0");
//        }
            userService.setCartnums(cartId,nums);
//            jsonObject.put("result","1");
        return jsonObject.toString();
    }
    @RequestMapping("logout.do")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        session.removeAttribute("search");
        return "redirect:/clothes/findmain.do";
    }
    @RequestMapping("brandshop.do")
    public ModelAndView brandshop(@RequestParam(defaultValue = "1")int currentpage, String brand){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(currentpage,12);
        List<Brandclothes> brandclothes = userService.brandshop(brand);
        PageInfo<Brandclothes> pageInfo=new PageInfo<>(brandclothes);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("shop");
        return mv;
    }
    @RequestMapping("updatapassword.do")
    @ResponseBody
    public String updatapassword(HttpSession session, @Param(value = "password") String password, @Param(value = "newpassword") String newpassword){
        User user= (User) session.getAttribute("user");
        JSONObject jsonObject=new JSONObject();
        if (!password.equals(user.getPassword())){
            jsonObject.put("result","0");
        }
        else {
            user.setPassword(newpassword);
            userService.updatapassword(user);
            jsonObject.put("result","1");
        }
        return jsonObject.toString();
    }
    @RequestMapping("updatePSbyPhone.do")
    @ResponseBody
    public String updatePSbyPhone(User user){
        JSONObject jsonObject=new JSONObject();
        User user1=userService.findByPhone(user.getPhone());
        if (user1==null){
            jsonObject.put("result","0");
        }
        else {
            userService.updatePSbyPhone(user);
            jsonObject.put("result","1");
        }
        return jsonObject.toString();
    }
    @RequestMapping("clearsenior.do")
    public String clearsenior(HttpSession session){
        session.removeAttribute("gsb");
        session.removeAttribute("max");
        session.removeAttribute("min");
        return "redirect:/clothes/senior.do";
    }
    @RequestMapping("senior.do")
    public ModelAndView senior(@RequestParam(defaultValue = "1")int currentpage,
                               String brand,
                               Integer price,
                               Integer min,
                               HttpSession session){
        ModelAndView mv=new ModelAndView();
        PageHelper.startPage(currentpage,15);
        if (brand==null&&price==null&&session.getAttribute("gsb")==null
        &&session.getAttribute("max")==null){
            List<Clothes> clothes = userService.findallClothes();
            PageInfo<Clothes> pageInfo=new PageInfo<>(clothes);
            mv.addObject("pageInfo",pageInfo);
        }
        else if ((brand!=null||session.getAttribute("gsb")!=null)&&price==null){
            if (brand!=null) {
                session.setAttribute("gsb",brand);
            }
            else{
                brand= (String) session.getAttribute("gsb");
            }
            session.removeAttribute("min");
            session.removeAttribute("max");
            List<Clothes> clothes = userService.clothesBybrand(brand);
            PageInfo<Clothes> pageInfo=new PageInfo<>(clothes);
            mv.addObject("pageInfo",pageInfo);
        }
        else {
            if (price!=null) {
                session.setAttribute("min",min);
                session.setAttribute("max",price);
            }
            else{
                min= (Integer) session.getAttribute("min");
                price= (Integer) session.getAttribute("max");
            }
            session.removeAttribute("gsb");
            List<Clothes> clothes = userService.clothesByprice(min,price);
            PageInfo<Clothes> pageInfo=new PageInfo<>(clothes);
            mv.addObject("pageInfo",pageInfo);
        }
        List<Clothes> clothes1 = userService.findpageClothes(999,10);
        mv.addObject("clothes1",clothes1);
        mv.setViewName("product_list");
        return mv;
    }
}
