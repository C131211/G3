package com.l.service;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.Role;

public interface RoleService {
    /**
     * 分页查询所有的角色
     * @return
     */
    DataGrid selAllRole(int page,int rows);

    GResult insRole(Role role);

    /**
     * 删除角色
     * @param rID
     * @return
     */
    GResult delRole(int rID);

}
