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

    //访问的域名
    @RequestMapping("/login")
    public String login(String uAccount, String uPwd, HttpServletRequest req){
        GResult result = userService.selUserByPwd(uAccount, uPwd);
        HttpSession session = req.getSession();
        if (result.getData()!=null){
            session.setAttribute("result",result);
            return "redirect:/frame.jsp";
        }else {
            return "redirect:/index.jsp";
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
     * 控制页面跳转并且附带参数信息
     * @return
     */
    @RequestMapping("/userOperation")
    public String PageJump(int uID,String pageType,HttpServletRequest req){
        //跳到对应的页面
        if(pageType.equals("edit")){
            req.setAttribute("uID",uID);
            return "/tgls/agent/agent_update.jsp";
        }else {
            return "/tgls/agent/agent_error.jsp";
        }
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

}
