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

</head>

<body>
<div class="cBody">
    <div class="console">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="name" required lay-verify="required" placeholder="输入员工名或者员工号"
                           autocomplete="off" class="layui-input">
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

    <table class="layui-table">
        <thead>
        <tr>
            <th>用户ID</th>
            <th>工号</th>
            <th>成员名</th>
            <th>密码</th>
            <th>联系方式</th>
            <th>住址</th>
            <th>入职时间</th>
            <th>角色ID</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>龙九山</td>
            <td>DLS201802281450280741</td>
            <td>无锡市</td>
            <td>龙九山</td>
            <td>龙九山</td>
            <td>18600001111</td>
            <td>028-6666666</td>
            <td>123456789@qq.com</td>
            <td>
                <button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
                <button class="layui-btn layui-btn-xs">删除</button>
            </td>
        </tr>
        <tr>
            <td value="${result.data.uID}"></td>
            <td value="${result.data.uAccount}"></td>
            <td value="${result.data.uName}"></td>
            <td value="${result.data.uPwd}"></td>
            <td value="${result.data.uTel}"></td>
            <td value="${result.data.uAddr}"></td>
            <td value="${result.data.uHiredate}"></td>
            <td value="${result.data.rID}"></td>
            <td value="${result.data.uStatus}"></td>
            <td>
                <button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
                <button class="layui-btn layui-btn-xs">删除</button>
            </td>
        </tr>
        <tr>
            <td>龙九山</td>
            <td>DLS201802281450280741</td>
            <td>无锡市</td>
            <td>龙九山</td>
            <td>龙九山</td>
            <td>18600001111</td>
            <td>028-6666666</td>
            <td>123456789@qq.com</td>
            <td>
                <button class="layui-btn layui-btn-xs" onclick="updateBut()">修改</button>
                <button class="layui-btn layui-btn-xs">删除</button>
            </td>
        </tr>
        </tbody>
    </table>

    <!-- layUI 分页模块 -->
    <div id="pages"></div>
    <script>
        layui.use('laypage', function () {
            var laypage = layui.laypage;

            //总页数大于页码总数
            laypage.render({
                elem: 'pages'
                , count: 100
                , layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
                , jump: function (obj) {
//					      console.log(obj)
                }
            });
        });

        //修改按钮
        var updateFrame = null;

        function updateBut() {
            layui.use('layer', function () {
                var layer = layui.layer;

                //iframe层-父子操作
                updateFrame = layer.open({
                    title: "用户信息修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    content: 'agent_update.jsp'
                });
            });

        }
    </script>
</div>
</body>


</html>