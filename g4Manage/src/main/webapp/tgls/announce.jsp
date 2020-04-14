});
/** * 监听商品列表'行'单击事件 */
table.on('row(List1)', function (obj) {
var data = obj.data;
var isNew = true;
var vKey = data.GoodsID; //产品编码
// 遍历购物车，是否存在产品；存在，数量+1 计算金额
for (var i = 0; i < goodsData.length; i++) {
var tRow = goodsData[i];
if (vKey == tRow.GoodsID) {
tRow.Qty = parseInt(tRow.Qty) + 1;
tRow.Money = accMul(tRow.Qty, tRow.Price, 2);
isNew = false;
break;
}
} //判断当前数据是否为新增数据
if (isNew) {
var tmpRow = {};
tmpRow.Id = data.Id;
tmpRow.GoodsID = data.GoodsID;
tmpRow.GoodsName = data.GoodsName;
tmpRow.Price = data.XPrice;
tmpRow.Qty = 1;
tmpRow.Money = (data.XPrice).toFixed(2);
tmpRow.SalesCode = "";
goodsData.push(tmpRow);
}
//console.log(goodsData);
/** * 开始刷新购物车 */
shoppingCartRefresh();
});


/** * 监听购物车行删除事件 */
table.on('tool(List2)', function (obj, index) {
var data = obj.data;
if (obj.event === 'delet') {
for (var i = 0; i < goodsData.length; i++) {
var gd = goodsData[i];
if (data.GoodsID == gd.GoodsID) {
goodsData.splice(i, 1);
}
/*** 开始刷新购物车 */
shoppingCartRefresh();
}
}
)
}
;
/** * 购物车行编辑事件 */
table.on('edit(List2)', function (obj) {
var data = goodsData;
for (var i = 0; i < data.length; i++) {
if (obj.data.Id == data[i].Id) {
if (isNaN(data[i].Qty) || data[i].Qty < 0) {
data[i].Qty = 0;
}
if (isNaN(data[i].Price) || data[i].Price < 0) {
data[i].Price = 0;
}
data[i].Qty = Number(data[i].Qty);
//数量:声明数字类型
data[i].Price = parseFloat(data[i].Price).toFixed(2); //金额:声明小数类型
data[i].Money = accMul(data[i].Qty, data[i].Price, 2); //计算总金额:保留2位小数
}
}
/** * 开始刷新购物车 */
shoppingCartRefresh();
});

/** * 购物车刷新函数 */
function shoppingCartRefresh() {
var TotalQty = 0;
var TotalMoney = 0;
//数据表格重载
ListTable2.reload({data: goodsData});
//计算总数 合计金额
for (var i = 0; i < goodsData.length; i++) {
TotalQty = accAdd(TotalQty, goodsData[i].Qty);
TotalMoney = (accAdd(TotalMoney, parseFloat(goodsData[i].Money))).toFixed(2);
}
console.log("总数量:" + TotalQty);
console.log("总金额:" + TotalMoney);
$("#RechargeCount_TotalQty").html(TotalQty);
$("#RechargeCount_TotalMoney").html(TotalMoney);
}

/** * 小数加法
* * @param arg1
* * @param arg2
* * @returns {number}
* */
function accAdd(arg1, arg2) {
var r1, r2, m;
try {
r1 = arg1.toString().split(".")[1].length
} catch (e) {
r1 = 0
}
try {
r2 = arg2.toString().split(".")[1].length
} catch (e) {
r2 = 0
}
m = Math.pow(10, Math.max(r1, r2));
return (arg1 * m + arg2 * m) / m;
}

/** * 小数乘法
* * @param arg1
* * @param arg2
* * @param fix
* * @returns {*}
* */
function accMul(arg1, arg2, fix) {
if (!parseInt(fix) == fix) {
return;
}
var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
try {
m += s1.split(".")[1].length
} catch (e) {
}
try {
m += s2.split(".")[1].length
} catch (e) {
}
if (m > fix) {
return (Math.round(Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m - fix)) / Math.pow(10, fix));
} else if (m <= fix) {
return (Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m)).toFixed(fix);
} else {
return (arg1 * arg2).toFixed(fix);
}
}


