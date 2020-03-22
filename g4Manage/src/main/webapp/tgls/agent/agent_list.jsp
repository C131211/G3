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

    <table class="layui-table" id="uList"
           data-options="toolbar:funListToolbar,url:'数据库用户表',fitColumns:true,singleSelect:true,pagination:true,collapsible:true, showFooter:false">
        <thead>
        <tr>
            <th data-options="field:uID">用户ID</th>
            <th data-options="field:uAccount">工号</th>
            <th data-options="field:uName">员工名</th>
            <th data-options="field:uPwd">密码</th>
            <th data-options="field:uTel">联系方式</th>
            <th data-options="field:uAddr">住址</th>
            <th data-options="field:uHiredate">入职时间</th>
            <th data-options="field:rID">角色ID</th>
            <th data-options="field:'uStatus',formatter:function(value){
							if(value==1){value='正常';return value;}else{value='锁定';return value;}
							}"><span>用户状态</span></th>
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


        //dataGrid工具栏
        var funListToolbar = [{
            text: '新增',
            iconCls: 'icon-add',
            handler: function () {
                window.location.href = "user-add";
            }
        }, {
            text: '编辑',
            iconCls: 'icon-edit',
            handler: function () {
                var select = $("#uList").datagrid('getSelected');
                if (select == null || select == '') {
                    $.messager.alert('提示', '必须选择一个内容才能编辑!');
                    return;
                }
                window.location.href = "user/queryid/" + select.uid;
            }

        }, {
            text: '删除',
            iconCls: 'icon-cancel',
            handler: function () {
                var select = $("#uList").datagrid('getSelected');
                if (select == null || select == '') {
                    $.messager.alert('提示', '必须选择一个内容才能删除!');
                    return;
                }
                var UserConfirm = window.confirm("你确认要删除用户名为" + select.username + "的用户吗");
                if (UserConfirm) {
                    $.ajax({
                        url: "user/del",//删除用户
                        dataType: "json",
                        type: "POST",
                        data: {uid: select.uid},
                        success: function (data) {
                            if (data.status == 200) {
                                alert(data.msg);
                                window.location.reload();
                            } else {
                                alert(data.msg);
                            }
                        }
                    })
                }
            }
        }];
    </script>
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