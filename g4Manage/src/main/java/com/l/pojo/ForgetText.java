package com.l.pojo;

/**
 * Created by c on 2020/4/14.
 */
public class ForgetText {
    private int fid;
    private String forget;
    private int uID;


    public ForgetText() {
    }

    @Override
    public String toString() {
        return "ForgetText{" +
                "fid=" + fid +
                ", forget='" + forget + '\'' +
                ", uID=" + uID +
                '}';
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getForget() {
        return forget;
    }

    public void setForget(String forget) {
        this.forget = forget;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }
}
