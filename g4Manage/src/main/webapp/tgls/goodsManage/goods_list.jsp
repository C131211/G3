<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="RL"/>
    <!-- 作者 -->
    <meta name="revised" content=""/>
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介"/>
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开"/>
    <title>仓库管理系统</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="../../css/base.css">
    <link rel="stylesheet" type="text/css" href="../../css/iconfont.css">
    <script type="text/javascript" src="../../framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../layui/css/layui.css">
    <script type="text/javascript" src="../../layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="../../css/jquery.mCustomScrollbar.css">
    <script src="../../framework/jquery-ui-1.10.4.min.js"></script>
    <script src="../../framework/jquery.mousewheel.min.js"></script>
    <script src="../../framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="../../framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <style>
        .layui-table img {
            max-width: none;
        }
    </style>

</head>

<body>
<div class="cBody">
    <div class="console">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="name" required lay-verify="required" placeholder="输入商品号或名称"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <select name="provid" id="provid" lay-filter="provid">
                        <option value="">存放仓库</option>
                    </select>
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo">检索</button>
            </div>
        </form>
        <script>
            layui.use('form', function () {
                var form = layui.form;

                //监听提交
                form.on('submit(formDemo)', function (data) {
                    layer.msg(JSON.stringify(data.field));
                    return false;
                });
            });
        </script>
    </div>

    <table class="layui-table" lay-data="{url:'/demo/table/user/', page:true, id:'gList'}" lay-filter="test">
        <thead>
        <tr>
            <th lay-data="{field:'gID'}">商品号</th>
            <th lay-data="{field:'gName'}">商品名称</th>
            <th lay-data="{field:'gInprice'}">入货价</th>
            <th lay-data="{field:'gOutprice'}">市场价格</th>
            <th lay-data="{field:'gNum'}">商品数量</th>
            <th lay-data="{field:'sID'}">存放仓库</th>
            <th lay-data="{field:'gSatime'}">入仓日期</th>
            <th lay-data="{field:'gExplain'}">描述</th>
            <th lay-data="{field:'gStatus'}">商品状态</th>
            <th>操作</th>
        </tr>
        </thead>
    </table>
        // //修改规格
        // function specificationsBut(){
        // 	layui.use('layer', function() {
        // 		var layer = layui.layer;
        //
        // 		//iframe层-父子操作
        // 		layer.open({
        // 			type: 2,
        // 			area: ['70%', '60%'],
        // 			fixed: false, //不固定
        // 			maxmin: true,
        // 			content: 'specifications_list.html'
        // 		});
        // 	});
        //
        // }
        //修改按钮
        var updateFrame = null;

        function updateBut() {
            layui.use('layer', function () {
                var layer = layui.layer;

                //iframe层-父子操作
                updateFrame = layer.open({
                    title: "商品信息修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    content: 'goods_update.jsp'
                });
            });

        }
</div>
</body>

</html>