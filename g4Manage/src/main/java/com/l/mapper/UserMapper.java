package com.l.mapper;

import com.l.pojo.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 数据层接口
 */
public interface UserMapper {


    /**
     * 登录校验 根据工号和密码查询是否又该用户
     * @param uAccount 工号
     * @param uPwd 密码
     * @return
     */
    @Select("select * from user where uAccount=#{0} and uPwd =#{1}")
    User selUserByPwd(String uAccount,String uPwd );


    /**
     * 根据Id修改用户信息
     * @param user(根据传入的user做不同的修改)
     * @return
     */
    int updUserById(User user);

    /**
     * 根据Id修改头像路径
     * @param uPhoto
     * @return
     */
    int updUserHeadImgById(String uPhoto,int uID);


    /**
     * 通过id查找该用户
     * @param uID
     * @return
     */
    User selUserById(int uID);

    /**
     * 添加用户
     * @param user
     * @return
     */
    int insUser(User user);


    /**
     * 分页查询用户
     * @return
     */
    List<User> selAllUser(User user);

}
