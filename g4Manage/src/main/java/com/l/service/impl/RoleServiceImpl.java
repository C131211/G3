package com.l.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.mapper.RoleMapper;
import com.l.pojo.Role;
import com.l.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;

    @Override
    public DataGrid selAllRole(int page,int rows) {
        PageHelper.startPage(page, rows);
        List<Role> list = roleMapper.selAllRole();
        PageInfo<Role> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
    }

    @Override
    public GResult insRole(Role role) {
        int index = -1;
        GResult result = new GResult();
        index = roleMapper.insRole(role);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("添加失败");
        }

        return result;
    }

    @Override
    public GResult delRole(int rID) {
        int index = -1;
        GResult result = new GResult();
        index = roleMapper.delRoleById(rID);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("删除失败");
        }

        return result;
    }
}
