package com.company.controller;

import com.company.bean.*;
import com.company.pojo.Moneytran;
import com.company.service.IOrderService;
import com.company.service.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderFind {
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IUserService userService;
    @RequestMapping("orderfind.do")
    public ModelAndView orderfind(@RequestParam(defaultValue = "1")int currentpage,String search, HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        if (search!=null){
            session.setAttribute("search",search);
        }
        else {
             search= (String) session.getAttribute("search");
        }
        PageHelper.startPage(currentpage,5);
        List<Order> order=orderService.likeOrder(search,user.getUserid());
        PageInfo<Order> pageInfo = new PageInfo<>(order);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("order_list");
        return mv;
    }
    @RequestMapping("clearorderfind.do")
    public String clearorderfind(HttpSession session){
        session.removeAttribute("search");
        return "redirect:/order/orderfind.do";
    }
    @RequestMapping("findOneInquiry.do")
    public ModelAndView findOneInquiry(int inquiryid,HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        Inquiry oneInquiry = orderService.findOneInquiry(user.getUserid(), inquiryid);
        mv.addObject("oneInquiry",oneInquiry);
        mv.setViewName("price_detail");
        return mv;
    }
    @RequestMapping("insertaddress.do")
    @ResponseBody
    public String insertaddress(Addresslist addresslist,HttpSession session){
        User user = (User) session.getAttribute("user");
        addresslist.setUserid(user.getUserid());
        orderService.insertaddress(addresslist);
        return new JSONObject().toString();
    }
    @RequestMapping("findaddress.do")
    public ModelAndView findaddress(HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        List<Addresslist> address = orderService.findaddress(user.getUserid());
        mv.addObject("address",address);
        mv.setViewName("address");
        return mv;
    }
    @RequestMapping("deleteaddress.do")
    public String deleteaddress(Addresslist addresslist,HttpSession session){
        User user= (User) session.getAttribute("user");
        addresslist.setUserid(user.getUserid());
        orderService.deleteaddress(addresslist);
        return "redirect:/order/findaddress.do";
    }
    @RequestMapping("deleteInquiry.do")
    public String deleteInquiry(int inquiryid){
        orderService.deleteInquiry(inquiryid);
        return "redirect:/order/findInquiry.do";
    }
    @RequestMapping("findInquiry.do")
    public ModelAndView findInquiry(@RequestParam(defaultValue = "1")int currentpage,HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        PageHelper.startPage(currentpage,3);
        List<Inquiry> inquiry = orderService.findInquiry(user.getUserid());
        PageInfo<Inquiry> pageInfo = new PageInfo<>(inquiry);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("price_list");
        return mv;
    }
    @RequestMapping("clothesset.do")
    public String clothesset(int id,HttpSession session){
        User user= (User) session.getAttribute("user");
        Cart cart = userService.findoneCart(id);
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=sim.format(new Date().getTime());
        if (user.getBalance()<(cart.getNums()*cart.getPrice())){
            return "redirect:/onself/findaccount.do";
        }
        else {
            userService.deletegoods(id);
            Order order=new Order();
            order.setUserid(user.getUserid());
            order.setImage(cart.getImage());
            order.setName(cart.getGoodsname());
            order.setPrice(cart.getPrice());
            order.setNums(cart.getNums());
            order.setOrdertime(time);
            orderService.insertOrder(order);
            Account account=new Account();
            account.setUserid(user.getUserid());
            account.setAccounttype("订单"+cart.getCartId());
            account.setTransaction(cart.getNums()*cart.getPrice());
            account.setAccounttime(time);
            int thatbalance=user.getBalance()-cart.getNums()*cart.getPrice();
            account.setThatbalance(thatbalance);
            orderService.insertmoney(account);
            Moneytran moneytran=new Moneytran();
            moneytran.setUserid(user.getUserid());
            moneytran.setTransaction(-account.getTransaction());
            orderService.updatamoney(moneytran);
            user.setBalance(thatbalance);
            session.setAttribute("user",user);
            return "redirect:/clothes/findCart.do";
        }
    }

    @RequestMapping("submitOrder.do")
    public ModelAndView submitOrder(@Param(value = "buybuybuy")int buybuybuy,HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=sim.format(new Date().getTime());
            int account = userService.cartSettlement(user.getUserid());
            mv.addObject("account",account);
            mv.addObject("datetime", time);
            List<Cart> allCart = userService.findAllCart(user.getUserid());
            int thatbalance=user.getBalance();
            for (Cart a:allCart){
                Order order=new Order();
                order.setUserid(user.getUserid());
                order.setImage(a.getImage());
                order.setName(a.getGoodsname());
                order.setPrice(a.getPrice());
                order.setNums(a.getNums());
                order.setOrdertime(time);
                orderService.insertOrder(order);
                userService.deletegoods(a.getCartId());
                Account account1=new Account();
                account1.setUserid(user.getUserid());
                account1.setAccounttype("订单"+a.getCartId());
                account1.setTransaction(a.getPrice()*a.getNums());
                account1.setAccounttime(time);
                thatbalance=thatbalance-a.getPrice()*a.getNums();
                account1.setThatbalance(thatbalance);
                orderService.insertmoney(account1);
                Moneytran moneytran=new Moneytran();
                moneytran.setUserid(user.getUserid());
                moneytran.setTransaction(-account1.getTransaction());
                orderService.updatamoney(moneytran);
            }
            user.setBalance(user.getBalance()-buybuybuy);
            session.setAttribute("user",user);
            mv.setViewName("system_prompts");
        return mv;
    }
    @RequestMapping("orderdetailed.do")
    public ModelAndView orderdetailed(int orderid,HttpSession session){
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        Order orderdetailed = orderService.orderdetailed(orderid);
        mv.addObject("orderdetailed",orderdetailed);
        mv.setViewName("order_detail");
        return mv;
    }
}
