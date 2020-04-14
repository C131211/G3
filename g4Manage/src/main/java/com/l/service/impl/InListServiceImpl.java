package com.l.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.mapper.GoodMapper;
import com.l.mapper.InListMapper;
import com.l.mapper.SaveMapper;
import com.l.pojo.Good;
import com.l.pojo.InList;
import com.l.pojo.Save;
import com.l.service.InListService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by c on 2020/3/31.
 */
@Service
public class InListServiceImpl implements InListService {

    @Resource
    private InListMapper inListMapper;
    @Resource
    private GoodMapper goodMapper;
    @Resource
    private SaveMapper saveMapper;


    @Override
    public GResult insInList(String ILprice, String ILNum, String ILFrom, String ILBy, int sID, String goodName,String ILComfirm) throws Exception {
        GResult result = new GResult();
        //表达式对象
        Pattern p = Pattern.compile("[\\d.]+");
        Date date = new Date();
        String ILID = UUID.randomUUID().toString();
        List<InList> list = new ArrayList<>();

        //解析参数
        String[] ilPrices = ILprice.split(",");
        String[] iLNums = ILNum.split(",");
        String[] iLFroms = ILFrom.split(",");
        String[] goodNames = goodName.split(",");
        //进货价格解析
        for (int i = 0; i < ilPrices.length; i++) {
            InList inList = new InList();
            inList.setILDate(date);
            inList.setILID(ILID);
            //用正则表达式判断是数字还是字母
            Matcher m = p.matcher(ilPrices[i]);
            //如果是数字
            if (m.matches()){
                inList.setILprice(Integer.parseInt(ilPrices[i]));
            }

            m = p.matcher(iLNums[i]);

            if (m.matches()){
                inList.setILNum(Integer.parseInt(iLNums[i]));
            }

            inList.setsID(sID);
            inList.setILFrom(iLFroms[i]);
            inList.setGoodName(goodNames[i]);
            inList.setILStatus(0);
            inList.setILBy(ILBy);
            if (ILComfirm!=null && !ILComfirm.equals("")){
                inList.setILComfirm(ILComfirm);
            }
            inList.setILTotal(Integer.parseInt(ilPrices[i]) * Integer.parseInt(iLNums[i]));
            list.add(inList);
        }
        //添加入库单
        int inListIndex = -1;
        for (InList inLists : list) {
           inListIndex =  inListMapper.insInList(inLists);
        }
     /*   //写入仓库
        int i = saveMapper.updSaveGoods(sID, goods);
        if (i>0&& inListIndex>0){
            result.setMsg("OK");
            result.setStatus(200);
        }*/
        if (inListIndex>0){
            result.setMsg("OK");
            result.setStatus(200);
        }else {
            result.setMsg("申请失败，请联系管理员");
        }
        return result;
    }

    @Override
    public DataGrid selNoDeal(String ILComfirm,int page,int rows) {
        PageHelper.startPage(page, rows);
        List<InList> list = inListMapper.selNoDeal(ILComfirm);
        PageInfo<InList> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
    }

    @Override
    public DataGrid selInListById(String ILID,int page,int rows) {
        PageHelper.startPage(page, rows);
        List<InList> list = inListMapper.selInListById(ILID);
        PageInfo<InList> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
    }


    @Override
    public GResult updInListById(String ILID, int orderOinion) throws Exception {
        GResult result = new GResult();
        int index = -1;
        //判断是否允许入库
        if (orderOinion==1){//同意
            //查询订单详情
            List<InList> inLists = inListMapper.selInListById(ILID);
            for (InList inList : inLists) {
                //查询good里面是否已经有该供应商的货物
                Good good = goodMapper.selGoodByMore(inList.getGoodName(), inList.getsID(), inList.getILFrom());
                if (good!=null){//有此货物 修改信息
                    good.setgNum((good.getgNum()+inList.getILNum()));
                    good.setgSatime(new Date());
                    index = goodMapper.updGoodById(good);
                    //写入inList
                    inList.setgID(good.getgID());
                    inList.setILStatus(1);
                    inList.setOrderOinion(1);
                    index = inListMapper.updInListOrder(inList);
                    //修改仓库的现存量
                    Save save = saveMapper.selSaveById(inList.getsID());
                    if (save!=null){
                        save.setsNsave(save.getsNsave()+inList.getILNum());
                        index = saveMapper.updSave(save);
                    }else {
                        throw new Exception("仓库获取出错");
                    }
                }else {//没有此货物新增
                    Good goodNew = new Good();
                    String gid = UUID.randomUUID().toString();
                    goodNew.setgID(gid);
                    goodNew.setgName(inList.getGoodName());
                    goodNew.setgNum(inList.getILNum());
                    goodNew.setgInprice(inList.getILprice());
                    goodNew.setgSatime(new Date());
                    goodNew.setsID(inList.getsID());
                    goodNew.setgStatus(1);
                    goodNew.setSupName(inList.getILFrom());
                    index = goodMapper.insGood(goodNew);
                    //写入inList
                    inList.setgID(goodNew.getgID());
                    inList.setILStatus(1);
                    inList.setOrderOinion(1);
                    index = inListMapper.updInListOrder(inList);
                    //修改仓库的信息
                    Save save = saveMapper.selSaveById(inList.getsID());
                    if (save!=null){
                        save.setsNsave(save.getsNsave()+inList.getILNum());
                        save.setGoods(save.getGoods()+goodNew.getgID()+",");
                        index = saveMapper.updSave(save);
                    }else {
                        throw new Exception("仓库获取出错");
                    }
                }
            }
        }else if (orderOinion==0){//拒绝
            //改变审核意见，返回信息
            index  = inListMapper.updInListOinion(0, ILID);
            result.setStatus(200);
            result.setMsg("审核成功");
        }else {
            //参数错误
            result.setMsg("参数错误");
        }


        if (index>0){
            result.setStatus(200);
            result.setMsg("审核成功");
        }else {
            throw new Exception("系统错误");
        }
        return result;
    }
}
