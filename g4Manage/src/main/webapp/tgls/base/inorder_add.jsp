<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/9
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <%--引入时间格式转换--%>
    <script src="/js/TimeFormat.js" charset="utf-8"></script>
    <style>
        /*防止下拉框的下拉列表被隐藏的样式*/
        . layui-table-cell {
            overflow: visible
        }

        . layui-table-box {
            overflow: visible
        }

        . layui-table-body {
            overflow: visible;
        }

        /*设置下拉框的高度与表格单元相同的样式*/
        td. layui-form-select {
            margin-top: -10px;
            margin-left: -15px;
            margin-right: -15px;
        }
    </style>

</head>
<body class="childrenBody">
<div style="padding: 15px;" class="cBody">

    <form class="layui-form" id="fromId" action="#">

        <fieldset class="layui-elem-field">

            <div style="padding-top: 25px;" class="layui-field-box">
                <div class="layui-form-item">

                    <label class="layui-form-label">入库人</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="ILBy" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>

                    <label class="layui-form-label">仓库</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="sID" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>

                    <label class="layui-form-label">金额</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="ILTotal" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">入库日期</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="ILDate" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>

                    <label class="layui-form-label">制单人</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="documentmaker" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>

                    <label class="layui-form-label">供应商</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="ILFrom" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>
                </div>
            </div>
        </fieldset>

        <script type="text/html" id="selectTool">
            <select name="selectDemo" lay-filter="selectDemo" lay-search>
                <option value="">请选择或输入要输入的</option>
                {{#  layui.each(${selectByExample}, function(index, item){ }}
                <option>{{ item.goodName }}</option>
                {{# }); }}
            </select>
        </script>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button id="addTable" class="layui-btn layui-btn-sm layui-btn-normal" lay-event="add">添加行</button>
            </div>
        </script>
        <script type="text/html" id="bar">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>

        <table id="demo" lay-filter="tableFilter"></table>
        <div class="layui-form-item" style="margin-top: 30px;text-align: center;">
            <button class="layui-btn" lay-submit="" lay-filter="*">保存</button>
            <a href="$(contextPath)/storage/toList" class="layui-btn layui-btn-primary">返回</a>
        </div>
    </form>
</div>
<script type="text/javascript"></script>
<script>
    layui.use(['laydate', 'table', 'form', 'jquery'], function () {
        var table = layui.table,
            form = layui.form,
            laydate = layui.laydate,
            $ = layui.jquery;

        laydate.render({
            elem: '#date'//指定元素
        });

        form.on('select(selectDemo)', function (data) {
            var elem = data.othis.parents('tr');
            var dataindex = elem.attr("data-index");
            $.each(tabledata, function (index, value) {
                if (value.LAY_TABLE_INDEX == dataindex) {
                    value.goodName = data.value;
                }
            });

            if (data.value) ($.ajax({
                url: "${contextPath}/storage/toSelect",
                async: true,
                type: "post",
                data: {"goodName": data.value},
                success: function (data) {
                    if (typeof (data) == "string") {
                        data = JSON.parse(data)
                    }
                    elem.find("td[data-field='goodName']").children().html(data.data.goodName);
                    elem.find("td[data-field='ILprice']").children().html(data.data.ILprice);

                    $.each(tabledata, function (index, value) {
                        if (value.LAY_TABLE_INDEX == dataindex) {
                            value.goodName = data.data.goodName;
                            value.ILprice = data.data.ILprice;
                        }
                    });
                }
            }))
        })
        var tableIns = table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo'
            , defaultToolbar: []
            , limit: 100
            , cols: [[
                {field: 'goodName', tit1e: '商品名称', templet: '#selectTool'}
                , {field: 'ILNum', tit1e: '数量', edit: 'text'}
                , {field: 'ILprice', tit1e: '入库价', edit: 'text'}
                , {field: 'subtotal', tit1e: '小计'}
                , {field: '操作', align: 'center', toolbar: '#bar'}
            ]]
            , data: [{
                "goodName": ""
                , "ILNum": ""
                , "ILprice": ""
                , "subtotal": ""
            }]

            , done: function (res, curr, count) {
                tabledata = res.data;
                $('.layui-form-select').find('input').unbind("blur");

                $('tr').each(function (e) {
                    var $cr = $(this);
                    var dataindex = $cr.attr("data-index");

                    $.each(tabledata, function (index, value) {


                        if (value.LAY_TABLE_INDEX == dataindex) {
                            $cr.find('input').val(value.goodName);
                        }

                    });

                });

                //输入框的值改变时触发
                $('.layui-form-select').find('input').on("change", function (e) {
                    var $cr = $(e.target);
                    console.log(scr);
                    var dataindex = $cr.parents('tr').attr("data-index");
                    var selectdata = $cr.val();
                    $.each(tabledata, function (index, value) {
                        if (value.LAY_TABLE_INDEX == dataindex) {
                            value.goodName = selectdata;
                        }
                    });
                });
                var numberelem = $('.layui-table-main').find("td[data-field='ILNum']");
                var unitpriceelem = $('.layui-table-main').find("td[data-field='ILprice']");
                numberelem.on("input", function (e) {
                    var $cr = $(e.target);
                    var dataindex = $cr.parents('tr').attr("data-index");
                    var unitprice = $cr.parents('tr').find("td[data-field='ILprice']").children().html();
                    var sub = unitprice * e.target.value;
                    $cr.parents('tr').find("td[data-field='subtotal']").children().html(sub);
                    $.each(tabledata, function (index, value) {
                        if (value.LAY_TABLE_INDEX == dataindex) {
                            value.subtotal = sub;
                        }
                    });
                });

                unitpriceelem.on("input", function (e) {
                    var $cr = $(e.target);
                    var dataindex = $cr.parents('tr').attr("data-index");
                    var number = $cr.parents('tr').find("td[data-field='ILNum']").children().html();
                    var sub = number * e.target.value;
                    $cr.parents('tr').find("td[data-field='subtotal']").children().html(sub);
                    $.each(tabledata, function (index, value) {
                        if (value.LAY_TABLE_INDEX == dataindex) {
                            value.subtotal = sub;
                        }
                    });
                });
            }
        });
        var tabledata;
        //监听工具条
        table.on('tool(tableFilter)', function (obj) {
                if (obj.event === 'del') {
                    obj.del();
                }

            }
        )

        //添加按钮
        table.on('toolbar(tableFilter)', function (obj) {
            if (obj.event === 'add') {
                tabledata.push({
                    "goodName": ""
                    , "ILNum": ""
                    , "ILprice": ""
                    , "subtotal": ""
                })
                table.reload('demo', {
                    data: tabledata
                });
            }
            ;
        });


        //保存按钮
        form.on('submit(*)', function (data) {
            $.ajax({
                url: "/addInList",//上传的URL
                async: true,
                type: "post",
                data: $(data.form).serialize() + '&tabledata=' + JSON.stringify(tabledata),
                success: function (data) {
                    if (typeof (data) == 'string') {
                        data = JSON.parse(data)
                    }
                    if (data.code == 0) {
                        layer.msg(data.msg);
                        windowlocation.href = "${contextPath}/storage/toList";
                    } else {
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        });
    })
</script>
</body>
</html>
