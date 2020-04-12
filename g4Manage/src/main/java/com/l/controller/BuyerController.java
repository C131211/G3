package com.l.controller;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.Buyer;
import com.l.service.BuyerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by c on 2020/4/12.
 */
@Controller
public class BuyerController {

    @Resource
    private BuyerService buyerService;

    /**
     * 分页显示经销商信息
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/getAllBuyerPage")
    @ResponseBody
    public DataGrid getAllBuyerPage(int page, int rows){
        return buyerService.selAllBuyer(page, rows);
    }

    /**
     * 增加经销商
     * @param buyer
     * @return
     */
    @RequestMapping("/addBuyer")
    @ResponseBody
    public GResult addBuyer(Buyer buyer){
        return buyerService.insBuyer(buyer);
    }

    /**
     * 根据Id删除经销商
     * @param buyid
     * @return
     */
    @RequestMapping("/delBuyerById")
    @ResponseBody
    public GResult delBuyerById(int buyId){
        return buyerService.delBuyerById(buyId);
    }

    /**
     * 修改经销商信息
     * @param buyer
     * @return
     */
    @RequestMapping("/editBuyer")
    @ResponseBody
    public GResult editBuyer(Buyer buyer){
        return buyerService.updBuyer(buyer);
    }

    /**
     * 获取经销商信息
     * @return
     */
    @RequestMapping("/getBuyer")
    @ResponseBody
    public GResult getBuyer(HttpServletRequest req){
        HttpSession session = req.getSession();
        GResult result = buyerService.getBuyer();
        session.setAttribute("BuyerResult",result);
        return result;
    }

    /**
     * 根据id获取经销商信息
     * @param buyid
     * @return
     */
    @RequestMapping("/getBuyerById")
    @ResponseBody
    public GResult getBuyerById(int buyId){
        return buyerService.selBuyerById(buyId);
    }


}
