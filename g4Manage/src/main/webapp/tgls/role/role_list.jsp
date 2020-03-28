<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/11
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

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
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css"  media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>

</head>

<body>
<div class="cBody">
    <div class="roleList">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="name" required lay-verify="required" placeholder="输入角色名" autocomplete="off"
                           class="layui-input">
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

    <table class="layui-hide" id="rList" lay-filter="rTools"></table>
</div>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script id="toolbarDemo" type="text/html">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addRole">增加新角色</button>
    </div>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#rList'   //表格ID
            , url: '/userList' //角色表用户接口
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print',]
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'rID', title: '角色ID', width: 80}
                , {field: 'rName', title: '角色名', }
                , {field: 'rExplain', title: '角色说明', }
                , {
                    field: 'rStatus', title: '角色状态', templet: function (d) {
                        if (d == 0) {
                            return d = "正常"
                        } else {
                            return d = "锁定"
                        }
                    }
                }
                , {field: 'right', title: '操作', toolbar: '#barDemo', width: 144}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(rTools)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event) {
                case 'addRole':
                    layer.open({
                        title: "增加角色",
                        type: 2,
                        area: ['70%', '60%'],
                        scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                        maxmin: true,
                        content: 'role_add.jsp'
                    });
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(rTools)', function (obj) {
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url: "/userDelById",//添加用户
                        type: "POST",
                        dataType: "json",
                        data: {uID:data.uID},
                        success: function (data) {
                            if (data.status == 200) {
                                //接收到成功的提示
                                window.location.reload();
                            } else {
                                alert(data.msg);
                            }
                        }

                    })
                });
            } else if (obj.event === 'edit') {
                layer.open({
                    title: "角色信息修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content: '/roleOperation?rID='+data.rID+'&pageType=edit'
                });
            }
        });
    });
</script>
</body>
</html>