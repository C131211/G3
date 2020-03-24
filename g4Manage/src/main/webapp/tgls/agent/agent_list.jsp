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
                    <input type="text" name="uName" required lay-verify="required" placeholder="输入员工名"
                           autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo">检索</button>
            </div>
        </form>
    </div>

    <table class="layui-table" lay-data="{url:'/demo/table/user/', page:true, id:'uList'}" lay-filter="test">
        <thead>
        <tr>
            <th lay-data="{field:'uID'}">用户ID</th>
            <th lay-data={field:'uAccount'}">工号</th>
            <th lay-data={field:'uAccount'}">员工名</th>
            <th lay-data={field:'uAccount'}">密码</th>
            <th lay-data={field:'uAccount'}">联系方式</th>
            <th lay-data={field:'uAccount'}">住址</th>
            <th lay-data={field:'uAccount'}">入职时间</th>
            <th lay-data={field:'uAccount'}">角色ID</th>
            <th lay-data={field:'uStatus'}">用户状态</th>
            <th data-options="">操作</th>
        </tr>
        </thead>
    </table>
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

    <script>
        //查询作用
        $("#select").click(function () {
            $('#uList').datagrid({
                queryParams: {
                    username: $("#selectText").val()
                }
            });
        });
        //制作表格第二种方法
        // layui.use('table', function(){
        //     var table = layui.table;
        //     //表单初始化
        //     table.render({
        //         elem: '#demo'
        //         ,height: 312
        //         ,url: '/demo/table/user/' //数据接口
        //         ,page: true //开启分页
        //         ,cols: [[ //表头
        //             {field: 'uID', title: '用户ID', width:80, sort: true, fixed: 'left'}
        //             ,{field: 'uAccount', title: '工号(用户名)', width:80,sort: true}
        //             ,{field: 'uName', title: '员工名', width:80}
        //             ,{field: 'uPwd', title: '密码', width:80}
        //             ,{field: 'uTel', title: '手机号', width: 177}
        //             ,{field: 'uAddr', title: '住址', width: 80}
        //             ,{field: 'uHiredate', title: '入职时间', width: 80, sort: true}
        //             ,{field: 'rID', title: '角色ID'}
        //             ,{field: 'uStatus', title: '用户状态', width: 80}
        //         ]]
        //     });
        //
        // });
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