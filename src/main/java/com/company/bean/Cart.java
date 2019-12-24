package com.company.bean;

public class Cart {
    int cartId;
    private int userid;
    private String goodsname;
    private String image;
    private String attribute;
    private int price;
    private int nums;
    private int stock;
    private String color;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNums() {
        return nums;
    }

    public void setNums(int nums) {
        this.nums = nums;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", userid=" + userid +
                ", goodsname='" + goodsname + '\'' +
                ", image='" + image + '\'' +
                ", attribute='" + attribute + '\'' +
                ", price=" + price +
                ", nums=" + nums +
                ", stock=" + stock +
                ", color='" + color + '\'' +
                '}';
    }


}
