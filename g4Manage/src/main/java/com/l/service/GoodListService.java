package com.l.service;

import com.l.commons.pojo.GResult;
import com.l.pojo.GoodList;

import java.util.List;

/**
 * Created by c on 2020/3/28.
 */
public interface GoodListService {
    /**
     * ��ѯ���еĻ����б�
     * @return
     */
    GResult selAllGoodList();

    /**
     * ���ӻ������
     * @param goodName
     * @return
     */
    GResult insGoodList(String goodName);

    /**
     * ����idɾ���������
     * @param glId
     * @return
     */
    GResult delGoodListById(int glId);

    /**
     * ���»������
     * @param goodList
     * @return
     */
    GResult updGoodListById(GoodList goodList);

}
