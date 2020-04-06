package com.l.pojo;

public class Role {
    private int rID;
    private String rName;
    private String rExplain;
    private int rStatus;

    @Override
    public String toString() {
        return "Role{" +
                "rID=" + rID +
                ", rName='" + rName + '\'' +
                ", rExplain='" + rExplain + '\'' +
                ", rStatus=" + rStatus +
                '}';
    }

    public Role() {
    }

    public int getrID() {
        return rID;
    }

    public void setrID(int rID) {
        this.rID = rID;
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName;
    }

    public String getrExplain() {
        return rExplain;
    }

    public void setrExplain(String rExplain) {
        this.rExplain = rExplain;
    }

    public int getrStatus() {
        return rStatus;
    }

    public void setrStatus(int rStatus) {
        this.rStatus = rStatus;
    }
}
