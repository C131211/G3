package com.l.service.impl;

import com.l.commons.pojo.GResult;
import com.l.mapper.ForgetTextMapper;
import com.l.pojo.ForgetText;
import com.l.service.ForgetTextService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by c on 2020/4/14.
 */
@Service
public class ForgetTextServiceImpl implements ForgetTextService {
    @Resource
    private ForgetTextMapper forgetTextMapper;

    @Override
    public GResult updForgetText(ForgetText forgetText) {
        int index = -1;
        ForgetText text = forgetTextMapper.selForgetByUID(forgetText.getuID());
        GResult result = new GResult();
        if (text==null){
            //不存在 新增备忘录
            index = forgetTextMapper.insForgetByUID(forgetText);
        }else {
            //存在，修改内容
           index = forgetTextMapper.updForgetByUID(forgetText);
        }
        if (index>0){
            result.setMsg("修改成功");
            result.setStatus(200);
        }else {
            result.setMsg("修改失败");
        }
        return result;
    }

    @Override
    public GResult selForgetText(int uID) {
        GResult result = new GResult();
        ForgetText forgetText = forgetTextMapper.selForgetByUID(uID);
        result.setData(forgetText);
        result.setStatus(200);
        return result;
    }
}
