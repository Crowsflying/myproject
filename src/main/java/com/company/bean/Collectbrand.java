package com.company.bean;

public class Collectbrand {
    private int brandid;
    private int userid;
    private String brandimage;
    private String brandname;

    public int getBrandid() {
        return brandid;
    }

    public void setBrandid(int brandid) {
        this.brandid = brandid;
    }

    public String getBrandimage() {
        return brandimage;
    }

    public void setBrandimage(String brandimage) {
        this.brandimage = brandimage;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "Collectbrand{" +
                "brandid=" + brandid +
                ", userid=" + userid +
                ", brandimage='" + brandimage + '\'' +
                ", brandname='" + brandname + '\'' +
                '}';
    }
}
