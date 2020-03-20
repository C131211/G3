package com.l.controller;

import com.l.commons.pojo.GResult;
import com.l.pojo.User;
import com.l.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 自动补全是 alt+ctrl +v
 */
@Controller
public class UserController {

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






}
