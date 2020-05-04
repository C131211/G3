package com.l.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.mapper.GoodMapper;
import com.l.pojo.Good;
import com.l.pojo.GoodList;
import com.l.service.GoodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class GoodServiceImpl implements GoodService {
    @Resource
    private GoodMapper goodMapper;

    @Override
    public DataGrid selGoods(int page,int rows,String gName, String sID, String supName) {
        Map map = new HashMap();
        map.put("gName",gName);
        map.put("sID",sID);
        map.put("supName",supName);
        PageHelper.startPage(page, rows);
        List<Good> goods = goodMapper.selGoods(map);
        PageInfo<Good> pi = new PageInfo<>(goods);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;

    }
}
