package com.l.service;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.InList;

import java.util.List;

/**
 * Created by c on 2020/3/31.
 */
public interface InListService {
    /**
     * 添加入库单
     * @return
     */
    GResult insInList(String ILprice,String ILNum,String ILFrom,String ILBy,int sID,String goodName,String ILComfirm) throws Exception;

    /**
     * 查询所有未处理的入库单
     * @param ILComfirm
     * @return
     */
    DataGrid selNoDeal(String ILComfirm,int page,int rows);

    /**
     * 根据id显示订单的信息
     * @param ILID
     * @return
     */
    DataGrid selInListById(String ILID,int page,int rows);

    /**
     * 根据订单id修改信息，更新仓库和货物信息
     * @return
     */
    GResult updInListById(String ILID,int orderOinion,String ILComfirm) throws Exception;

    /**
     * 根据经手人查询，可按时间段查询
     * @param page
     * @param rows
     * @param ILBy
     * @param startTime
     * @param endTime
     * @return
     */
    DataGrid selInListByILBy(int page,int rows,String ILBy,String startTime,String endTime);

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
    DataGrid selSaveInList(int page,int rows,String goodName,String sID,String startTime,String endTime);
}
