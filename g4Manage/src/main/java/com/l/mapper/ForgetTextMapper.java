package com.l.mapper;

import com.l.pojo.ForgetText;

/**
 * Created by c on 2020/4/14.
 */
public interface ForgetTextMapper {

    /**
     * 增加备忘录
     * @return
     */
    int insForgetByUID(ForgetText forgetText);

    /**
     * 修改备忘录
     * @param forgetText
     * @return
     */
    int updForgetByUID(ForgetText forgetText);

    /**
     * 查找该用户的备忘录
     * @param uID
     * @return
     */
    ForgetText selForgetByUID(int uID);


}



