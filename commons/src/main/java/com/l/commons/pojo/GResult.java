package com.l.commons.pojo;

/**
 * 结果集
 */
public class GResult {

    //状态码
    private int status;
    //对象
    private Object data;
    //消息
    private String msg;

    public GResult() {
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
