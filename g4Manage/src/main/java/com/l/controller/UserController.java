package com.l.controller;

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
    public GResult updateUser(User user){
        return userService.updUserById(user);
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
            return result;
        } catch (IOException e) {
            e.printStackTrace();
            result.setMsg("上传失败");
            return result;
        }
    }





}
