package com.l.service;

import com.l.commons.pojo.GResult;
import com.l.pojo.ForgetText;

/**
 * Created by c on 2020/4/14.
 */
public interface ForgetTextService {
    /**
     * 更新或者新增备忘录
     * @param forgetText
     * @return
     */
    GResult updForgetText(ForgetText forgetText);

    /**
     * 根据UID查询备忘录
     * @param uID
     * @return
     */
    GResult selForgetText(int uID);

}
