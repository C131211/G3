package com.l.service.impl;

import com.l.commons.pojo.GResult;
import com.l.service.UserService;
import com.l.mapper.UserMapper;
import com.l.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;



@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;


    @Override
    public GResult selUserByPwd(String uAccount, String uPwd)  {

        User user = userMapper.selUserByPwd(uAccount, uPwd);
        //创建结果集
        GResult result = new GResult();

        //判断该用户是否存在
        if (user==null){
            //不存在
            result.setMsg("用户名或者密码错误");
            return result;
        }else {
            //存在
            //修改日期格式
            result.setStatus(200);
            result.setMsg("登录成功");
            result.setData(user);
            return result;
        }

    }

    @Override
    public GResult updUserById(User user) {
        int index = -1;
        GResult result = new GResult();
        index  = userMapper.updUserById(user);
        if(index>0){
            //成功修改
            User user1 = userMapper.selUserById(user.getuID());
            result.setStatus(200);
            result.setMsg("OK");
            result.setData(user1);
            return result;
        }else {
            result.setMsg("修改失败");
            return result;
        }
    }

    @Override
    public GResult updUserHeadImgById(String uPhoto, int uID) {
        int index = -1;
        GResult result = new GResult();
        index = userMapper.updUserHeadImgById(uPhoto, uID);
        User user = userMapper.selUserById(uID);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
            result.setData(user);
            return result;
        }else {
            result.setMsg("上传失败");
            return result;
        }
    }
}
