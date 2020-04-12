package com.l.mapper;

import com.l.pojo.OutList;

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

}
