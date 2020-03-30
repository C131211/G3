<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/11
  Time: 15:46
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
    <div class="PowerList">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="selectPName" required lay-verify="required" placeholder="输入权限名" autocomplete="off"
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
        <table class="layui-hide" id="powList" lay-filter="pTools"></table>
    </div>
</div>
</body>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script id="toolbarDemo" type="text/html">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addPower">增加新权限</button>
    </div>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#powList'   //表格ID
            , url: '/userList' //权限表数据接口
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            ,request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , height: 'full-200'  //高度最大化自适应
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , method:'post'//传输方式
            , defaultToolbar: [ 'exports', 'print',]
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'pID', title: '权限ID', width: 80}
                , {field: 'pName', title: '权限名称', width: 100}
                , {field: 'rID', title: '角色ID', width: 80}
                , {field: 'fID', title: '功能ID', width: 80}
                , {field: 'pExplain', title: '权限说明', }
                , {field: 'right', title: '操作', toolbar: '#barDemo', width: 144}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(pTools)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event) {
                case 'addPower':
                    layer.open({
                        title: "增加权限",
                        type: 2,
                        area: ['70%', '60%'],
                        scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                        maxmin: true,
                        end: function () {
                            window.location.reload();
                        },
                        content: 'power_add.jsp'
                    });
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(pTools)', function (obj) {
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url: "/userDelById",//添加用户
                        type: "POST",
                        dataType: "json",
                        data: {pID:data.pID},
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
                    title: "权限修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content:'/PageOperation?id='+data.pID+'&pageType=powerEdit'
                })
            }
        });

        //查询作用
        $("#select").click(function (){
            table.reload("powList",{
                where: { //设定异步数据接口的额外参数，任意设
                    pName: $("#selectPName").val()
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        })
    });
</script>

</html>
