<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/17
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css">
    <script type="text/javascript" src="/framework/jquery-1.11.3.min.js"></script>
    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css"  media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <%--引入时间格式转换--%>
    <script src="/js/TimeFormat.js" charset="utf-8"></script>
    <!-- 公共样式 结束 -->
</head>

<body class="cBody">
<div class="=whole" style="width: 100%;height: 100%">
    <div class="leftHand" style="width: 25%;height:100%;float: left;position: relative;">
        <div class="person" style="border-style: solid;width: 97%;height: 300px;background-color: yellow">
            <p style="border-bottom-style: dashed;text-align: center;width: 100%;float: left;font-family: 楷体;font-size: xx-large">
                个人信息</p>
            <div class="Image" style="text-align: center">
                <img src="/images/headImgs/${result.data.uPhoto}" style="width: 140px;height: 140px;">
                <table style="width: 100%;float: left;font-size: large">
                    <colgroup>
                        <col width="40%">
                        <col width="60%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td>工号：</td>
                        <td>${sessionScope.result.data.uAccount}</td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td>${sessionScope.result.data.uName}</td>
                    </tr>
                    <tr>
                        <td>手机号：</td>
                        <td>${sessionScope.result.data.uTel}</td>
                    </tr>
                    <tr>
                        <td>入职时间：</td>
                        <td><fmt:formatDate value="${sessionScope.result.data.uHiredate}" pattern="yyyy年MM月dd日"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="datetime"
             style="border-style: solid;width: 97%;height: 374px;background-color: seashell;margin-top: 10px">
            <p style="border-bottom-style: dashed;text-align: center;width: 100%;float: left;font-family: 楷体;font-size: xx-large">
                日历</p>
            <div class="site-demo-laydate" style="text-align: center;">
                <div class="layui-inline" id="test-n1"></div>
            </div>
        </div>
    </div>
    <div class="rightHand"
         style="width: 75%;height:100%;float: left;position: relative;background-color: #00aaee"></div>
    <div class="middle-left" style="width: 50%;height:100%;float:left;">
        <div class="announce"
             style="border-style: solid;width: 98.5%;height: 688px;float: left;background-color: lightgoldenrodyellow">
            <p style="border-bottom-style: dashed;text-align: center;width: 100%;float: left;font-family: 楷体;font-size: xx-large">
                轻松一刻</p>
            <div class="layui-carousel" id="test1" lay-filter="test1" style="float:left;">
                <div carousel-item="">
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/1.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/2.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/3.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/4.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/5.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/6.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/7.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/8.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/9.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/10.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/11.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/12.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/13.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/14.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/15.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/16.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/17.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/18.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/19.jpg"></div>
                    <div><img style="width: 100%;height: 650px" src="/layui/images/animals/20.jpg"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="middle-right" style="width: 25%;height: 100%;float:left;">
        <div class="tips" style="width: 98.5%;height: 688px;float:left;border-style: solid;">
            <p style="border-bottom-style: dashed;text-align: center;width: 100%;float: left;font-family: 楷体;font-size: xx-large">
                备忘录</p>
            <textarea class="layui-textarea" style="width: 100%;height: 602px" name="tip" id="forgetTip"></textarea>
            <div style="border-top-style: dashed;text-align: center;width: 100%;float: left;font-size: xx-large;">
                <button class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius" type="button"
                        style="float: right;" onclick="upSave()">保存
                </button>
            </div>
        </div>
    </div>

</div>

<script>
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            ,arrow: 'always'
            ,width:'100%'
            ,height:'650px'
        });
    });
</script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //直接嵌套显示
        laydate.render({
            elem: '#test-n1'
            , theme: 'grid'
            , position: 'static'
        });
    });
</script>
<script>
    $(function () {

        $.ajax({
            url: "/getForgetText",//商品表更新数据接口
            dataType: "json",
            type: "POST",
            data: {uID: "${sessionScope.result.data.uID}"},
            success: function (data) {
                $("#forgetTip").val(data.data.forget)
            }
        });
    });

    function upSave() {
        $.ajax({
            url: "/editForget",//商品表更新数据接口
            dataType: "json",
            type: "POST",
            data: {uID: "${sessionScope.result.data.uID}", forget: $('#forgetTip').val()},
            success: function (data) {
                if (data.status == 200) {
                    layer.msg("保存成功");
                } else {
                    layer.msg("更改失败");
                }
            }
        })
    }
</script>
</body>

</html>
