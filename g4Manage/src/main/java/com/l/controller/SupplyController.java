package com.l.controller;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.Supply;
import com.l.service.SupplyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by c on 2020/4/12.
 */
@Controller
public class SupplyController {
    @Resource
    private SupplyService supplyService;

    /**
     * 分页显示供应商信息
     * @param page
     * @param count
     * @return
     */
    @RequestMapping("/getAllSupplyPage")
    @ResponseBody
    public DataGrid getAllSupplyPage(int page,int count){
        return supplyService.selAllSupply(page, count);
    }

    /**
     * 增加供应商
     * @param supply
     * @return
     */
    @RequestMapping("/addSupply")
    @ResponseBody
    public GResult addSupply(Supply supply){
        return supplyService.insSupply(supply);
    }

    /**
     * 根据Id删除供应商
     * @param supId
     * @return
     */
    @RequestMapping("/delSupplyById")
    @ResponseBody
    public GResult delSupplyById(int supId){
        return supplyService.delSupplyById(supId);
    }

    /**
     * 修改供应商信息
     * @param supply
     * @return
     */
    @RequestMapping("/editSupply")
    @ResponseBody
    public GResult editSupply(Supply supply){
        return supplyService.updSupply(supply);
    }

    /**
     * 获取供应商信息
     * @return
     */
    @RequestMapping("/getSupply")
    @ResponseBody
    public GResult getSupply(){
        return supplyService.getSupply();
    }


}
