package com.l.pojo;

/**
 * Created by c on 2020/3/28.
 */
public class GoodList {
    private int glId;
    private String goodName;

    public GoodList() {
    }

    @Override
    public String toString() {
        return "GoodList{" +
                "glId=" + glId +
                ", goodName='" + goodName + '\'' +
                '}';
    }

    public int getGlId() {
        return glId;
    }

    public void setGlId(int glId) {
        this.glId = glId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }
}
