package com.company.dao;

import com.company.bean.Account;
import com.company.bean.Addresslist;
import com.company.bean.Inquiry;
import com.company.bean.Order;
import com.company.pojo.Moneytran;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    List<Order> findOrder();
    List<Order> likeOrder(@Param("search") String search,@Param("userid") int userid);
    void insertOrder(Order order);
    List<Inquiry> findInquiry(int userid);
    Inquiry findOneInquiry(@Param("userid")int userid,@Param("inquiryid")int inquiryid);
    void  deleteInquiry(int inquiryid);
    List<Addresslist> findaddress(int userid);
    void insertaddress(Addresslist addresslist);
    void deleteaddress(Addresslist addresslist);
    List<Moneytran> findaccount(int userid);
    void updatamoney(Moneytran moneytran);
    void updatamoneynew(@Param("transaction")int transaction,@Param("userid")int userid);
    void insertmoney(Account account);
    Order orderdetailed(int orderid);
}
