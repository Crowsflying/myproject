package com.company.service.impl;

import com.company.bean.*;

import com.company.dao.IUserDao;
import com.company.pojo.Brandclothes;
import com.company.service.IUserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

import java.util.*;

@Service
public class UserService implements IUserService {
    @Autowired
    private IUserDao iUserDao;
    Jedis jedis=new Jedis("127.0.0.1",6379);
    @Override
    public List<Employee> findEmployee() {
        return iUserDao.findEmployee();
    }
    @Override
    public List<History> findHistory() {
        return iUserDao.findHistory();
    }

    @Override
    public List<Employee> findAllem(int currentpage) {
        PageHelper.startPage(currentpage,6);
        return iUserDao.findAllem();
    }

    @Override
    public void deleteusername(String username) {
        iUserDao.deleteusername(username);
    }

    @Override
    public Employee findByUsername(String username) {
        return iUserDao.findByUsername(username);
    }

    @Override
    public void updateEmployee(Employee employee) {
        iUserDao.updateEmployee(employee);
    }

    @Override
    public void insertEmployee(Employee employee) {
        iUserDao.insertEmployee(employee);
    }

    @Override
    public boolean login(User user) {
        boolean flag;
        User userone = iUserDao.login(user.getUsername());
        if (userone!=null&&user.getPassword().equals(userone.getPassword())){
            flag=true;
        }
        else {
            flag=false;
        }
        return flag;
    }

    @Override
    public User findUser(String username) {
        return iUserDao.login(username);
    }

    @Override
    public List<Clothes> findpageClothes(int type,int num) {
        return iUserDao.findpageClothes(type,num);
    }

    @Override
    public Clothes findmaninfo(int type,String name) {
        return iUserDao.findmaninfo(type,name);
    }

    @Override
    public List<Cart> findCart(int currentpage,int userid) {
        PageHelper.startPage(currentpage,5);
        return iUserDao.findCart(userid);
    }

    @Override
    public List<Cart> findAllCart(int userid) {
        return iUserDao.findCart(userid);
    }

    @Override
    public List<Cart> settlement(int userid) {
        return iUserDao.findCart(userid);
    }

    @Override
    public Cart findoneCart(int id) {
        return iUserDao.findoneCart(id);
    }

    @Override
    public int cartSettlement(int userid) {
        return iUserDao.cartSettlement(userid);
    }
    @Override
    public void setCartnums(int cartId, int nums) {
        iUserDao.setCartnums(cartId,nums);
    }

    @Override
    public void buygood(Cart cart) {
         iUserDao.buygood(cart);
    }

    @Override
    public void deletegoods(int id) {
        iUserDao.deletegoods(id);
    }

    @Override
    public void register(User user) {
        iUserDao.register(user);
    }

    @Override
    public List<Collect> findcollect(int currentpage,int userid) {
        PageHelper.startPage(currentpage,8);
        return iUserDao.findcollect(userid);
    }


    @Override
    public void insertcollect(Collect collect) {
        iUserDao.insertcollect(collect);
    }

    @Override
    public Collect flagcollect(int userid, String name) {
        return iUserDao.flagcollect(userid,name);
    }
    @Override
    public void deletecollect(int id) {
            iUserDao.deletecollect(id);
    }

    @Override
    public void deletecollectbrand(int id) {
        iUserDao.deletecollectbrand(id);
    }

    @Override
    public List<Brandclothes> brandshop(String brand) {
        return iUserDao.brandshop(brand);
    }

    @Override
    public void updatapassword(User user) {
        iUserDao.updatapassword(user);
    }

    @Override
    public void updataonself(User user) {
        iUserDao.updataonself(user);
    }

    @Override
    public void updatePSbyPhone(User user) {
        iUserDao.updatePSbyPhone(user);
    }

    @Override
    public User findByPhone(String phone) {
        return iUserDao.findByPhone(phone);
    }

    @Override
    public List<Clothes> clothesBybrand(String brand) {
        return iUserDao.clothesBybrand(brand);
    }

    @Override
    public List<Clothes> clothesByprice(int min,int price) {
        return iUserDao.clothesByprice(min,price);
    }

    @Override
    public List<Clothes> findallClothes() {
        return iUserDao.findallClothes();
    }

    @Override
    public Cart addCart(String goodname, String attribute, String color) {
        return iUserDao.addCart(goodname,attribute,color);
    }

    @Override
    public void addCartnums(String goodname, String attribute, String color, int nums) {
        iUserDao.addCartnums(goodname,attribute,color,nums);
    }

    @Override
    public Cart findStock(int cartId) {
        return iUserDao.findStock(cartId);
    }

    @Override
    public void insertcollectbrand(Collectbrand collectbrand) {
        iUserDao.insertcollectbrand(collectbrand);
    }

    @Override
    public Collectbrand flagcollectbrand(int userid, String brandname) {
        return iUserDao.flagcollectbrand(userid,brandname);
    }

    @Override
    public List<Collectbrand> findcollectbrand(int currentpage,int userid) {
        PageHelper.startPage(currentpage,8);
        return iUserDao.findcollectbrand(userid);
    }

    @Override
    public List<Clothes> findtopClothes() {
        List<Clothes> houseViews=new ArrayList<>();
        Map<String,String> houseIds=jedis.hgetAll("clothesname");
        Map<String, Integer> map = new HashMap<>();
        for (String key : houseIds.keySet()) {
            String s = houseIds.get(key);
            int i = Integer.parseInt(s);
            map.put(key,i);
        }
        List<Map.Entry<String,Integer>> list = new ArrayList(map.entrySet());
        Collections.sort(list, (o1, o2) -> (o2.getValue() - o1.getValue()));
        for (int i=0;i<4;i++){
            Map.Entry<String, Integer> stringIntegerEntry = list.get(i);
            String image = stringIntegerEntry.getKey();
            Clothes clothes=iUserDao.findByimage(image);
            houseViews.add(clothes);
        }
        return houseViews;
    }

}
