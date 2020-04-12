package com.l.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.mapper.SupplyMapper;
import com.l.pojo.Supply;
import com.l.service.SupplyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by c on 2020/4/12.
 */
@Service
public class SupplyServiceImpl  implements SupplyService {
    @Resource
    private SupplyMapper supplyMapper;

    @Override
    public DataGrid selAllSupply(int page,int rows) {
        PageHelper.startPage(page, rows);
        GResult result = new GResult();
        List<Supply> list = supplyMapper.selAllSupply();
        PageInfo<Supply> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
    }

    @Override
    public GResult insSupply(Supply supply) {
        GResult result = new GResult();
        int index = -1;
        index = supplyMapper.insSupply(supply);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("error");
        }
        return result;
    }

    @Override
    public GResult delSupplyById(int supId) {
        GResult result = new GResult();
        int index = -1;
        index = supplyMapper.delSupplyById(supId);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("error");
        }
        return result;
    }

    @Override
    public GResult updSupply(Supply supply) {
        GResult result = new GResult();
        int index = -1;
        index = supplyMapper.updSupplyById(supply);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("error");
        }
        return result;
    }

    @Override
    public GResult getSupply() {
        GResult result = new GResult();
        List<Supply> list = supplyMapper.selAllSupply();
        if (list!=null && list.size()>0){
            result.setMsg("OK");
            result.setStatus(200);
            result.setData(list);
        }else {
            result.setMsg("无供应商信息");
        }
        return result;
    }
}
