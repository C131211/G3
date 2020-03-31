package com.l.pojo;

import java.util.Date;

/**
 * Created by c on 2020/3/31.
 * 入库单
 */
public class InList {
    private String ILID;
    private String gID;
    private int ILprice;
    private  int ILNum;
    private int ILTotal;
    private Date ILDate;
    //供货商
    private String ILFrom;
    //经手人
    private String ILBy;
    //确认人
    private String ILComfirm;

    private int sID;

    private int ILStatus;

    private String goodName;

    public InList() {
    }

    public String getILID() {
        return ILID;
    }

    public void setILID(String ILID) {
        this.ILID = ILID;
    }

    public String getgID() {
        return gID;
    }

    public void setgID(String gID) {
        this.gID = gID;
    }

    public int getILprice() {
        return ILprice;
    }

    public void setILprice(int ILprice) {
        this.ILprice = ILprice;
    }

    public int getILNum() {
        return ILNum;
    }

    public void setILNum(int ILNum) {
        this.ILNum = ILNum;
    }

    public int getILTotal() {
        return ILTotal;
    }

    public void setILTotal(int ILTotal) {
        this.ILTotal = ILTotal;
    }

    public Date getILDate() {
        return ILDate;
    }

    public void setILDate(Date ILDate) {
        this.ILDate = ILDate;
    }

    public String getILFrom() {
        return ILFrom;
    }

    public void setILFrom(String ILFrom) {
        this.ILFrom = ILFrom;
    }

    public String getILBy() {
        return ILBy;
    }

    public void setILBy(String ILBy) {
        this.ILBy = ILBy;
    }

    public String getILComfirm() {
        return ILComfirm;
    }

    public void setILComfirm(String ILComfirm) {
        this.ILComfirm = ILComfirm;
    }

    public int getsID() {
        return sID;
    }

    public void setsID(int sID) {
        this.sID = sID;
    }

    public int getILStatus() {
        return ILStatus;
    }

    public void setILStatus(int ILStatus) {
        this.ILStatus = ILStatus;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }
}
