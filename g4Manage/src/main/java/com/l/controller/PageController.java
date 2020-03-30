package com.l.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

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
        public String PageJump(int id,String pageType, HttpServletRequest req){
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
            }else if (pageType.equals("goodDetails")){
                req.setAttribute("gid",id);
                return "";
            }
            else {
                return "/tgls/error/error_canshu.jsp";
            }
        }



}
