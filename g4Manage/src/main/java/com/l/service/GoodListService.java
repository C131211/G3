package com.l.service;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.GoodList;

import java.util.List;

/**
 * Created by c on 2020/3/28.
 */
public interface GoodListService {
    /**
     * 分页查询所有的货物列表
     * @return
     */
    DataGrid selAllGoodList(int page,int rows);

    /**
     * 增加货物类别
     * @param goodList
     * @return
     */
    GResult insGoodList(GoodList goodList);

    /**
     * 根据id删除货物类别
     * @param glId
     * @return
     */
    GResult delGoodListById(int glId);

    /**
     * 更新货物类别
     * @param goodList
     * @return
     */
    GResult updGoodListById(GoodList goodList);

    /**
     * 根据ID获取类别
     * @param glId
     * @return
     */
    GResult selGoodListById(int glId);

    /**
     * 获取所有类别
     * @return
     */
    GResult getAllGoodList();

}
