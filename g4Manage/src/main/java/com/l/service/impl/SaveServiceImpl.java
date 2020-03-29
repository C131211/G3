package com.l.service.impl;

import com.l.commons.pojo.GResult;
import com.l.mapper.SaveMapper;
import com.l.pojo.Save;
import com.l.service.SaveService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by c on 2020/3/29.
 */
@Service
public class SaveServiceImpl implements SaveService {

    @Resource
    private SaveMapper saveMapper;


    @Override
    public GResult selAllSaveSName() {
        List<Save> list = saveMapper.selAllSaveSName();
        GResult result = new GResult();
        if (list!=null && list.size()>0){
            result.setMsg("OK");
            result.setData(list);
            result.setStatus(200);
        }else {
            result.setMsg("没有仓库为空");
        }

        return result;
    }

    @Override
    public GResult insSave(Save save) {
        int index = -1;
        GResult result = new GResult();
        index = saveMapper.insSave(save);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("添加出错");
        }
        return result;
    }
}
