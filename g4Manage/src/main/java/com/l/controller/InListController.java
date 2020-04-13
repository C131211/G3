package com.l.controller;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.service.InListService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by c on 2020/3/31.
 */
@Controller
public class InListController {
    @Resource
    private InListService inListService;

    /**
     * 添加入库单
     * @param ILprice
     * @param ILNum
     * @param ILFrom
     * @param ILBy
     * @param sID
     * @param goodName
     * @return
     */
    @RequestMapping("/addInList")
    @ResponseBody
    public GResult addInList(String ILprice, String ILNum, String ILFrom, String ILBy, int sID, String goodName,@RequestParam(defaultValue = "")String ILComfirm){
        try {
            return inListService.insInList(ILprice, ILNum, ILFrom, ILBy, sID, goodName,ILComfirm);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 查询指定为空或者自己的 未处理的入库单
     * @param ILComfirm
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/getNotDealInList")
    @ResponseBody
    public DataGrid getNotDealInList(String ILComfirm,int page,int rows){
        return inListService.selNoDeal(ILComfirm, page, rows);
    }

    /**
     * 根据ID获取订单详情
     * @param ILID
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/getInListById")
    @ResponseBody
    public DataGrid getInListById(String ILID,int page,int rows){
        return inListService.selInListById(ILID, page, rows);
    }

    /**
     * 入库审核
     * @param ILID
     * @param orderOinion
     * @return
     */
    @RequestMapping("/dealInListById")
    @ResponseBody
    public GResult dealInListById(String ILID,int orderOinion){
        GResult gResult = new GResult();
        try {
            gResult = inListService.updInListById(ILID, orderOinion);
        } catch (Exception e) {
            gResult.setMsg(e.toString());
            e.printStackTrace();
        }
        return gResult;
    }

}
