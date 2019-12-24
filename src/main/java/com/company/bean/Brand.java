package com.company.bean;

public class Brand {
    private int brandid;
    private String brand;
    private String brandimage;

    public int getBrandid() {
        return brandid;
    }

    public void setBrandid(int brandid) {
        this.brandid = brandid;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getBrandimage() {
        return brandimage;
    }

    public void setBrandimage(String brandimage) {
        this.brandimage = brandimage;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "brandid=" + brandid +
                ", brand='" + brand + '\'' +
                ", brandimage='" + brandimage + '\'' +
                '}';
    }
}
