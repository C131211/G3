package com.l.controller;

import com.l.commons.pojo.GResult;
import com.l.service.OutListService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by c on 2020/4/12.
 */
@Controller
public class OutListController {
    @Resource
    private OutListService outListService;

    @RequestMapping("/addOutList")
    @ResponseBody
    public GResult addOutList(String  olPrice,String  olNum,String olDestin,String olBy,String olComfirm,int sID,String goodName){
        return outListService.insOutList(olPrice, olNum, olDestin, olBy, olComfirm, sID, goodName);
    }

}
