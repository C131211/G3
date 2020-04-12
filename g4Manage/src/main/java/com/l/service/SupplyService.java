package com.l.service;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.Supply;

/**
 * Created by c on 2020/4/12.
 */
public interface SupplyService {
    /**
     * 分页显示供应商
     * @return
     */
    DataGrid selAllSupply(int page,int rows);

    /**
     * 增加供应商
     * @param supply
     * @return
     */
    GResult insSupply(Supply supply);

    /**
     * 根据id删除供应商
     * @param supId
     * @return
     */
    GResult delSupplyById(int supId);

    /**
     * 修改供应商信息
     * @param supply
     * @return
     */
    GResult updSupply(Supply supply);

    /**
     * 获取供应商信息
     * @return
     */
    GResult getSupply();

    /**
     * 根据Id获取该供应商的信息
     * @param supId
     * @return
     */
    GResult selSupplyById(int supId);

}
