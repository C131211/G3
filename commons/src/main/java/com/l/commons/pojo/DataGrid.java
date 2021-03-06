package com.l.commons.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * Created by c on 2019/12/20.
 */
public class DataGrid implements Serializable{

    private int code;
    private String msg;
    //总条数
    private long count;

    //当前页显示数据
    private List<?> data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }
}
