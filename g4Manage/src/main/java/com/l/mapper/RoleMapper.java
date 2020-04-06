package com.l.mapper;

import com.l.pojo.InList;
import com.l.pojo.Role;

import java.util.List;

/**
 * Created by c on 2020/3/29.
 */
public interface RoleMapper {

    /**
     * 查询所有的角色
     * @return
     */
    List<Role> selAllRole();

    /**
     * 增加角色
     * @param role
     * @return
     */
    int insRole(Role role);


}
