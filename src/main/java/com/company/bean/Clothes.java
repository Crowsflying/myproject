package com.company.bean;

public class Clothes {
    private String clothesname;
    private int price;
    private String shelftime;
    private String brand;
    private int sales;
    private int comment;
    private int follow;
    private String images;
    private String attribute;
    private int type;
    private int stock;

    public String getClothesname() {
        return clothesname;
    }

    public void setClothesname(String clothesname) {
        this.clothesname = clothesname;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getShelftime() {
        return shelftime;
    }

    public void setShelftime(String shelftime) {
        this.shelftime = shelftime;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public int getComment() {
        return comment;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

    public int getFollow() {
        return follow;
    }

    public void setFollow(int follow) {
        this.follow = follow;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "Clothes{" +
                "clothesname='" + clothesname + '\'' +
                ", price=" + price +
                ", shelftime='" + shelftime + '\'' +
                ", brand='" + brand + '\'' +
                ", sales=" + sales +
                ", comment=" + comment +
                ", follow=" + follow +
                ", images='" + images + '\'' +
                ", attribute='" + attribute + '\'' +
                ", type=" + type +
                ", stock=" + stock +
                '}';
    }
}
