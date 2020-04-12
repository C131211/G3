package com.l.mapper;

import com.l.pojo.OutList;

import java.util.List;

/**
 * Created by c on 2020/4/12.
 */
public interface OutListMapper {
    /**
     * 添加出库单
     * @param outList
     * @return
     */
    int insOutList(OutList outList);

    /**
     * 查询未处理的出库单
     * @param olComfirm
     * @return
     */
    List<OutList> selNoDeal(String olComfirm);


    /**
     * 根据订单Id获取订单信息
     * @param olId
     * @return
     */
    List<OutList> selOutListById(String olId);

}
