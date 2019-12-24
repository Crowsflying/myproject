package com.company.controller;

import com.company.bean.Clothes;
import com.company.bean.Employee;
import com.company.bean.History;
import com.company.bean.User;
import com.company.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("user")
public class EmployeeFind {
    @Autowired
    private IUserService userService;
    @RequestMapping("findpage.do")
    public ModelAndView findpage() {
        ModelAndView mv=new ModelAndView();
        List<Employee> employee=userService.findEmployee();
        List<History> history=userService.findHistory();
        mv.addObject("employee",employee);
        mv.addObject("history",history);
        mv.setViewName("maincom");
        return mv;
    }
    @RequestMapping("findall.do")
    public ModelAndView findall(@RequestParam(defaultValue="1")int currentpage) {
        ModelAndView mv=new ModelAndView();
        List<Employee> employee=userService.findAllem(currentpage);
        PageInfo<Employee> pageInfo=new PageInfo<>(employee);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("employees");
        return mv;
    }
    @RequestMapping("deleteEm.do")
    public String deleteEm(String username){
        userService.deleteusername(username);
        return "redirect:/user/findall.do";
    }
    @RequestMapping("toupdateEm.do")
    public ModelAndView toupdateup(String username){
        ModelAndView mv=new ModelAndView();
        Employee employee = userService.findByUsername(username);
        mv.addObject("employee",employee);
        mv.setViewName("employee");
        return mv;
    }
    @RequestMapping("updateEm.do")
    public String updateEm(Employee employee){
        userService.updateEmployee(employee);
        return "redirect:/user/findall.do";
    }
    @RequestMapping("insertEm.do")
    public String insertEm(Employee employee){
        userService.insertEmployee(employee);
        return "redirect:/user/findall.do";
    }
    @RequestMapping("login.do")
    public String login(User user, HttpSession session){
        boolean flag = userService.login(user);
        if (flag){
            return "redirect:/user/findpage.do";
        }
        else {
            return "sign-up";
        }
    }




}
