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
    GResult insOutList(String  olPrice,String  olNum,String olDestin,String olBy,String olComfirm,int sID,String goodName,String supName);

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

    /**
     * 根据订单id修改信息，更新仓库和货物信息
     * @return
     */
    GResult updOutListById(String olId,int orderOinion) throws Exception;


    /**
     * 根据经手人查询，可按时间段查询
     * @param page
     * @param rows
     * @param olBy
     * @param startTime
     * @param endTime
     * @return
     */
    DataGrid selOutListByILBy(int page,int rows,String olBy,String olComfirm,String olDestin,String goodName,String sID,String startTime,String endTime);

    /**
     * 仓库统计
     * @param page
     * @param rows
     * @param goodName
     * @param sID
     * @param startTime
     * @param endTime
     * @return
     */
    DataGrid selSaveOutList(int page,int rows,String goodName,String sID,String startTime,String endTime);


}
