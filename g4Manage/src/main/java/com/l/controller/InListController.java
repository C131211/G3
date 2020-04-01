package com.l.controller;

import com.l.commons.pojo.GResult;
import com.l.service.InListService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by c on 2020/3/31.
 */
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

}
