package com.l.service;

import com.l.commons.pojo.GResult;
import com.l.pojo.InList;

import java.util.List;

/**
 * Created by c on 2020/3/31.
 */
public interface InListService {
    /**
     * 添加入库单
     * @return
     */
    GResult insInList(String ILprice,String ILNum,String ILFrom,String ILBy,int sID,String goodName,String ILComfirm) throws Exception;
}
