package com.l.service;

import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.pojo.Save;

import java.util.List;

/**
 * Created by c on 2020/3/29.
 */
public interface SaveService {
    /**
     * 获取所有的未满仓库信息
     * @return
     */
    GResult selAllSaveSName();

    /**
     * 增加仓库
     * @param save
     * @return
     */
    GResult insSave(Save save);

    /**
     * 分页查询所有的仓库信息
     * @param save
     * @param page
     * @param rows
     * @return
     */
    DataGrid selAllSave(Save save,int page,int rows);

    /**
     * 根据id删除仓库
     * @param sID
     * @return
     */
    GResult delSave(int sID);

    /**
     * 根据id修改仓库信息
     * @param save
     * @return
     */
    GResult updSave(Save save);

    /**
     * 根据id获取仓库信息
     * @param sID
     * @return
     */
    GResult selSaveById(int sID);

}
