package com.l.mapper;

import com.l.pojo.Good;

/**
 * Created by c on 2020/3/29.
 */
public interface GoodMapper {
    /**
     * 根据id查询该货物
     * @param gID
     * @return
     */
    Good selGoodById(String gID);

    /**
     * 增加货物
     * @param good
     * @return
     */
    int insGood(Good good);

    /**
     * 根据id修改货物信息
     * @param good
     * @return
     */
    int updGoodById(Good good);

    /**
     * 根据信息查询货物
     * @param gName
     * @param sID
     * @param supName
     * @return
     */
    Good selGoodByMore(String gName,int sID,String supName);


}
