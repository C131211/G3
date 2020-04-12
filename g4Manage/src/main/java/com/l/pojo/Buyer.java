package com.l.pojo;

/**
 * Created by c on 2020/4/12.
 */
public class Buyer {

    private int buyId;
    private String buyName;
    private String buyIncharge;
    private String buyTel;

    @Override
    public String toString() {
        return "Buyer{" +
                "buyId=" + buyId +
                ", buyName='" + buyName + '\'' +
                ", buyIncharge='" + buyIncharge + '\'' +
                ", buyTel='" + buyTel + '\'' +
                '}';
    }

    public Buyer() {
    }

    public int getBuyId() {
        return buyId;
    }

    public void setBuyId(int buyId) {
        this.buyId = buyId;
    }

    public String getBuyName() {
        return buyName;
    }

    public void setBuyName(String buyName) {
        this.buyName = buyName;
    }

    public String getBuyIncharge() {
        return buyIncharge;
    }

    public void setBuyIncharge(String buyIncharge) {
        this.buyIncharge = buyIncharge;
    }

    public String getBuyTel() {
        return buyTel;
    }

    public void setBuyTel(String buyTel) {
        this.buyTel = buyTel;
    }
}
