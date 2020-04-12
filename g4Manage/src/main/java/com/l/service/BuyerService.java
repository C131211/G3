package com.l.service;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.Buyer;

/**
 * Created by c on 2020/4/12.
 */
public interface BuyerService {
    /**
     * 分页显示经销商
     * @return
     */
    DataGrid selAllBuyer(int page, int rows);

    /**
     * 增加经销商
     * @param buyer
     * @return
     */
    GResult insBuyer(Buyer buyer);

    /**
     * 根据id删除经销商
     * @param buyId
     * @return
     */
    GResult delBuyerById(int buyId);

    /**
     * 修改经销商信息
     * @param  buyer
     * @return
     */
    GResult updBuyer(Buyer buyer);

    /**
     * 获取经销商信息
     * @return
     */
    GResult getBuyer();

    /**
     * 根据id经销商信息
     * @return
     */
    GResult selBuyerById(int buyId);

}
