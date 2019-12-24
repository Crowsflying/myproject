package com.company.service;

import com.company.bean.Account;
import com.company.bean.Addresslist;
import com.company.bean.Inquiry;
import com.company.bean.Order;
import com.company.pojo.Moneytran;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IOrderService {
    List<Order> findOrder(int currentpage);
    List<Order> likeOrder(String search,int userid);
    void insertOrder(Order order);
    List<Inquiry> findInquiry(int userid);
    Inquiry findOneInquiry(int userid,int inquiryid);
    void  deleteInquiry(int inquiryid);
    List<Addresslist> findaddress(int userid);
    void insertaddress(Addresslist addresslist);
    void deleteaddress(Addresslist addresslist);
    List<Moneytran> findaccount(int userid);
    void updatamoney(Moneytran moneytran);
    void insertmoney(Account account);
    Order orderdetailed(int orderid);
    void updatamoneynew(int transaction,int userid);
}
