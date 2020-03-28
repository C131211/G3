package com.l.mapper;

import com.l.pojo.GoodList;

import java.util.List;

/**
 * Created by c on 2020/3/28.
 */
public interface GoodListMapper {

    /**
     * 查询所有的货物种类
     * @return
     */
    List<GoodList> selAllGoodList();


    /**
     * 增加货物种类
     * @param goodName
     * @return
     */
    int insGoodList(String goodName);

    /**
     * 根据id删除货物种类
     * @param glId
     * @return
     */
    int delGoodListById(int glId);

    /**
     * 根据id修改货物类别
     * @return
     */
    int updGoodListById(GoodList goodList);

}
