package com.l.controller;

import com.l.commons.pojo.GResult;
import com.l.pojo.ForgetText;
import com.l.service.ForgetTextService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by c on 2020/4/14.
 */
@Controller
public class ForgerTextController {
    @Resource
    private ForgetTextService forgetTextService;

    @RequestMapping("/getForgetText")
    @ResponseBody
    public GResult getForgetText(int uID){
        return forgetTextService.selForgetText(uID);
    }

    /**
     * 修改或者新增
     * @param forgetText
     * @return
     */
    @RequestMapping("/editForget")
    @ResponseBody
    public GResult editForget(ForgetText forgetText){
        return forgetTextService.updForgetText(forgetText);
    }



}
