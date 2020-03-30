package com.l.pojo;

import java.util.List;

/**
 * Created by c on 2020/3/28.
 * 仓库
 */
public class Save {
    private int sID;
    private int sNsave;
    private String sName;
    private int sTsave;
    private String sAddr;
    private String sExplain;
    private int sStatus;
    private String goods;
    private List<Good> good;

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

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

    public List<Good> getGood() {
        return good;
    }

    public void setGood(List<Good> good) {
        this.good = good;
    }
}
