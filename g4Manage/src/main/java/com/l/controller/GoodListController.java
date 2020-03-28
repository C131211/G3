package com.l.controller;

import com.l.commons.pojo.GResult;
import com.l.pojo.GoodList;
import com.l.service.GoodListService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by c on 2020/3/28.
 */
@Controller
public class GoodListController {
    @Resource
    private GoodListService goodListService;

    /**
     * ��ȡ���еĻ������
     * @return
     */
    @RequestMapping("/getGoodList")
    @ResponseBody
    public GResult getAllGoodList(){
        return goodListService.selAllGoodList();
    }

    /**
     *�������
     * @param goodName
     * @return
     */
    @RequestMapping("/addGoodList")
    @ResponseBody
    public GResult addGoodList(String goodName){
        return goodListService.insGoodList(goodName);
    }

    /**
     * �༭���
     * @param goodList
     * @return
     */
    @RequestMapping("/setGoodList")
    @ResponseBody
    public GResult setGoodList(GoodList goodList){
        return goodListService.updGoodListById(goodList);
    }

    /**
     * ɾ�����
     * @param glId
     * @return
     */
    @RequestMapping("/delGoodList")
    @ResponseBody
    public GResult delGoodList(int glId){
        return goodListService.delGoodListById(glId);
    }



}
