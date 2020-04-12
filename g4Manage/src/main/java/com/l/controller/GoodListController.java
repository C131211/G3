package com.l.controller;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.GoodList;
import com.l.service.GoodListService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by c on 2020/3/28.
 */
@Controller
public class GoodListController {
    @Resource
    private GoodListService goodListService;

    /**
     * 获取所有的货物类别
     * @return
     */
    @RequestMapping("/getGoodList")
    @ResponseBody
    public DataGrid getAllGoodList(int page,int rows){
        return goodListService.selAllGoodList(page, rows);
    }

    /**
     *增加类别
     * @param goodList
     * @return
     */
    @RequestMapping("/addGoodList")
    @ResponseBody
    public GResult addGoodList(GoodList goodList){
        return goodListService.insGoodList(goodList);
    }

    /**
     * 编辑类别
     * @param goodList
     * @return
     */
    @RequestMapping("/setGoodList")
    @ResponseBody
    public GResult setGoodList(GoodList goodList){
        return goodListService.updGoodListById(goodList);
    }

    /**
     * 删除类别
     * @param glId
     * @return
     */
    @RequestMapping("/delGoodList")
    @ResponseBody
    public GResult delGoodList(int glId){
        return goodListService.delGoodListById(glId);
    }

    @RequestMapping("/getGoodListById")
    @ResponseBody
    public GResult getGoodListById(int glId){
        return goodListService.selGoodListById(glId);
    }

    /**
     * 获取所有的货物类别
     * @return
     */
        @RequestMapping("/getAllGoodList")
    @ResponseBody
    public GResult getAllGoodList(HttpServletRequest req){
        HttpSession session = req.getSession();
        GResult result = goodListService.getAllGoodList();
        session.setAttribute("GoodListResult",result);
        return result;

    }


}
