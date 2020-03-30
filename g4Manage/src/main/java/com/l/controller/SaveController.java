package com.l.controller;

import com.l.commons.pojo.DataGrid;
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


    /**
     * 分页查询所有的仓库信息
     * @param save
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/getAllSave")
    @ResponseBody
    public DataGrid getAllSave(Save save,int page,int rows){
        return saveService.selAllSave(save, page, rows);
    }

    /**
     * 根据id删除仓库
     * @param sID
     * @return
     */
    @RequestMapping("/delSave")
    @ResponseBody
    public GResult delSave(int sID){
        return saveService.delSave(sID);
    }

    /**
     * 修改仓库信息
     * @param save
     * @return
     */
    @RequestMapping("/editSave")
    @ResponseBody
    public GResult updSave(Save save){
        return saveService.updSave(save);
    }




}
