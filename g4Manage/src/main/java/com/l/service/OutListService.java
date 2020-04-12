package com.l.service;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;

/**
 * Created by c on 2020/4/12.
 */
public interface OutListService {
    /**
     * 添加出库单
     * @param olPrice
     * @param olNum
     * @param olDestin
     * @param olBy
     * @param olComfirm
     * @param sID
     * @param goodName
     * @return
     */
    GResult insOutList(String  olPrice,String  olNum,String olDestin,String olBy,String olComfirm,int sID,String goodName);

    /**
     * 查询未处理的出库单
     * @param olComfirm
     * @param page
     * @param rows
     * @return
     */
    DataGrid selNoDeal(String olComfirm,int page,int rows);

    /**
     * 根据id显示订单的信息
     * @param olId
     * @return
     */
    DataGrid selOutListById(String olId,int page,int rows);
}