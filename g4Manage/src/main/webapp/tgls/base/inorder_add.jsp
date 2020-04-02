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

    <form class="layui-form" id="addInOrder" action="#">

        <fieldset class="layui-elem-field">
            <input type="hidden" name="uName" id="uName">

            <div style="padding-top: 25px;" class="layui-field-box">
                <div class="layui-form-item">

                    <label class="layui-form-label">入库仓库</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <select class="layui-form-select" lay-verify="required" id="select_sID"></select>
                    </div>

                </div>

                <div class="layui-form-item">

                    <label class="layui-form-label">确认人</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <select class="layui-form-select" lay-verify="required" id="select_user"></select>
                    </div>

                </div>
            </div>
        </fieldset>
        <div class="layui-form">
            <div class="layui-btn">
                <div class="btn" onclick="add_line()">添加</div>
            </div>
            <table class="layui-table">
                <thead>
                <tr>
                    <td class='td_ID' width="50px">
                        序号
                    </td>
                    <td class='td_goodName'>
                        商品名字
                    </td>
                    <td class='td_ILNum' width="100px">
                        数量
                    </td>
                    <td class='td_ILprice' width="100px">
                        单价
                    </td>
                    <td class='td_ILTotal'>
                        小计
                    </td>
                    <td class='td_ILFrom'>
                        供货商
                    </td>
                    <td class='td_operation'>
                        操作
                    </td>
                </tr>
                </thead>
                <tbody id="content"></tbody>

            </table>
        </div>

        <script>
            function add_line() {
                max_line_num = $("#content tr:last-child").children("td").html();
                if (max_line_num == null) {
                    max_line_num = 1;
                } else {
                    max_line_num = parseInt(max_line_num);
                    max_line_num += 1;
                }
                $('#content').append(
                    "<tr id='line" + max_line_num + "'>" +
                    "<td class='td_ID'>" + max_line_num + "</td>" +
                    "<td class='td_goodName'><select class='layui-form-select' lay-verify='required' id='select_goodName' " + max_line_num + "'></select></td>" +
                    "<td class='td_ILNum'><input type='text' class='layui-input' name='ILNum' lay-verify='required' style='width: 100px' " + max_line_num + "'></input></td>" +
                    "<td class=td_ILprice'><input type='text' class='layui-input' name='ILprice' lay-verify='required' style='width: 100px' " + max_line_num + "'></input></td>" +
                    "<td class=td_ILTotal'><input type='text' class='layui-input' name='ILTotal' lay-verify='required' " + max_line_num + "'></input></td>" +
                    "<td class=td_ILFrom'><input type='text' class='layui-input' name='ILFrom' lay-verify='required' " + max_line_num + "'></input></td>" +
                    "<td class='td_oparation'>" +
                    "<botton class='layui-btn' onclick='remove_line(this);'>删除</botton> " + "</td>" +
                    "</td>");
            }

            function remove_line(index) {
                if (index != null) {
                    currentStep = $(index).parent().parent().find("td:first-child").html();
                }
                if (currentStep == 0) {
                    alert('请选择一项!');
                    return false;
                }
                if (confirm("确定要删除改记录吗？")) {
                    $("#content tr").each(function () {
                        var seq = parseInt($(this).children("td").html());
                        if (seq == currentStep) {
                            $(this).remove();
                        }
                        if (seq > currentStep) {
                            $(this).children("td").each(function (i) {
                                if (i == 0) $(this).html(seq - 1);
                            });
                        }
                    });
                }
            }

        </script>

        <script type="text/html" id="selectTool">
            <select name="selectDemo" lay-filter="selectDemo" lay-search>
                <option value="">请选择或输入要输入的</option>
                {{# layui.each(${selectByExample}, function(index, item){}}
                <option>{{ item.goodName }}</option>
                {{# });}}
            </select>
        </script>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button id="addTable" class="layui-btn layui-btn-sm layui-btn-normal" lay-event="add">添加行
                </button>
            </div>
        </script>
        <script type="text/html" id="bar">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>

        <table id="demo" lay-filter="tableFilter"></table>
        <div class="layui-form-item" style="margin-top: 30px;text-align: center;">
            <button class="layui-btn" lay-submit="" lay-filter="*">提交</button>
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
                url: "/getAllGoodList",
                async: true,
                type: "post",
                data: {"goodName": data.value},
                success: function (data) {
                    if (typeof (data) == "string") {
                        data = JSON.parse(data)
                    }
                    elem.find("td[data-field='goodName']").children().html(data.data.goodName);
                    elem.find("td[data-field='ILNum']").children().html(data.data.ILNum);
                    elem.find("td[data-field='ILprice']").children().html(data.data.ILprice);
                    elem.find("td[data-field='ILTotal']").children().html(data.data.ILTotal);
                    elem.find("td[data-field='ILFrom']").children().html(data.data.ILFrom);

                    $.each(tabledata, function (index, value) {
                        if (value.LAY_TABLE_INDEX == dataindex) {
                            value.goodName = data.data.goodName;
                            value.ILNum = data.data.ILNum;
                            value.ILprice = data.data.ILprice;
                            value.ILTotal = data.data.ILTotal;
                            value.ILFrom = data.data.ILFrom;
                        }
                    });
                }
            }))
        });

        var tableIns = table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo'
            , defaultToolbar: []
            , limit: 100
            , method: 'post'//传输方式
            , cols: [[
                {field: 'goodName', title: '商品名称', templet: '#selectTool'}
                , {field: 'ILNum', title: '数量', edit: 'text'}
                , {field: 'ILprice', title: '入库价', edit: 'text'}
                , {field: 'ILTotal', title: '小计'}
                , {field: 'ILFrom', title: '供货商', edit: 'text'}
                , {field: 'right', title: '操作', toolbar: '#bar'}
            ]]
            , data: [{
                "goodName": ""
                , "ILNum": ""
                , "ILprice": ""
                , "ILTotal": ""
                , "ILFrom": ""
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
                    $cr.parents('tr').find("td[data-field='ILTotal']").children().html(sub);
                    $.each(tabledata, function (index, value) {
                        if (value.LAY_TABLE_INDEX == dataindex) {
                            value.ILTotal = sub;
                        }
                    });
                });

                unitpriceelem.on("input", function (e) {
                    var $cr = $(e.target);
                    var dataindex = $cr.parents('tr').attr("data-index");
                    var number = $cr.parents('tr').find("td[data-field='ILNum']").children().html();
                    var sub = number * e.target.value;
                    $cr.parents('tr').find("td[data-field='ILTotal']").children().html(sub);
                    $.each(tabledata, function (index, value) {
                        if (value.LAY_TABLE_INDEX == dataindex) {
                            value.ILTotal = sub;
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
                    , "ILTotal": ""
                    , "ILFrom": ""
                })
                table.reload('demo', {
                    data: tabledata
                });
            }
            ;
        });

        function addInOrder() {
            $.ajax({
                url: "/addInList",//添加用户
                type: "POST",
                dataType: "json",
                data: $('#addInOrder').serialize(),
                success: function (data) {
                    if (data.status == 200) {
                        //接收到成功的提示
                        layer.msg("添加成功");
                        window.location.reload();
                    } else {
                        alert(data.msg);
                    }
                }

            })
        }

        //保存按钮
        form.on('submit(*)', function (data) {
            addInOrder();
            return false;
        });
    })


    $(function () {
        //获取下拉框数据
        $.ajax({
            url: "/getAllGoodList",
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.status == 200) {
                    //接收到成功的提示
                    for (var i = 0; i < data.data.length; i++) {
                        var option = $("<option />");
                        option.html(data.data[i].goodName);
                        option.val(data.data[i].goodName);
                        $("#select_goodName").append(option);
                    }

                } else {
                    alert(data.msg);
                }
            }
        })

        //仓库选择
        $.ajax({
            url: "/getSaveName",
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.status == 200) {
                    //接收到成功的提示
                    for (var i = 0; i < data.data.length; i++) {
                        var option = $("<option />");
                        option.html(data.data[i].sName);
                        option.val(data.data[i].sID);
                        $("#select_sID").append(option);
                    }

                } else {
                    alert(data.msg);
                }
            }
        })


        //确认人选择
        $.ajax({
            url: "/getRoleUser",
            type: "POST",
            dataType: "json",
            success: function (data) {
                if (data.status == 200) {
                    //接收到成功的提示
                    for (var i = 0; i < data.data.length; i++) {
                        var option = $("<option />");
                        option.html(data.data[i].uName);
                        option.val(data.data[i].uName);
                        $("#select_user").append(option);
                    }
                } else {
                    alert(data.msg);
                }
            }
        })


    })
</script>

</script>
<
/body>
< /html>
