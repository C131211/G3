package com.l.mapper;

import com.l.pojo.Buyer;

import java.util.List;

public interface BuyerMapper {
    /**
     * 查找所有的经销商
     * @return
     */
    List<Buyer> selAllBuyer();


    /**
     * 增加经销商
     * @param buyer
     * @return
     */
    int insBuyer(Buyer buyer);

    /**
     * 根据Id删除经销商
     * @param buyId
     * @return
     */
    int delBuyerById(int buyId);

    /**
     * 修改经销商信息
     * @param buyer
     * @return
     */
    int updBuyerById(Buyer buyer);

    /**
     * 根据Id获取经销商信息
     * @param buyId
     * @return
     */
    Buyer selBuyerById(int buyId);

}
