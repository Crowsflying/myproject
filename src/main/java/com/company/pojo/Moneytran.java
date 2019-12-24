package com.company.pojo;

public class Moneytran {
    private int accountid;
    private int userid;
    private String accounttype;
    private int transaction;
    private String accounttime;
    private int balance;
    private int thatbalance;

    public int getAccountid() {
        return accountid;
    }

    public void setAccountid(int accountid) {
        this.accountid = accountid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getAccounttype() {
        return accounttype;
    }



    public void setAccounttype(String accounttype) {
        this.accounttype = accounttype;
    }

    public int getTransaction() {
        return transaction;
    }

    public int getThatbalance() {
        return thatbalance;
    }

    public void setThatbalance(int thatbalance) {
        this.thatbalance = thatbalance;
    }

    public void setTransaction(int transaction) {
        this.transaction = transaction;
    }

    public String getAccounttime() {
        return accounttime;
    }

    public void setAccounttime(String accounttime) {
        this.accounttime = accounttime;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "Moneytran{" +
                "accountid=" + accountid +
                ", userid=" + userid +
                ", accounttype='" + accounttype + '\'' +
                ", transaction=" + transaction +
                ", accounttime=" + accounttime +
                ", balance=" + balance +
                ", thatbalance=" + thatbalance +
                '}';
    }
}
