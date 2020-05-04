package com.l.controller;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.service.GoodService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
@Controller
public class GoodController {
    @Resource
    private GoodService goodService;
    @RequestMapping("/getGoods")
    @ResponseBody
    public DataGrid getGoods(int page, int rows, String gName, String sID, String supName){
        return goodService.selGoods(page,rows,gName, sID, supName);
    }


}
