<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/9
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">


    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="/css/base.css">
    <link rel="stylesheet" type="text/css" href="/css/iconfont.css">
    <script type="text/javascript" src="/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/js/layui-v2.5.6/layui/css/layui.css">
    <%--引入layUI--%>
    <script type="text/javascript" src="/js/layui-v2.5.6/layui/layui.js"></script>
    <!-- 公共样式 结束 -->

    <style>
        .layui-form {
            margin-right: 30%;
        }
    </style>
</head>
<body>
<div class="cBody">
    <form id="addInOrder" action="">
        <div class="layui-row">
            <label class="layui-form-label" style="text-align: center ; ">表单操作</label>
            <div style="display: inline-block;font-size: xx-large">
                <button class="layui-btn layui-btn-xs" onclick="newBut()">新增一行</button>
                <button class="layui-btn layui-btn-xs" onclick="addBut()">提交表单</button>
            </div>
            <table class="layui-table printTable " id=""
                   data-options="toolbar:funListToolbar,url:'数据库商品表',fitColumns:true,singleSelect:true,pagination:true,collapsible:true, showFooter:false">
                <tbody>
                <tr>
                    <td class="printName" colspan="7">入库单</td>
                </tr>
                <tr>
                    <td class="printDis" colspan="7">
                        <span>单据日期：<div class="layui-input-inline">
                            <input type="text" name="ILDate" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div></span>
                        <span class="right">单据编号:
                            <div class="layui-input-inline">
                            <input type="text" name="ILID" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div></span>
                        <span>入库类型：采购入库</span>
                    </td>
                </tr>
                <tr>
                    <th width="8%" class="textCenter">入库信息
                    </th>
                    <th width="10%" class="textCenter">入库库号
                        <div class="layui-input-inline">
                            <input type="text" name="sID" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                    <th width="10%" class="textCenter">经手人
                        <div class="layui-input-inline">
                            <input type="text" name="ILBy" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                    <th width="10%" class="textCenter">确认人
                        <div class="layui-input-inline">
                            <input type="text" name="ILComfirm" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                    <th width="10%" class="textCenter">供货商
                        <div class="layui-input-inline">
                            <input type="text" name="ILFrom" required lay-verify="required"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                    </th>
                </tr>
                <tr>
                    <th width="8%" class="textCenter" data-options="field:gID">货物号</th>
                    <th width="10%" class="textCenter">商品名称</th>
                    <th width="10%" class="textCenter">入库数量</th>
                    <th width="10%" class="textCenter">入库单价</th>
                    <th width="10%" class="textCenter">入库总金额</th>
                </tr>
                <tr>
                    <th>
                        <select name="gID" id="gID">
                            <option value="0">
                            </option>
                            <option value="1">
                                超级管理员
                            </option>
                            <option value="2">
                                仓管员
                            </option>
                            <option value="3">
                                运输员
                            </option>
                        </select><span id="roleSpan"></span>
                    </th>
                    <th>
                        //返回商品名称
                    </th>
                    <th><input class="layui-input" type="text" name="ILNum" required lay-verify="required"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILprice" required lay-verify="required"
                               autocomplete="off" width="auto"></th>
                    <th><input class="layui-input" type="text" name="ILTotal" required lay-verify="required"
                               autocomplete="off" width="auto"></th>
                </tr>
                </tbody>
            </table>
        </div>
    </form>
</div>
<script>
function newBut() {
    var updateFrame = null;
        layui.use('layer', function() {
            var layer = layui.layer;

            //iframe层-父子操作
            updateFrame = layer.open({
                title: "商品信息修改",
                type: 2,
                area: ['70%', '60%'],
                scrollbar: false,	//默认：true,默认允许浏览器滚动，如果设定scrollbar: false，则屏蔽
                maxmin: true,
                content: 'goods_update.html'
            });
        });

    }

}
    function addBut(){
        layui.use('form', function() {
            //监听提交
            var form = layui.form;
            $.ajax({
                url: "/updateUser", //添加入货单
                type: "POST",
                dataType: "json",
                data: $('#addInOrder').serialize(),
                success: function (data) {
                    if (data.status == 200) {
                        //接收到成功的提示
                        alert("添加成功");
                        location.reload();
                    } else {
                        alert(data.msg);
                    }
                }

            });
            return false;
        })

    }

</script>
</body>
</html>
