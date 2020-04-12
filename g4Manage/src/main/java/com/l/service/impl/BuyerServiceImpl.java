package com.l.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.mapper.BuyerMapper;
import com.l.pojo.Buyer;
import com.l.service.BuyerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by c on 2020/4/12.
 */
@Service
public class BuyerServiceImpl implements BuyerService {
    @Resource
    private BuyerMapper buyerMapper;

    @Override
    public DataGrid selAllBuyer(int page, int rows) {
        PageHelper.startPage(page, rows);
        GResult result = new GResult();
        List<Buyer> list = buyerMapper.selAllBuyer();
        PageInfo<Buyer> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
    }

    @Override
    public GResult insBuyer(Buyer buyer) {
        GResult result = new GResult();
        int index = -1;
        index = buyerMapper.insBuyer(buyer);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("error");
        }
        return result;
    }

    @Override
    public GResult delBuyerById(int buyId) {
        GResult result = new GResult();
        int index = -1;
        index = buyerMapper.delBuyerById(buyId);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("error");
        }
        return result;
    }

    @Override
    public GResult updBuyer(Buyer buyer) {
        GResult result = new GResult();
        int index = -1;
        index = buyerMapper.updBuyerById(buyer);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("error");
        }
        return result;
    }

    @Override
    public GResult getBuyer() {
        GResult result = new GResult();
        List<Buyer> list = buyerMapper.selAllBuyer();
        if (list!=null && list.size()>0){
            result.setMsg("OK");
            result.setStatus(200);
            result.setData(list);
        }else {
            result.setMsg("无经销商信息");
        }
        return result;
    }

    @Override
    public GResult selBuyerById(int buyId) {
        GResult result = new GResult();
        Buyer buyer = buyerMapper.selBuyerById(buyId);
        if (buyer!=null){
            result.setMsg("OK");
            result.setStatus(200);
            result.setData(buyer);
        }else {
            result.setMsg("获取失败");
        }
        return result;
    }
}
