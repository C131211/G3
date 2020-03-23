package com.l.service;

import com.l.commons.pojo.ExDataGrid;
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
    ExDataGrid selAllUser(User user,int page,int rows);
    

}
