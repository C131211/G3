package com.l.service;

import com.l.commons.pojo.GResult;
import com.l.pojo.Save;

import java.util.List;

/**
 * Created by c on 2020/3/29.
 */
public interface SaveService {

    GResult selAllSaveSName();


    GResult insSave(Save save);

}
