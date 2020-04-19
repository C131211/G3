<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/28
  Time: 17:39
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

<body class="cBody">
<div>
    <div class="glList">
        <table class="layui-hide" id="glList" lay-filter="glTools"></table>
    </div>
</div>
</body>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script id="toolbarDemo" type="text/html">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addGoodList">新增货物型号</button>
    </div>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#glList'   //表格ID
            , url: '/getGoodList' //数据接口
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            ,request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print',]
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'goodName', title: '货物型号名称', }
                , {field: 'gOutprice', title: '出货价', width: 80}
                , {field: 'right', title: '操作', toolbar: '#barDemo', width: 144}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(glTools)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event) {
                case 'addGoodList':
                    layer.open({
                        title: "增加货物型号",
                        type: 2,
                        area: ['70%', '60%'],
                        scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                        maxmin: true,
                        end: function () {
                            window.location.reload();
                        },
                        content: 'gl_add.jsp'
                    });
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(glTools)', function (obj) {
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url: "/delGoodList",
                        type: "POST",
                        dataType: "json",
                        data: {glId:data.glId},
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
            } else if(obj.event === 'edit') {
                layer.open({
                    title: "货物型号修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content: '/PageOperation?id='+data.glId+'&pageType=glEdit'
                })
            }
        });


        //查询作用
        $("#select").click(function (){
            table.reload("glList",{
                where: { //设定异步数据接口的额外参数，任意设
                    goodName: $("#selectGlName").val()
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        })
    });
</script>
</html>
