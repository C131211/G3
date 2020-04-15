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
    public GResult dealInListById(String ILID,int orderOinion,String ILComfirm){
        GResult gResult = new GResult();
        try {
            gResult = inListService.updInListById(ILID, orderOinion,ILComfirm);
        } catch (Exception e) {
            gResult.setMsg(e.toString());
            e.printStackTrace();
        }
        return gResult;
    }


    /**
     * 根据经手人获取订单信息，可按时间段搜索
     * @return
     */
    @RequestMapping("/getInListByILBy")
    @ResponseBody
    public DataGrid getInListByILBy(int page,int rows,String ILBy,@RequestParam(defaultValue = "0") String startTime,@RequestParam(defaultValue = "now()")String endTime){
        return inListService.selInListByILBy(page, rows, ILBy, startTime, endTime);
    }

    /**
     * 仓库统计
     * @param page
     * @param rows
     * @param goodName
     * @param sID
     * @param startTime
     * @param endTime
     * @return
     */
    public DataGrid getSaveInList(int page, int rows, String goodName, int sID,@RequestParam(defaultValue = "0") String startTime,@RequestParam(defaultValue = "now()") String endTime){
        return inListService.selSaveInList(page, rows, goodName, sID, startTime, endTime);
    }


}
