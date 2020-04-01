package com.l.service;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.User;

/**
 * 数据层接口
 */
public interface UserService {

    /**
     * 用户登录服务
     * @return
     */
    GResult selUserByPwd(String uAccount, String uPwd) ;


    /**
     * 修改用户信息，密码
     * @param user
     * @return
     */
    GResult updUserById(User user);


    /**
     * 根据uid修改头像
     * @param uPhoto
     * @param uID
     * @return
     */
    GResult updUserHeadImgById(String uPhoto,int uID);

    /**
     * 添加用户
     * @param user
     * @return
     */
    GResult insUser(User user);

    /**
     * 分页查询用户 可按用户姓名查询
     * @param user
     * @return
     */
    DataGrid selAllUser(User user,int page,int rows);


    /**
     * 根据id查找该用户
     * @param uID
     * @return
     */
    GResult selUserById(int uID);


    /**
     * 修改用户信息，密码
     * @param user
     * @return
     */
    GResult updEditUserById(User user);

    /**
     * 根据id删除用户
     * @param uID
     * @return
     */
    GResult delUserByID(int uID);

    /**
     * 跟据rId筛选出可以确认货单的用户
     * @return
     */
    GResult selUserByRid();

}
