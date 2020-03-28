package com.l.service;

import com.l.commons.pojo.GResult;
import com.l.pojo.GoodList;

import java.util.List;

/**
 * Created by c on 2020/3/28.
 */
public interface GoodListService {
    /**
     * 查询所有的货物列表
     * @return
     */
    GResult selAllGoodList();

    /**
     * 增加货物类别
     * @param goodName
     * @return
     */
    GResult insGoodList(String goodName);

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

}
