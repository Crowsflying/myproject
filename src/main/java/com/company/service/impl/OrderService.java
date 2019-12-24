package com.company.service.impl;

import com.company.bean.Account;
import com.company.bean.Addresslist;
import com.company.bean.Inquiry;
import com.company.bean.Order;
import com.company.dao.OrderDao;
import com.company.pojo.Moneytran;
import com.company.service.IOrderService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService implements IOrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public List<Order> findOrder(int currentpage) {
        PageHelper.startPage(currentpage,5);
        return orderDao.findOrder();
    }

    @Override
    public List<Order> likeOrder(String search,int userid) {
        return orderDao.likeOrder(search,userid);
    }

    @Override
    public void insertOrder(Order order) {
        orderDao.insertOrder(order);
    }

    @Override
    public List<Inquiry> findInquiry(int userid) {
        return orderDao.findInquiry(userid);
    }

    @Override
    public Inquiry findOneInquiry(int userid, int inquiryid) {
        return orderDao.findOneInquiry(userid,inquiryid);
    }

    @Override
    public void deleteInquiry(int inquiryid) {
        orderDao.deleteInquiry(inquiryid);
    }

    @Override
    public List<Addresslist> findaddress(int userid) {
        return orderDao.findaddress(userid);
    }

    @Override
    public void insertaddress(Addresslist addresslist) {
            orderDao.insertaddress(addresslist);
    }

    @Override
    public void deleteaddress(Addresslist addresslist) {
        orderDao.deleteaddress(addresslist);
    }

    @Override
    public List<Moneytran> findaccount(int userid) {
        return orderDao.findaccount(userid);
    }

    @Override
    public void updatamoney(Moneytran moneytran) {
        orderDao.updatamoney(moneytran);
    }

    @Override
    public void insertmoney(Account account) {
        orderDao.insertmoney(account);
    }

    @Override
    public Order orderdetailed(int orderid) {
        return orderDao.orderdetailed(orderid);
    }

    @Override
    public void updatamoneynew(int transaction, int userid) {
        orderDao.updatamoneynew(transaction,userid);
    }
}
