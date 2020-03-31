package com.l.mapper;

import com.l.pojo.Good;
import com.l.pojo.InList;

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
}
