package com.company.dao;

import com.company.bean.*;
import com.company.pojo.Brandclothes;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserDao {
    List<Employee> findEmployee();
    List<History> findHistory();
    List<Employee> findAllem();
    void deleteusername(String username);
    Employee findByUsername(String username);
    void updateEmployee(Employee employee);
    void insertEmployee(Employee employee);
    User login(String username);
    List<Clothes> findpageClothes(@Param("type") int type, @Param("num") int num);
    Clothes findmaninfo(@Param("type")int type,@Param("name") String name);
    List<Cart> findCart(int userid);
    int cartSettlement(int userid);
    Cart findoneCart(int id);
    void setCartnums(@Param("cartId")int cartId,@Param("nums")int nums);
    void buygood(Cart cart);
    void deletegoods(int id);
    void register(User user);
    List<Collect> findcollect(int userid);
    List<Collectbrand> findcollectbrand(int userid);
    Collect flagcollect(@Param("userid")int userid,@Param("name")String name);
    Collectbrand flagcollectbrand(@Param("userid")int userid,@Param("brandname")String brandname);
    void insertcollect(Collect collect);
    void insertcollectbrand(Collectbrand collectbrand);
    void deletecollect(int id);
    void deletecollectbrand(int id);
    List<Brandclothes> brandshop(String brand);
    void updatapassword(User user);
    void updataonself(User user);
    void updatePSbyPhone(User user);
    User findByPhone(String phone);
    List<Clothes> clothesBybrand(String brand);
    List<Clothes> clothesByprice(@Param("min")int min,@Param("price")int price);
    List<Clothes> findallClothes();
    Cart addCart(@Param("goodname")String goodname,@Param("attribute")String attribute,@Param("color")String color);
    void addCartnums(@Param("goodname") String goodname,@Param("attribute") String attribute,@Param("color") String color,@Param("nums") int nums);
    Cart findStock(int cartId);
    Clothes findByimage(String image);














}
