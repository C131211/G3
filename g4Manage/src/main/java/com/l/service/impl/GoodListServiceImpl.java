package com.l.service.impl;

import com.l.commons.pojo.GResult;
import com.l.mapper.GoodListMapper;
import com.l.pojo.GoodList;
import com.l.service.GoodListService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by c on 2020/3/28.
 */
@Service
public class GoodListServiceImpl implements GoodListService {
    @Resource
    private GoodListMapper goodListMapper;

    @Override
    public GResult selAllGoodList() {
        GResult result = new GResult();
        List<GoodList> list = goodListMapper.selAllGoodList();

        result.setMsg("OK");
        result.setData(list);
        result.setStatus(200);
        return result;
    }

    @Override
    public GResult insGoodList(String goodName) {
        GResult result = new GResult();
        int index = -1;
        index = goodListMapper.insGoodList(goodName);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("error");
        }

        return result;
    }

    @Override
    public GResult delGoodListById(int glId) {
        GResult result = new GResult();
        int index = -1;
        index = goodListMapper.delGoodListById(glId);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("error");
        }
        return result;
    }

    @Override
    public GResult updGoodListById(GoodList goodList) {
        GResult result = new GResult();
        int index = -1;
        index = goodListMapper.updGoodListById(goodList);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("error");
        }

        return result;
    }
}
