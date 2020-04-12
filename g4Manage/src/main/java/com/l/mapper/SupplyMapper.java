package com.l.mapper;

import com.l.pojo.Supply;

import java.util.List;

public interface SupplyMapper {
    /**
     * 查找所有的供应商
     * @return
     */
    List<Supply> selAllSupply();


    /**
     * 增加供应商
     * @param supply
     * @return
     */
    int insSupply(Supply supply);

    /**
     * 根据Id删除供应商
     * @param supId
     * @return
     */
    int delSupplyById(int supId);

    /**
     * 修改供应商信息
     * @param supply
     * @return
     */
    int updSupplyById(Supply supply);

}
