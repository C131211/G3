package com.l.mapper;

import com.l.pojo.OutList;

import java.util.List;
import java.util.Map;

/**
 * Created by c on 2020/4/12.
 */
public interface OutListMapper {
    /**
     * 添加出库单
     * @param outList
     * @return
     */
    int insOutList(OutList outList);

    /**
     * 查询未处理的出库单
     * @param olComfirm
     * @return
     */
    List<OutList> selNoDeal(String olComfirm);


    /**
     * 根据订单Id获取订单信息
     * @param olId
     * @return
     */
    List<OutList> selOutListById(String olId);



    /**
     * 拒绝订单后设置信息
     * @param orderOinion
     * @param olId
     * @return
     */
    int updOutListOinion(int orderOinion,String olId);


    /**
     * 更新同意入库后的订单
     * @param outList
     * @return
     */
    int updOutListOrder(OutList outList);


    /**
     * 通过经手人查询该用户的所有订单
     * @return
     */
    List<OutList> selOutListByILBy(Map map);


    /**
     * 仓库统计
     * @return
     */
    List<OutList> selSaveOutList(Map map);


}
