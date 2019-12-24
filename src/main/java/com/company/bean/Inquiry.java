package com.company.bean;

public class Inquiry {
  private int  inquiryid;
  private int userid ;
  private String configure ;
  private String material;
  private String type ;
  private int thickness ;
  private String color ;
  private String working;
  private int num ;
  private String time;
  private int price;

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getInquiryid() {
        return inquiryid;
    }

    public void setInquiryid(int inquiryid) {
        this.inquiryid = inquiryid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getConfigure() {
        return configure;
    }

    public void setConfigure(String configure) {
        this.configure = configure;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getThickness() {
        return thickness;
    }

    public void setThickness(int thickness) {
        this.thickness = thickness;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getWorking() {
        return working;
    }

    public void setWorking(String working) {
        this.working = working;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "Inquiry{" +
                "inquiryid=" + inquiryid +
                ", userid=" + userid +
                ", configure='" + configure + '\'' +
                ", material='" + material + '\'' +
                ", type='" + type + '\'' +
                ", thickness=" + thickness +
                ", color='" + color + '\'' +
                ", working='" + working + '\'' +
                ", num=" + num +
                ", time='" + time + '\'' +
                ", price=" + price +
                '}';
    }
}
