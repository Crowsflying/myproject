package com.company.filter;

import com.company.bean.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        HttpServletResponse response= (HttpServletResponse) servletResponse;
        HttpSession session=request.getSession();
        String path=request.getContextPath();
        String url=request.getRequestURI();
        User user = (User) session.getAttribute("user");
        if (user==null&&url.indexOf("login.do")==-1&&
                url.indexOf("main.jsp")==-1&&
                url.indexOf("register.jsp")==-1&&
                url.indexOf("register.do")==-1&&
                url.indexOf("findmain.do")==-1&&
                url.indexOf("login.jsp")==-1&&
                url.indexOf("find_pwd.jsp")==-1&&
                url.indexOf("updatePSbyPhone.do")==-1&&
                (!"/".equals(url))){
            response.sendRedirect(path+"/pages/login.jsp");
        }
        else {
            filterChain.doFilter(request,response);
        }
    }

    @Override
    public void destroy() {

    }
}
