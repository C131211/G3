package com.l.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * Created by c on 2020/3/28.
 */
@Controller
public class PageController {

        /**
         * 控制页面跳转并且附带参数信息
         * @return
         */
        @RequestMapping("/PageOperation")
        public String PageJump(String  id,String pageType, HttpServletRequest req){
            //跳到对应的页面
            if(pageType.equals("userEdit")){
                req.setAttribute("uID",id);
                return "/tgls/agent/agent_update.jsp";
            }else if(pageType.equals("glEdit")){
                req.setAttribute("glId",id);
                return "/tgls/goodlist/gl_update.jsp";
            }else if (pageType.equals("saveEdit")){
                req.setAttribute("sID",id);
                return "/tgls/saveManage/save_update.jsp";
            }else if(pageType.equals("supplyEdit")){
                req.setAttribute("supId",id);
                return "/tgls/supply/supply_update.jsp";
            }else if (pageType.equals("buyerEdit")){
                req.setAttribute("buyId",id);
                return "/tgls/buyer/buy_update.jsp";
            }else if (pageType.equals("inlistDetail")) {
                req.setAttribute("ILID", id);
                return "/tgls/inlist/Inorder_detail.jsp";
            }
            else if (pageType.equals("outlistDetail")) {
                req.setAttribute("olId", id);
                return "/tgls/outlist/outorder_detail.jsp";
            }
            else if (pageType.equals("saveDetail")) {
                req.setAttribute("sID", id);
                return "/tgls/good/good_detail.jsp";
            } else {
                return "/tgls/error/error_canshu.jsp";
            }
        }



}
