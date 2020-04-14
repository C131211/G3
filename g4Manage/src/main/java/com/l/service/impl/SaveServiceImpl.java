package com.l.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.mapper.GoodMapper;
import com.l.mapper.SaveMapper;
import com.l.pojo.Good;
import com.l.pojo.Save;
import com.l.service.SaveService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by c on 2020/3/29.
 */
@Service
public class SaveServiceImpl implements SaveService {

    @Resource
    private SaveMapper saveMapper;
    @Resource
    private GoodMapper goodMapper;


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

    @Override
    public DataGrid selAllSave(Save save,int page,int rows) {
        PageHelper.startPage(page, rows);
        DataGrid dataGrid = new DataGrid();
        //表达式对象
        Pattern p = Pattern.compile("[\\d.]+");
        //如果传进来的user为空，即查询所有的用户
        if (save.getsName()==null||save.getsName().equals("")){
            List<Save> list = saveMapper.selAllSave(save);
            List<Good> goods = new ArrayList<>();
            String goodsStr = "";
            for (Save saveList : list) {
                if (saveList.getGoods()!=null&&!saveList.getGoods().equals("")){
                    //解析货物id   1，2，3
                    String[] strs = saveList.getGoods().trim().split(",");
                    for (String str : strs) {
                        //查询该货物的信息
                        if (str!=null && !str.equals("")){
                            Good good = goodMapper.selGoodById(str);
                            if (good!=null){
                                //放到List里面
                                goods.add(good);
                                goodsStr += str+",";
                            }
                        }
                    }
                    saveList.setGoods(goodsStr);
                    saveList.setGood(goods);
                }
                saveMapper.updSaveGoods(saveList.getsID(),saveList.getGoods());
            }
            PageInfo<Save> pi = new PageInfo<>(list);
            dataGrid.setData(pi.getList());
            dataGrid.setCount(pi.getTotal());
            dataGrid.setCode(0);
            dataGrid.setMsg("OK");

        }else{
            //如果user有内容，做用户名的查询，并把username做高亮处理
            //查询的字段
            String str0 = save.getsName();
            //替换成红色
            String  str = "<span style='color:red'>"+str0+"</span>";
            List<Save> list = saveMapper.selAllSave(save);
            List<Good> goods = new ArrayList<>();
            String goodsStr = "";
            for(Save saveList:list){
                saveList.setsName(saveList.getsName().replace(str0, str));

                //设置货物信息
                if (saveList.getGoods()!=null&&!saveList.getGoods().equals("")){
                    //解析货物id   1，2，3
                    String[] strs = saveList.getsName().trim().split(",");
                    for (String str1 : strs) {
                        //查询该货物的信息
                        if (str!=null && !str.equals("")){
                            Good good = goodMapper.selGoodById(str1);
                            if (good!=null){
                                //放到List里面
                                goods.add(good);
                                goodsStr += str1+",";
                            }
                        }
                    }
                    saveList.setGoods(goodsStr);
                    saveList.setGood(goods);
                }
            }
            PageInfo<Save> pi = new PageInfo<>(list);
            dataGrid.setData(pi.getList());
            dataGrid.setCount(pi.getTotal());
            dataGrid.setCode(0);
            dataGrid.setMsg("OK");
        }
        return dataGrid;
    }


    @Override
    public GResult delSave(int sID) {
        int index = -1;
        GResult result = new GResult();
        index = saveMapper.delSaveById(sID);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("删除出错");
        }
        return result;

    }

    @Override
    public GResult updSave(Save save) {
        int index = -1;
        GResult result = new GResult();
        index = saveMapper.updSave(save);
        if (index>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("修改出错");
        }
        return result;
    }

    @Override
    public GResult selSaveById(int sID) {
        Save save = saveMapper.selSaveById(sID);
        GResult result = new GResult();
        if (save!=null ){
            result.setMsg("OK");
            result.setData(save);
            result.setStatus(200);
        }else {
            result.setMsg("获取出错");
        }

        return result;
    }
}
