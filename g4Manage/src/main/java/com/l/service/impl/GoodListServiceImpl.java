package com.l.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.l.commons.pojo.DataGrid;
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
    public DataGrid selAllGoodList(int page,int rows) {
        PageHelper.startPage(page, rows);
        GResult result = new GResult();
        List<GoodList> list = goodListMapper.selAllGoodList();

        PageInfo<GoodList> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
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

    @Override
    public GResult selGoodListById(int glId) {
        GResult result = new GResult();
        GoodList goodList = goodListMapper.selGoodListById(glId);
        if (goodList!=null){
            result.setMsg("OK");
            result.setStatus(200);
            result.setData(goodList);
        }else {
            result.setMsg("error");
        }

        return result;
    }


    public GResult getAllGoodList(){
        List<GoodList> goodLists = goodListMapper.selAllGoodList();
        GResult result = new GResult();
        if (goodLists!=null && goodLists.size()>0){
            result.setMsg("OK");
            result.setStatus(200);
            result.setData(goodLists);
        }else {
            result.setMsg("获取失败");
        }
        return result;
    }

}
