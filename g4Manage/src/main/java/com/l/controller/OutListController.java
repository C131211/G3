package com.l.controller;

import com.l.commons.pojo.DataGrid;
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


    /**
     * 查询指定为空或者自己的 未处理的入库单
     * @param olComfirm
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/getNotDealOutList")
    @ResponseBody
    public DataGrid getNotDealInList(String olComfirm, int page, int rows){
        return outListService.selNoDeal(olComfirm, page, rows);
    }

    /**
     * 根据id获取该订单信息
     * @param olId
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/getOutListById")
    @ResponseBody
    public DataGrid getInListById(String olId,int page,int rows){
        return outListService.selOutListById(olId, page, rows);
    }



}