//fuben
<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/31
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <%--引入css--%>
    <link rel="stylesheet" href="/js/layui-v2.5.6/layui/css/layui.css" media="all">
    <%--引入js--%>
    <script src="/js/layui-v2.5.6/layui/layui.js" charset="utf-8"></script>
    <%--引入时间格式转换--%>
    <script src="/js/TimeFormat.js" charset="utf-8"></script>
    <style>
        /*防止下拉框的下拉列表被隐藏的样式*/
        .layui-table-cell {
            overflow: visible
        }

        .layui-table-box {
            overflow: visible
        }

        .layui-table-body {
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
<div style="padding: 15px;">
    <blockquote class="layui-elem-quote">
            <span class="layui-breadcrumb" style="visibility: visible;">
                <a href=" main.htm1">首页</a>
                    <span lay-separator="">/</span>
                        <a href=" sicontextPath}/ Storage/ toList">物料入库的操作</a>
                                <span lay-separator="">/</span>
                                    <a><cite>物料入库新增的选择</cite></a></span>
    </blockquote>
    <form class="layui-form" id="fromId" action="#">

        <fieldset class="layui-elem-field">

            <div style="padding-top: 25px;" class="layui-field-box">
                <div class="layui-form-item">

                    <label class="layui-form-label">入库人</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="storageuser" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>

                    <label class="layui-form-label">仓库</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="storageid" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>

                    <label class="layui-form-label">金额</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="money" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">入库日期</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="storagetime" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>

                    <label class="layui-form-label">制单人</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="documentmaker" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>

                    <label class="layui-form-label">供应商</label>
                    <div class="layui-input-inline" style="width: 13%">
                        <input type="text" name="supplier" placeholder="请输入" class="layui-input"
                               lay-verify="required">
                    </div>
                </div>
            </div>
        </fieldset>

        <script type="text/html" id="selectTool">
            <select name="selectDemo" lay-filter="selectDemo" lay-search>
                <option value="">请选择或输入要输入的</option>
                {{# layui.each(${selectByExample}, function(index, item){}}
                <option>{{ item.goodName }}</option>
                {{# });}}
            </select>
        </script>
        <script type="text/html" id="toolbarDemo">
            <div align="right" class="layui-btn-container">
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
<script type="text/javascript" src="$(contextPath)/statics/layui.js"></script>
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
                    elem.find("td[data-field='specifications']").children().html(data.data.specifications);
                    elem.find("td[data-field='warehouseid']").children().html(data.data.warehouseid);
                    elem.find("td[data-field='warningnumber']").children().html(data.data.warningnumber);
                    elem.find("td[data-field='topwarning']").children().html(data.data.topwarning);
                    elem.find("td[data-field='uniprice']").children().html(data.data.uniprice);

                    $.each(tabledata, function (index, value) {
                        if (value.LAY_TABLE_INDEX == dataindex) {
                            value.goodName = data.data.goodName;
                            value.specifications = data.data.specifications;
                            value.warehouseid = data.data.warehouseid;
                            value.warningnumber = data.data.warningnumber;
                            value.topwarning = data.data.topwarning;
                            value.uniprice = data.data.uniprice;
                        }
                    });
                }
            });
        }
    var tableIns = table.render({
        elem: '#demo'
        , toolbar: '#toolbar Demo'
        , defaultToolbar: []
        , limit: 100
        , cols: [[
            {field: 'materialcode', tit1e: '物料编号', templet: '#selectTool'}
            , {field: 'materialname', tit1e: '物料名称', edit: 'text'}
            , {field: 'number', tit1e: '数量', edit: 'text'}
            , {field: 'specifications', tit1e: '规格', edit: 'text'}
            , {field: 'warehouseid', tit1e: '仓库', edit: 'text'}
            , {field: 'warningnumber', tit1e: '最低库存', edit: 'text'}
            , {field: 'topwarning', tit1e: '最高库存', edit: 'text'}
            , {field: 'uniprice', tit1e: '单价', edit: 'text'}
            , {field: 'subtotal', tit1e: '小计'}
            , {field: '操作', align: 'center', toolbar: '#bar'}
        ]]
        , data: [{
            "materialcode": ""
            , "materialname": ""
            , "number": ""
            , "sepecification": ""
            , "warningnumber": ""
            , "warehouseid": ""
            , "topwarning": ""
            , "uniprice": ""
            , "subtotal": ""
        }]

        , done: function (res, curr, count) {
            tabledata = res.data;
            $('.layui-form-select').find('input').unbind("blur");

            $('tr').each(function (e) {
                var $cr = s(this);
                var dataindex = $cr.attr("data-index");

                $.each(tabledata, function (index, value) {


                    if (value.LAY_TABLE_INDEX == dataindex) {
                        $cr.find('input').val(value.materialcode);
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
                        value.materialcode = selectdata;
                    }
                });
            });
            var numberelem = $('.layui-table-main').find("td[data-field='number']");
            var unitpriceelem = $('.layui-table-main').find("td[data-field='unitprice']");
            numberelem.on("input", function (e) {
                var $cr = $(e.target);
                var dataindex = $cr.parents('tr').attr("data-index");
                var unitprice = $cr.parents('tr').find("td[data-field='unitprice']").children().html();
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
                var number = $cr.parents('tr').find("td[data-field='number']").children().html();
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
            ;
        }
    )
    }
    ;
    table.on('toolbar(tableFilter)', function (obj) {
        if (obj.event === 'add') {
            tabledata.push({
                "materialcode": ""
                , "materialname": ""
                , "number": ""
                , "sepecification": ""
                , "warningnumber": ""
                , "warehouseid": ""
                , "topwarning": ""
                , "uniprice": ""
                , "subtotal": ""
            })
            table.reload('demo', {
                data: tabledata
            });
        }
        ;
    });
    form.on('submit(*)', function (data) {
        $.ajax({
            url: "S[contextPath)/storage/toSave
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
</body>
</html>




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
            "<td class='td_goodName'><select class='layui-form-select ' lay-verify='required' name='select_goodName' <option value=''>未选择</option>" + max_line_num + "'></select></td>" +
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
    <select name="goodName">
        <option value="">请选择</option>
        <c:forEach items="${GoodListResult.data}" var="item">
            <option>${item.goodName} </option>
        </c:forEach>
    </select>
</script>
<select name="interest" lay-filter="aihao" class="layui-form-select">
    <c:forEach items="${GoodListResult.data}" var="item">
        <option>${item.goodName}</option>
    </c:forEach>
</select>