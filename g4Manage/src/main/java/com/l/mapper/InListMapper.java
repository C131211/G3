package com.l.mapper;

import com.l.pojo.Good;
import com.l.pojo.InList;

import java.util.List;

/**
 * Created by c on 2020/3/29.
 */
public interface InListMapper {
    /**
     * 添加入库单
     * @param inList
     * @return
     */
    int insInList(InList inList);

    /**
     * 查询所有还没处理的订单
     * @return
     */
    List<InList> selNoDeal(String ILComfirm);

    /**
     * 根据订单Id获取订单信息
     * @param ILID
     * @return
     */
    List<InList> selInListById(String ILID);

    /**
     * 拒绝订单后设置信息
     * @param orderOinion
     * @param ILID
     * @return
     */
    int updInListOinion(int orderOinion,String ILID);

    /**
     * 更新同意入库后的订单
     * @param inList
     * @return
     */
    int updInListOrder(InList inList);

}
