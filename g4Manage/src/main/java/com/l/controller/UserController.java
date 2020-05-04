package com.l.controller;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.User;
import com.l.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * 用户控制
 */
@Controller
public class UserController {

    @Value("${headImgPath}")
    private String filePath;

    @Resource
    private UserService userService;


    @RequestMapping("/login")
    public String login(String uAccount, String uPwd, HttpServletRequest req){
        GResult result = new GResult();
        User user = userService.selUserByPwd(uAccount, uPwd);
        HttpSession session = req.getSession();
        //判断是否存在用户
        if (user!=null) {
            //用户是否被锁定
            if (user.getuStatus() == 1) {
                //正常
                if ( user.getrID() == 0) {//超级管理员
                    //存在
                    result.setStatus(200);
                    result.setMsg("登录成功");
                    result.setData(user);
                    session.setAttribute("result", result);
                    return "redirect:/frame.jsp";
                } else if ( user.getrID() == 1) {//仓管员
                    //存在
                    result.setStatus(200);
                    result.setMsg("登录成功");
                    result.setData(user);
                    session.setAttribute("result", result);
                    return "redirect:/manage.jsp";
                } else if ( user.getrID() == 2) {//运输员
                    //存在
                    result.setStatus(200);
                    result.setMsg("登录成功");
                    result.setData(user);
                    session.setAttribute("result", result);
                    return "redirect:/trans.jsp";
                }  else {//其他新增
                    result.setStatus(200);
                    result.setMsg("登录成功");
                    result.setData(user);
                    session.setAttribute("result", result);
                    return "redirect:extraRole.jsp";
                }
            }else {
                result.setMsg("用户已被禁用，请联系管理员");
                req.setAttribute("result",result);
                return "/index.jsp";
            }
        }else {
            //空的
            result.setMsg("用户名或者密码错误");
            req.setAttribute("result",result);
            return "/index.jsp";
        }

    }


    /**
     * 更改用户信息
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    @ResponseBody
    public GResult updateUser(User user,HttpServletRequest req){
        HttpSession session = req.getSession();
        GResult result = userService.updUserById(user);
        ((GResult) session.getAttribute("result")).setData(result.getData());
        return result;
    }

    /**
     * 上传头像
     * @param file
     * @param req
     * @return
     */
    @RequestMapping("/uploadHeadImg")
    @ResponseBody
    public GResult uploadHeadImg(MultipartFile file,HttpServletRequest req){
        String fileName  = file.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        String uPhoto;
        HttpSession session = req.getSession();
        User user = (User) ((GResult)session.getAttribute("result")).getData();
        GResult result = null;
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(filePath +"/"+ user.getuID() + suffix));
            uPhoto =  user.getuID() + suffix;
             result = userService.updUserHeadImgById(uPhoto, user.getuID());
            ((GResult) session.getAttribute("result")).setData(result.getData());
            return result;
        } catch (IOException e) {
            e.printStackTrace();
            result.setMsg("上传失败");
            return result;
        }
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    @ResponseBody
    public GResult addUser(User user){
        return userService.insUser(user);
    }

    /**
     * 查询用户信息，可根据用户名查询，如没用户名传入即查找所有用户
     * @param user
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/userList")
    @ResponseBody
    public DataGrid showUserManage(User user,@RequestParam(defaultValue = "1")int page, @RequestParam(defaultValue = "3")int rows){
        DataGrid dataGrid = userService.selAllUser(user, page, rows);
        return dataGrid;
    }


    /**
     * 根据id查询该用户
     * @return
     */
    @RequestMapping("/selUserById")
    @ResponseBody
    public GResult selUserById(int uID){
        return  userService.selUserById(uID);
    }




    /**
     * 管理编辑用户信息
     * @param user
     * @return
     */
    @RequestMapping("/editUser")
    @ResponseBody
    public GResult editUser(User user,HttpServletRequest req){
        HttpSession session = req.getSession();
        GResult result = userService.updEditUserById(user);
        ((GResult) session.getAttribute("result")).setData(result.getData());
        return result;
    }

    /**
     * 根据id删除该用户
     * @return
     */
    @RequestMapping("userDelById")
    @ResponseBody
    public GResult delUserById(int uID){
        return userService.delUserByID(uID);
    }

    /**
     * 获取可以确认订单的用户
     * @return
     */
    @RequestMapping("/getRoleUser")
    @ResponseBody
    public GResult getRoleUser(){
        return userService.selUserByRid();
    }

    /**
     * 注销
     * @param req
     * @return
     */
    @RequestMapping("/quitSys")
    public String quitUser(HttpServletRequest req){
        HttpSession session = req.getSession();
        session.invalidate();
        return "redirect:index.jsp";
    }

}
