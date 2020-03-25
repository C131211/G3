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
    private long total;

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

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }
}
