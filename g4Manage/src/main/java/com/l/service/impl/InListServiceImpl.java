package com.l.service.impl;

import com.l.commons.pojo.GResult;
import com.l.mapper.GoodMapper;
import com.l.mapper.InListMapper;
import com.l.mapper.SaveMapper;
import com.l.pojo.Good;
import com.l.pojo.InList;
import com.l.service.InListService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by c on 2020/3/31.
 */
@Service
public class InListServiceImpl implements InListService {

    @Resource
    private GoodMapper goodMapper;
    @Resource
    private SaveMapper saveMapper;
    @Resource
    private InListMapper inListMapper;


    @Override
    public GResult insInList(String ILprice, String ILNum, String ILFrom, String ILBy, int sID, String goodName,String ILComfirm) throws Exception {
        GResult result = new GResult();
        //表达式对象
        Pattern p = Pattern.compile("[\\d.]+");
        Date date = new Date();
        String ILID = UUID.randomUUID().toString();
        int goodIndex = -1;
        String goods = "";
        List<InList> list = new ArrayList<>();
        Good good = new Good();
        good.setsID(sID);
        String gid = null;

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
            gid = UUID.randomUUID().toString();
            inList.setgID(gid);
            //添加货物
            good.setgID(gid);
            good.setgSatime(date);
            good.setgInprice(Integer.parseInt(ilPrices[i]));
            good.setgName(goodNames[i]);
            good.setgStatus(1);
            good.setgNum(Integer.parseInt(iLNums[i]));
            goodIndex = goodMapper.insGood(good);
            if (goodIndex<0){
                throw new Exception("货物新建错误");
            }
            list.add(inList);
        }
        //添加入库单
        int inListIndex = -1;
        for (InList inLists : list) {
           inListIndex +=  inListMapper.insInList(inLists);
            goods += inLists.getgID()+",";
        }
        //写入仓库
        int i = saveMapper.updSaveGoods(sID, goods);
        if (i>0&& inListIndex>0){
            result.setMsg("OK");
            result.setStatus(200);
        }

        return result;
    }
}
