package com.l.mapper;

import com.l.pojo.GoodList;

import java.util.List;

/**
 * Created by c on 2020/3/28.
 */
public interface GoodListMapper {

    /**
     * ��ѯ���еĻ�������
     * @return
     */
    List<GoodList> selAllGoodList();


    /**
     * ���ӻ�������
     * @param goodName
     * @return
     */
    int insGoodList(String goodName);

    /**
     * ����idɾ����������
     * @param glId
     * @return
     */
    int delGoodListById(int glId);

    /**
     * ����id�޸Ļ������
     * @return
     */
    int updGoodListById(GoodList goodList);

}
