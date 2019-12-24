package com.company.bean;

public class Collect {
    private int collectid;
    private int userid;
    private String collectname;
    private int price;
    private String image;

    public int getCollectid() {
        return collectid;
    }

    public void setCollectid(int collectid) {
        this.collectid = collectid;
    }

    public String getCollectname() {
        return collectname;
    }

    public void setCollectname(String collectname) {
        this.collectname = collectname;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "collectid=" + collectid +
                ", userid=" + userid +
                ", collectname='" + collectname + '\'' +
                ", price=" + price +
                ", image='" + image + '\'' +
                '}';
    }
}
