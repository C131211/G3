package com.l.service;

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

}
