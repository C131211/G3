package com.l.pojo;

import java.util.Date;

/**
 * Created by c on 2020/3/29.
 */
public class Good {

    private String gID;
    private String gName;
    private int gNum;
    private int gInprice;
    private int gOutprice;
    private String gExplain;
    private Date gSatime;
    private int sID;
    private int gStatus;
    private String supName;


    @Override
    public String toString() {
        return "Good{" +
                "gID='" + gID + '\'' +
                ", gName='" + gName + '\'' +
                ", gNum=" + gNum +
                ", gInprice=" + gInprice +
                ", gOutprice=" + gOutprice +
                ", gExplain='" + gExplain + '\'' +
                ", gSatime=" + gSatime +
                ", sID=" + sID +
                ", gStatus=" + gStatus +
                ", supName='" + supName + '\'' +
                '}';
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public Good() {
    }

    public String getgID() {
        return gID;
    }

    public void setgID(String gID) {
        this.gID = gID;
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName;
    }

    public int getgNum() {
        return gNum;
    }

    public void setgNum(int gNum) {
        this.gNum = gNum;
    }

    public int getgInprice() {
        return gInprice;
    }

    public void setgInprice(int gInprice) {
        this.gInprice = gInprice;
    }

    public int getgOutprice() {
        return gOutprice;
    }

    public void setgOutprice(int gOutprice) {
        this.gOutprice = gOutprice;
    }

    public String getgExplain() {
        return gExplain;
    }

    public void setgExplain(String gExplain) {
        this.gExplain = gExplain;
    }

    public Date getgSatime() {
        return gSatime;
    }

    public void setgSatime(Date gSatime) {
        this.gSatime = gSatime;
    }

    public int getsID() {
        return sID;
    }

    public void setsID(int sID) {
        this.sID = sID;
    }

    public int getgStatus() {
        return gStatus;
    }

    public void setgStatus(int gStatus) {
        this.gStatus = gStatus;
    }
}
