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

}
