<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/17
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>仓库管理系统</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css">
    <script type="text/javascript" src="/framework/jquery-1.11.3.min.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../../css/jquery.mCustomScrollbar.css">
    <script src="/framework/jquery-ui-1.10.4.min.js"></script>
    <script src="/framework/jquery.mousewheel.min.js"></script>
    <script src="/framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->
    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css" media="all">
    <%--引入js--%>
    <script src="../../js/out_intoData.js"></script>
    <!-- 公共样式 结束 -->

</head>
<body class="cBody">
<div class="=whole" style="width: 100%;height: 100%">
<div class="leftHand" style="width: 25%;height:100%;float: left;position: relative;">
    <div class="person" style="border-style: solid;width: 97%;height: 300px;background-color: yellow">
        <p style="border-bottom-style: dashed;text-align: center;width: 100%;float: left;font-family: 楷体;font-size: xx-large">个人信息</p>
        <div class="Image" style="text-align: center">
        <img src="/images/headImgs/${result.data.uPhoto}" style="width: 140px;height: 140px;">
            <div style="font-size: large;">工号：${sessionScope.result.data.uAccount}</div>
            <div style="font-size: large;">姓名：${sessionScope.result.data.uName}</div>
            <div style="font-size: large;">手机号：${sessionScope.result.data.uTel}</div>
            <div style="font-size: large;">入职时间：${sessionScope.result.data.uHiredate}</div>
        </div>
    </div>
    <div class="datetime" style="border-style: solid;width: 97%;height: 374px;background-color: seashell;margin-top: 10px">
    <p style="border-bottom-style: dashed;text-align: center;width: 100%;float: left;font-family: 楷体;font-size: xx-large">日历</p>
        <div class="site-demo-laydate" style="text-align: center;">
            <div class="layui-inline" id="test-n1" ></div>
        </div>
    </div>
</div>
<div class="rightHand" style="width: 75%;height:100%;float: left;position: relative;background-color: #00aaee"></div>
    <div class="middle-left" style="width: 50%;height:100%;float:left;">
        <div class="announce" style="border-style: solid;width: 98.5%;height: 300px;float: left;background-color: whitesmoke">
            <p style="border-bottom-style: dashed;text-align: center;width: 100%;float: left;font-family: 楷体;font-size: xx-large">通知栏</p>
            <div class="content">

            </div>
        </div>
        <div class="event" style="border-style: solid;width:98.5%;height: 374px;background-color: cornsilk;margin-top: 10px;float: left">
        <p style="border-bottom-style: dashed;text-align: center;width: 100%;float: left;font-family: 楷体;font-size: xx-large">未处理事件</p>
            <div class="content">
            </div>
        </div>
    </div>
    <div class="middle-right" style="width: 25%;height: 100%;float:left;">
        <div class="tips" style="width: 98.5%;height: 688px;float:left;border-style: solid;">
            <p style="border-bottom-style: dashed;text-align: center;width: 100%;float: left;font-family: 楷体;font-size: xx-large">
                备忘录</p>
            <textarea class="layui-textarea" style="width: 100%;height: 648px" name="tip"></textarea>
        </div>
    </div>

</div>
<script src="../js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //直接嵌套显示
        laydate.render({
            elem: '#test-n1'
            ,theme: 'grid'
            ,position: 'static'
        });
    });
</script>
</body>

</html>
