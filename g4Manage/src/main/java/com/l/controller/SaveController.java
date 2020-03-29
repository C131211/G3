package com.l.controller;

import com.l.commons.pojo.GResult;
import com.l.pojo.Save;
import com.l.service.SaveService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by c on 2020/3/29.
 */
@Controller
public class SaveController {

    @Resource
    private SaveService saveService;

    /**
     * 获取未满仓库信息
     * @return
     */
    @RequestMapping("/getSaveName")
    @ResponseBody
    public GResult getSaveName(){
        return saveService.selAllSaveSName();
    }

    /**
     * 添加仓库
     * @param save
     * @return
     */
    @RequestMapping("/addSave")
    @ResponseBody
    public GResult addSave(Save save){
        return saveService.insSave(save);
    }







}
