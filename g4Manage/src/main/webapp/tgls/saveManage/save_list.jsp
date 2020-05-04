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
    <!-- 公共样式 结束 -->

    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css"  media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <%--引入时间格式转换--%>
    <script src="/js/TimeFormat.js" charset="utf-8"></script>

    <style>
        .layui-table img {
            max-width: none;
        }
    </style>

</head>

<body class="cBody">
<div>
    <div class="saveList">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text" name="selectSName" id="selectSName" required lay-verify="required" placeholder="输入仓库名称"
                           autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="select">检索</button>
            </div>
        </form>

        <script>
            layui.use('form', function () {
                var form = layui.form;

                //监听提交
                form.on('submit(formDemo)', function (data) {
                    return false;
                });
            });
        </script>
    </div>
    <table class="layui-hide" id="saList" lay-filter="sTools"></table>
</div>
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script id="LookbarDemo" type="text/html">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看仓库货物</a>
</script>
<script id="toolbarDemo" type="text/html">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addSave">增加新仓库</button>
    </div>
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#saList'   //表格ID
            , url: '/getAllSave' //仓库表数据接口
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , page: true     //开启分页
            ,request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            , height: 'full-200'  //高度最大化自适应
            , method:'post'//传输方式
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['exports', 'print',]
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'sName', title: '仓库名字', width: 100,}
                , {field: 'sNsave', title: '现存量', width: 80}
                , {field: 'sTsave', title: '仓库上限', width: 80}
                , {field: 'sAddr', title: '仓库地址', width: 200}
                , {field: 'sExplain', title: '仓库说明', }
                , {
                    field: 'sStatus', title: '仓库状态', width: 90, templet: function (d) {
                        if(d.sStatus==0){
                            return d.sStatus="正常"
                        }else {
                            return d.sStatus="满仓"
                        }
                    }
                }
                , {field: 'good', title: '查看仓库货物详情', toolbar: '#LookbarDemo', width: 144}
                , {field: 'right', title: '操作', toolbar: '#barDemo', width: 144}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(sTools)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event) {
                case 'addSave':
                    layer.open({
                        title: "增加仓库",
                        type: 2,
                        area: ['70%', '60%'],
                        scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                        maxmin: true,
                        end: function () {
                            window.location.reload();
                        },
                        content: 'save_add.jsp'
                    });
                    break;
            }
        });
        //监听行工具事件
        table.on('tool(sTools)', function (obj) {
            var data = obj.data;
            var htmlStr =
                "<div class='cBody'>" +
                "<table class='layui-table'> " +
                "<colgroup> <col width='150'> <col width='200'> <col> </colgroup>" +
                "<thead> " +
                "<tr> " +
                "<th>货物名</th> " +
                "<th>货物数量</th>" +
                "<th>进货价</th>" +
                "<th>货物描述</th>" +
                "<th>进仓日期</th>" +
                " <th>储存仓库号</th>" +
                "<th>货物状态</th>" +
                " </tr>" +
                " </thead>" +
                "<tbody> " ;
            layui.each(data.good, function (index, item) {
                if(item.gStatus=='0'){
                    item.gStatus='锁定';
                }else{
                    item.gStatus='正常';
                }
                item.gSatime = Format(item.gSatime,"yyyy-MM-dd")
                htmlStr += "<tr> <td>"+item.gName+"</td> <td>"+item.gNum+"</td> <td>"+item.gInprice+"</td> <td>"+item.gExplain+"</td> <td>"+item.gSatime+"</td> <td>"+item.sID+"</td>  <td >"+item.gStatus+"</td> </tr>";
            })
            htmlStr +=  "</tbody> </table> </div>"
            if(obj.event === 'detail') {
                layer.open({
                    title: "仓库详细货物",
                    type: 1,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    content:htmlStr
                });
            }
            else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url: "/delSave",//添加仓库
                        type: "POST",
                        dataType: "json",
                        data: {sID:data.sID},
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
                    title: "仓库信息修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content: '/PageOperation?id='+data.sID+'&pageType=saveEdit'
                })
            }
        });


        //查询作用
        $("#select").click(function (){
            table.reload("saList",{
                where: { //设定异步数据接口的额外参数，任意设
                    sName: $("#selectSName").val()
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        })
    });
</script>
</body>
</html>