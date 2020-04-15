package com.l.controller;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.Role;
import com.l.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
public class RoleController {
    @Resource
    private RoleService roleService;

    /**
     * 分页查询所有都角色
     *
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/getAllRole")
    @ResponseBody
    public DataGrid getAllRole(int page, int rows) {
        DataGrid dataGrid = roleService.selAllRole(page, rows);
        return dataGrid;
    }

    /**
     *
     * 添加角色
     * @param role
     * @return
     */
    @RequestMapping("/addRole")
    @ResponseBody
    public GResult addRole(Role role) {
        return roleService.insRole(role);
    }


    /**
     *
     *删除角色
     * @param rID
     * @return
     */
    @RequestMapping("/delRoleById")
    @ResponseBody
    public GResult delRoleById(int rID) {
        return roleService.delRole(rID);
    }


}
