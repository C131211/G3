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





}
