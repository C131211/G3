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
                if (goodById.getgName().equals(goodNames[i].trim())) {
                    outList.setGoodName(goodNames[i]);
                    //添加该货物的数量
                    totalGoodNums += goodById.getgNum();
                }
            }
            //判断是否拥有该货物
            if (outList.getGoodName()==null || outList.getGoodName().equals("")){
                //不符合就返回失败信息
                result.setMsg(goodName+"不存在于这个仓库");
                return result;
            }else {
                //判断数量属否足够
                if (totalGoodNums < nums) {
                    //提交待审核
                 /*   //修改货物的信息
                    for (String str : goodsStrs) {
                        //根据货物id查询该货物详情
                        Good goodById = goodMapper.selGoodById(str);
                        if (goodById.getgName().equals(goodNames[i].trim()) && nums>0) {
                            if (goodById.getgNum()>nums){
                                goodById.setgNum(goodById.getgNum()-nums);
                            }else {
                                nums = nums - goodById.getgNum();
                                goodById.setgNum(0);
                            }

                        }
                    }*/

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
}
