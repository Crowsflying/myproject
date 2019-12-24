package com.company.bean;

public class History {
    private String name;
    private int amount;
    private String date;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    @Override
    public String toString() {
        return "History{" +
                "name='" + name + '\'' +
                ", amount=" + amount +
                ", date='" + date + '\'' +
                '}';
    }
}
