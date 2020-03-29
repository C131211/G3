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
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css"  media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>

</head>

<body>
<div class="cBody">
    <div class="agentList">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="text"  id="selectUName" required lay-verify="required" placeholder="输入员工名"
                           autocomplete="off" class="layui-input">
                </div>
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="select">检索</button>
            </div>
        </form>
    </div>

    <table class="layui-hide" id="uList" lay-filter="uTools"></table>

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
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script id="toolbarDemo" type="text/html">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="addUser">增加新用户</button>
    </div>
</script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#uList'   //表格ID
            ,url:'/userList' //数据接口
            ,request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'rows' //每页数据量的参数名，默认：limit
            }
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,page:true     //开启分页
            ,height:'full-200'  //高度最大化自适应
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['exports', 'print' ]
            ,method:'post'//传输方式
            ,cols: [[
                {type:'checkbox',fixed:'left'}
                ,{field:'uID', width:80, title: 'ID', sort: true}
                ,{field: 'uAccount', title: '工号(用户名)', width:120}
                 ,{field: 'uName', title: '员工名', width:80}
                 ,{field: 'uPwd', title: '密码', width:80}
                 ,{field: 'uTel', title: '手机号', width: 130}
                 ,{field: 'uAddr', title: '住址', width: 250}
                 ,{field: 'uHiredate', title: '入职时间', width: 150, sort: true,
                    templet:'<div>{{ Format(d.uHiredate,"yyyy-MM-dd")}}</div>'
                }
                 ,{field: 'rID', title: '角色ID',width: 80,templet:function(d){
                            if(d.rID==0){
                                return d.rID="超级管理员"
                            }else if(d.rID==1){
                                return d.rID="仓管员"
                            }else if(d.rID==2){
                                return d.rID="运输员"
                             }
                        }}
                ,{field: 'uStatus', title: '用户状态', width: 90,templet:function(d){
                    if(d.uStatus==0){
                       return d.uStatus="正常"
                    }else {
                        return d.uStatus="锁定"
                    }
                }}
                ,{field: 'right', title:'操作', toolbar: '#barDemo', width:144}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(uTools)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'addUser':
                    layer.open({
                        title:"增加用户",
                        type: 2,
                        area: ['70%', '60%'],
                        scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                        maxmin: true,
                        end: function () {
                            window.location.reload();
                        },
                        content: 'agent_add.jsp',
                    })
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(uTools)', function(obj){
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
            } else if(obj.event === 'edit') {
                    layer.open({
                    title: "用户信息修改",
                    type: 2,
                    area: ['70%', '60%'],
                    scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                    maxmin: true,
                    end: function () {
                        window.location.reload();
                    },
                    content: '/PageOperation?id='+data.uID+'&pageType=userEdit',

                })
            }
        });


        //查询作用
        $("#select").click(function (){
            table.reload("uList",{
                where: { //设定异步数据接口的额外参数，任意设
                    uName: $("#selectUName").val()
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
        })


    });



    //时间格式化
    function Format(datetime,fmt) {
        if (parseInt(datetime)==datetime) {
            if (datetime.length==10) {
                datetime=parseInt(datetime)*1000;
            } else if(datetime.length==13) {
                datetime=parseInt(datetime);
            }
        }
        datetime=new Date(datetime);
        var o = {
            "M+" : datetime.getMonth()+1,                 //月份
            "d+" : datetime.getDate(),                    //日
            "h+" : datetime.getHours(),                   //小时
            "m+" : datetime.getMinutes(),                 //分
            "s+" : datetime.getSeconds(),                 //秒
            "q+" : Math.floor((datetime.getMonth()+3)/3), //季度
            "S"  : datetime.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (datetime.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }

</script>


</body>


</html>