package com.l.pojo;

import java.util.List;

/**
 * Created by c on 2020/3/28.
 * �ֿ�
 */
public class Save {
    private int sID;
    private int sNsave;
    private int sTsave;
    private String sAddr;
    private String sExplain;
    private int sStatus;
    private String goods;
    private List<?> good;

    public int getsID() {
        return sID;
    }

    public void setsID(int sID) {
        this.sID = sID;
    }

    public int getsNsave() {
        return sNsave;
    }

    public void setsNsave(int sNsave) {
        this.sNsave = sNsave;
    }

    public int getsTsave() {
        return sTsave;
    }

    public void setsTsave(int sTsave) {
        this.sTsave = sTsave;
    }

    public String getsAddr() {
        return sAddr;
    }

    public void setsAddr(String sAddr) {
        this.sAddr = sAddr;
    }

    public String getsExplain() {
        return sExplain;
    }

    public void setsExplain(String sExplain) {
        this.sExplain = sExplain;
    }

    public int getsStatus() {
        return sStatus;
    }

    public void setsStatus(int sStatus) {
        this.sStatus = sStatus;
    }

    public String getGoods() {
        return goods;
    }

    public void setGoods(String goods) {
        this.goods = goods;
    }

    public List<?> getGood() {
        return good;
    }

    public void setGood(List<?> good) {
        this.good = good;
    }
}
