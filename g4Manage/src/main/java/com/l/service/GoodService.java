package com.l.service;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;

public interface GoodService {
    /**
     * 筛选货物
     * @return
     */
    DataGrid selGoods(int page,int rows,String gName, String sID, String supName);

}
