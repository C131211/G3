package com.l.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.l.commons.pojo.DataGrid;
import com.l.commons.pojo.GResult;
import com.l.mapper.GoodMapper;
import com.l.mapper.OutListMapper;
import com.l.mapper.SaveMapper;
import com.l.pojo.Good;
import com.l.pojo.OutList;
import com.l.pojo.Save;
import com.l.service.OutListService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by c on 2020/4/12.
 */
@Service
public class OutListServiceImpl  implements OutListService {

    @Resource
    private GoodMapper goodMapper;
    @Resource
    private SaveMapper saveMapper;
    @Resource
    private OutListMapper outListMapper;

    @Override
    public GResult insOutList(String  olPrice, String  olNum, String olDestin, String olBy, String olComfirm, int sID, String goodName) {
        GResult result = new GResult();
        //表达式对象
        Pattern p = Pattern.compile("[\\d.]+");
        Date date = new Date();
        String olId = UUID.randomUUID().toString();
        List<OutList> list = new ArrayList<>();
        Good good = new Good();
        good.setsID(sID);

        //解析参数
        String[] olPrices = olPrice.split(",");
        String[] olNums = olNum.split(",");
        String[] olDestins = olDestin.split(",");
        String[] goodNames = goodName.split(",");
        //出货价格解析
        for (int i = 0; i < olPrices.length; i++) {
            int price = 0;
            int nums = 0;
            int totalGoodNums = 0;
            OutList outList = new OutList();
            outList.setOlDate(date);
            outList.setOlId(olId);
            //用正则表达式判断是数字还是字母
            Matcher m = p.matcher(olPrices[i]);
            //如果是数字
            if (m.matches()){
                price = Integer.parseInt(olPrices[i]);
                outList.setOlPrice(price);
            }

            m = p.matcher(olNums[i]);

            if (m.matches()){
                nums = Integer.parseInt(olNums[i]);
                outList.setOlNum(nums);
            }

            outList.setsID(sID);
            outList.setOlDestin(olDestins[i]);
            outList.setOlStatus(0);
            outList.setOlBy(olBy);
            if (olComfirm!=null && !olComfirm.equals("")){
                outList.setOlComfirm(olComfirm);
            }
            outList.setOlTotal(price*nums);
            //通过仓库去查询到该货物的详情
            String goodsStr = saveMapper.selSaveGoodsById(sID);
            //解析字符串
            String[] goodsStrs = goodsStr.split(",");
            for (String str : goodsStrs) {
                //根据货物id查询该货物详情
                Good goodById = goodMapper.selGoodById(str);
                //通过goodName去判断是否拥有这货物
                if (goodById!=null && goodById.getgName().equals(goodNames[i].trim())) {
                    outList.setGoodName(goodNames[i]);
                    //添加该货物的数量
                    totalGoodNums += goodById.getgNum();
                    if (totalGoodNums< nums){
                        outList.setgID(goodById.getgID()+",");
                    }
                    if (goodById.getgNum()>=nums){
                        outList.setgID(goodById.getgID());
                    }
                }
            }
            //判断是否拥有该货物
            if (outList.getGoodName()==null || outList.getGoodName().equals("")){
                //不符合就返回失败信息
                result.setMsg(goodName+"不存在于这个仓库");
                return result;
            }else {
                //判断数量属否足够
                if (totalGoodNums >= nums) {
                    //提交待审核
                } else {
                    //返回数量不足的信息
                    result.setMsg(goodName + "的数量不足，无法满足出仓要求");
                    return result;
                }
            }
            list.add(outList);
        }

        //添加入库单
        int outListIndex = -1;
        for (OutList outList : list) {
            outListIndex += outListMapper.insOutList(outList) ;
           // goods += outList.getgID()+",";
        }
        if (outListIndex >0){
            result.setStatus(200);
        }

        return result;
    }

    @Override
    public DataGrid selNoDeal(String olComfirm, int page, int rows) {
        PageHelper.startPage(page, rows);
        List<OutList> list = outListMapper.selNoDeal(olComfirm);
        PageInfo<OutList> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
    }

    @Override
    public DataGrid selOutListById(String olId, int page, int rows) {
        PageHelper.startPage(page, rows);
        List<OutList> list = outListMapper.selOutListById(olId);
        PageInfo<OutList> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
    }

    @Override
    public GResult updOutListById(String olId, int orderOinion) throws Exception {
        GResult result = new GResult();
        int index = -1;
        if (orderOinion==0){//拒绝出库
            index = outListMapper.updOutListOinion(0, olId);
            result.setStatus(200);
            result.setMsg("审核成功");
        }else if (orderOinion==1){//同意
            //查询订单详情
            List<OutList> outLists = outListMapper.selOutListById(olId);
            for (OutList outList : outLists) {
                //设置订单状态
                outList.setOlStatus(1);
                outList.setOrderOinion(1);
                index = outListMapper.updOutListOrder(outList);
                int nums = outList.getOlNum();
                //解析gid
                String gids = outList.getgID();
                String[] gidstrs = gids.split(",");
                for (String gidstr : gidstrs) {
                    if (gidstr!=null && !gidstr.equals("")){
                        //根据gid去修改数量
                        Good good = goodMapper.selGoodById(gidstr);
                        if (null != good && good.getgNum()<nums){
                            good.setgNum(0);
                            nums = nums-good.getgNum();
                            index = goodMapper.updGoodById(good);
                            //修改仓库现存量
                            Save save = saveMapper.selSaveById(outList.getsID());
                            if (save!=null){
                                save.setsNsave(save.getsNsave()-good.getgNum());
                                index = saveMapper.updSave(save);
                            }else {
                                throw new Exception("仓库获取出错");
                            }
                        }else if(good==null){
                            throw  new Exception("货物获取失败");
                        }else {
                            good.setgNum(good.getgNum()-nums);
                            index = goodMapper.updGoodById(good);
                            //修改仓库现存量
                            Save save = saveMapper.selSaveById(outList.getsID());
                            if (save!=null){
                                save.setsNsave(save.getsNsave()-nums);
                                //如果仓库已满，设置为未满
                                if (save.getsStatus()==1){
                                    save.setsStatus(0);
                                }
                                index = saveMapper.updSave(save);
                                nums = 0;
                            }else {
                                throw new Exception("仓库获取出错");
                            }
                        }
                    }
                }

            }

        }else {
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


    @Override
    public DataGrid selOutListByILBy(int page, int rows, String olBy, String startTime, String endTime) {
        PageHelper.startPage(page, rows);
        List<OutList> list = outListMapper.selOutListByILBy(olBy, startTime, endTime);
        PageInfo<OutList> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
    }


    @Override
    public DataGrid selSaveOutList(int page, int rows, String goodName, int sID, String startTime, String endTime) {
        PageHelper.startPage(page, rows);
        List<OutList> list = outListMapper.selSaveOutList(goodName, sID, startTime, endTime);
        PageInfo<OutList> pi = new PageInfo<>(list);
        DataGrid dataGrid = new DataGrid();
        dataGrid.setData(pi.getList());
        dataGrid.setCount(pi.getTotal());
        dataGrid.setCode(0);
        dataGrid.setMsg("OK");
        return dataGrid;
    }
}
