package com.l.mapper;

import com.l.pojo.Save;

import java.util.List;

/**
 * Created by c on 2020/3/29.
 */
public interface SaveMapper {
    /**
     * 查询所有未满仓的仓库名字
     * @return
     */
    List<Save> selAllSaveSName();

    /**
     * 增加仓库
     * @param save
     * @return
     */
    int insSave(Save save);

    /**
     * 分页查询所有仓库
     * @param save
     * @return
     */
    List<Save> selAllSave(Save save);

    /**
     * 根据id删除仓库
     * @param sID
     * @return
     */
    int delSaveById(int sID);

    /**
     * 修改仓库信息
     * @param save
     * @return
     */
    int updSave(Save save);

    /**
     * 获取该仓库的信息
     * @return
     */
    Save selSaveById(int sID);

    /**
     * 根据id修改货物
     * @param sID
     * @param goods
     * @return
     */
    int updSaveGoods(int sID,String goods);

    /**
     * 根据id获取到该仓库的货物id集
     * @return
     */
    String selSaveGoodsById(int sID);


}
