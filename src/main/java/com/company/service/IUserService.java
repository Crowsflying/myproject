package com.company.service;

import com.company.bean.*;
import com.company.pojo.Brandclothes;


import java.util.List;

public interface IUserService {
    List<Employee> findEmployee();
    List<History> findHistory();
    List<Employee> findAllem(int currentpage);
    void deleteusername(String username);
    Employee findByUsername(String username);
    void updateEmployee(Employee employee);
    void insertEmployee(Employee employee);
    boolean login(User user);
    User findUser(String username);
    List<Clothes> findpageClothes(int type,int num);
    Clothes findmaninfo(int type,String name);
    List<Cart> findCart(int currentpage,int userid);
    List<Cart> findAllCart(int userid);
    List<Cart> settlement(int userid);
    Cart findoneCart(int id);
    int cartSettlement(int userid);
    void setCartnums(int cartId,int nums);
    void buygood(Cart cart);
    void deletegoods(int id);
    void register(User user);
    List<Collect> findcollect(int currentpage,int userid);
    void insertcollect(Collect collect);
    Collect flagcollect(int userid,String name);
    void deletecollect(int id);
    void deletecollectbrand(int id);
    List<Brandclothes> brandshop(String brand);
    void updatapassword(User user);
    void updataonself(User user);
    void updatePSbyPhone(User user);
    User findByPhone(String phone);
    List<Clothes> clothesBybrand(String brand);
    List<Clothes> clothesByprice(int min,int price);
    List<Clothes> findallClothes();
    Cart addCart(String goodname,String attribute,String color);
    void addCartnums(String goodname,String attribute,String color,int nums);
    Cart findStock(int cartId);
    void insertcollectbrand(Collectbrand collectbrand);
    Collectbrand flagcollectbrand(int userid,String brandname);
    List<Collectbrand> findcollectbrand(int currentpage,int userid);
    List<Clothes> findtopClothes();
}
