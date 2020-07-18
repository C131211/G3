package com.l.mapper;

import com.l.pojo.Good;
import com.l.pojo.InList;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
    int updInListOinion(int orderOinion,String ILID,String ILComfirm);

    /**
     * 更新同意入库后的订单
     * @param inList 订单
     * @return
     */
    int updInListOrder(InList inList);

    /**
     * 通过经手人查询该用户的所有订单
     * @return
     */
    List<InList> selInListByILBy(Map map);

    /**
     * 仓库统计
     * @return
     */
    List<InList> selSaveInList(Map map);

}
