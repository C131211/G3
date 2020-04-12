package com.l.pojo;

public class Supply {

    private int supId;
    private String supName;
    private String supIncharge;
    private String supTel;


    @Override
    public String toString() {
        return "Supply{" +
                "supId=" + supId +
                ", supName='" + supName + '\'' +
                ", supIncharge='" + supIncharge + '\'' +
                ", supTel='" + supTel + '\'' +
                '}';
    }

    public int getSupId() {
        return supId;
    }

    public void setSupId(int supId) {
        this.supId = supId;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public String getSupIncharge() {
        return supIncharge;
    }

    public void setSupIncharge(String supIncharge) {
        this.supIncharge = supIncharge;
    }

    public String getSupTel() {
        return supTel;
    }

    public void setSupTel(String supTel) {
        this.supTel = supTel;
    }

    public Supply() {
    }
}
