package com.l.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 实体类 用户
 * 快捷键 alt+ins
 *快速构造方法 get set方法
 */
public class User {

    private int uID;
    private String uAccount;
    private String uPwd;
    private String uName;
    private String uTel;
    private String uAddr;
    private String uPhoto;
    private Date uHiredate;
    private int rID;
    private int uStatus;

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "uID=" + uID +
                ", uAccount='" + uAccount + '\'' +
                ", uPwd='" + uPwd + '\'' +
                ", uName='" + uName + '\'' +
                ", uTel='" + uTel + '\'' +
                ", uAddr='" + uAddr + '\'' +
                ", uPhoto='" + uPhoto + '\'' +
                ", uHiredate=" + uHiredate +
                ", rID=" + rID +
                ", uStatus=" + uStatus +
                '}';
    }

    public String getuAddr() {
        return uAddr;
    }

    public void setuAddr(String uAddr) {
        this.uAddr = uAddr;
    }

    public String getuPhoto() {
        return uPhoto;
    }

    public void setuPhoto(String uPhoto) {
        this.uPhoto = uPhoto;
    }



    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public String getuAccount() {
        return uAccount;
    }

    public void setuAccount(String uAccount) {
        this.uAccount = uAccount;
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuTel() {
        return uTel;
    }

    public void setuTel(String uTel) {
        this.uTel = uTel;
    }

    public Date getuHiredate() {
        return uHiredate;
    }

    public void setuHiredate(Date uHiredate) {
        this.uHiredate = uHiredate;
    }

    public int getrID() {
        return rID;
    }

    public void setrID(int rID) {
        this.rID = rID;
    }

    public int getuStatus() {
        return uStatus;
    }

    public void setuStatus(int uStatus) {
        this.uStatus = uStatus;
    }
}
