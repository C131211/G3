package com.l.pojo;

import java.util.Date;

/**
 * Created by c on 2020/4/12.
 */
public class OutList {

    private String olId;
    private Date olDate;
    private String gID;
    private int olPrice;
    private int olNum;
    private int olTotal;
    private String olDestin;
    private String olBy;
    private String olComfirm;
    private int sID;
    private int olStatus;
    private String goodName;
    private int orderOinion;
    private String supName;

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public int getOrderOinion() {
        return orderOinion;
    }

    public void setOrderOinion(int orderOinion) {
        this.orderOinion = orderOinion;
    }

    public String getOlId() {
        return olId;
    }

    public void setOlId(String olId) {
        this.olId = olId;
    }

    public Date getOlDate() {
        return olDate;
    }

    public void setOlDate(Date olDate) {
        this.olDate = olDate;
    }

    public String getgID() {
        return gID;
    }

    public void setgID(String gID) {
        this.gID = gID;
    }

    public int getOlPrice() {
        return olPrice;
    }

    public void setOlPrice(int olPrice) {
        this.olPrice = olPrice;
    }

    public int getOlNum() {
        return olNum;
    }

    public void setOlNum(int olNum) {
        this.olNum = olNum;
    }

    public int getOlTotal() {
        return olTotal;
    }

    public void setOlTotal(int olTotal) {
        this.olTotal = olTotal;
    }

    public String getOlDestin() {
        return olDestin;
    }

    public void setOlDestin(String olDestin) {
        this.olDestin = olDestin;
    }

    public String getOlBy() {
        return olBy;
    }

    public void setOlBy(String olBy) {
        this.olBy = olBy;
    }

    public String getOlComfirm() {
        return olComfirm;
    }

    public void setOlComfirm(String olComfirm) {
        this.olComfirm = olComfirm;
    }

    public int getsID() {
        return sID;
    }

    public void setsID(int sID) {
        this.sID = sID;
    }

    public int getOlStatus() {
        return olStatus;
    }

    public void setOlStatus(int olStatus) {
        this.olStatus = olStatus;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public OutList() {
    }
}
