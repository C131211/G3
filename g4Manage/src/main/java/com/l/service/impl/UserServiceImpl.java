package com.l.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.service.UserService;
import com.l.mapper.UserMapper;
import com.l.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;


    @Override
    public User selUserByPwd(String uAccount, String uPwd)  {
    return userMapper.selUserByPwd(uAccount, uPwd);
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

    @Override
    public GResult insUser(User user) {
        GResult result = new GResult();
        user.setuHiredate(new Date());
        int index = -1;
        index = userMapper.insUser(user);
        if (index>0){
            result.setStatus(200);
            result.setMsg("OK");
            return result;
        }else {
            result.setMsg("添加失败");
            return result;
        }
    }

    @Override
    public DataGrid selAllUser(User user,int page,int rows) {
        PageHelper.startPage(page, rows);


        //如果传进来的user为空，即查询所有的用户
        if (user.getuName()==null||user.getuName().equals("")){
            List<User> list = userMapper.selAllUser(user);
            PageInfo<User> pi = new PageInfo<>(list);
            DataGrid dataGrid = new DataGrid();
            dataGrid.setData(pi.getList());
            dataGrid.setCount(pi.getTotal());
            dataGrid.setCode(0);
            dataGrid.setMsg("OK");
            return dataGrid;
        }else{
            //如果user有内容，做用户名的查询，并把username做高亮处理
            //查询的字段
            String str0 = user.getuName();
            //替换成红色
            String  str = "<span style='color:red'>"+str0+"</span>";
            List<User> list = userMapper.selAllUser(user);
            for(User userList:list){
                userList.setuName(userList.getuName().replace(str0, str));
            }
            PageInfo<User> pi = new PageInfo<>(list);
            DataGrid dataGrid = new DataGrid();
            dataGrid.setData(pi.getList());
            dataGrid.setCount(pi.getTotal());
            dataGrid.setCode(0);
            dataGrid.setMsg("OK");
            return dataGrid;
        }

    }

    @Override
    public GResult selUserById(int uID) {
        User user = userMapper.selUserById(uID);
        GResult result = new GResult();
        if (user!=null){
            result.setMsg("OK");
            result.setStatus(200);
            result.setData(user);
        }else {
            result.setMsg("error");
        }


        return result;
    }

    @Override
    public GResult updEditUserById(User user) {
        int index = -1;
        GResult result = new GResult();
        index  = userMapper.updUserManageById(user);
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
    public GResult delUserByID(int uID) {
        int index = -1;
        index = userMapper.delUserById(uID);
        GResult result = new GResult();
        if(index>0){
            result.setStatus(200);
            result.setMsg("OK");
            return result;
        }else {
            result.setMsg("修改失败");
            return result;
        }
    }

    @Override
    public GResult selUserByRid() {
        GResult result = new GResult();
        List<User> list = userMapper.selUserByRid();
        if (list!=null && list.size()>0){
            result.setMsg("OK");
            result.setStatus(200);
            result.setData(list);
        }else {
            result.setMsg("没有合符要求的用户");
        }
        return result;
    }

    @Override
    public GResult selUsers() {
        GResult result = new GResult();
        List<User> list = userMapper.selAllUser(null);
        if (list!=null && list.size()>0){
            result.setMsg("OK");
            result.setStatus(200);
            result.setData(list);
        }else {
            result.setMsg("没有合符要求的用户");
        }
        return result;
    }
}
