<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/16
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">

	<!-- 公共样式 开始 -->
	<link rel="stylesheet" type="text/css" href="/css/base.css">
	<link rel="stylesheet" type="text/css" href="/css/iconfont.css">
	<script type="text/javascript" src="/framework/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/layui/css/layui.css">
	<script type="text/javascript" src="/layui/layui.js"></script>
	<script src="/js/checkLogin.js"></script>
	<!-- 公共样式 结束 -->

</head>

<body class="cBody">
<div>
	<form id="updateSave" class="layui-form" enctype="multipart/form-data">
		<input type="hidden" name="sID" id="sID">
		<div class="layui-form-item">
			<label class="layui-form-label">仓库名字</label>
			<div class="layui-input-inline shortInput">
				<input type="text" name="sName" id="sName" required lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">仓库存量上限</label>
			<div class="layui-input-inline shortInput">
                <input type="text" name="sTsave" id="sTsave" required lay-verify="required|number"
						  autocomplete="off" class="layui-input">

			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">仓库地址</label>
			<div class="layui-input-inline shortInput">
				<input type="text" name="sAddr" id="sAddr" required lay-verify="required"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">仓库说明</label>
			<div class="layui-input-inline shortInput">
                <textarea type="text" name="sExplain" id="sExplain"
						  autocomplete="off" class="layui-textarea">
                </textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">仓库状态</label>
			<div class="layui-input-inline shortInput">
				<select name="sStatus" id="sStatus">
					<option value="0">正常
					</option>
					<option value="1">禁用
					</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="submitBut">确认修改</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

	<script>
		layui.use('form', function () {
			var form = layui.form;
			//监听提交
			form.on('submit(submitBut)', function (data) {
				$.ajax({
					url: "/editSave", //仓库表更新数据接口
					dataType: "json",
					type: "POST",
					data: $('#updateSave').serialize(),
					success: function (data) {
						if (data.status == 200) {
							layer.msg("更改成功");
							window.setTimeout('parent.layer.closeAll()',500 );
						} else {
							layer.msg("更改失败");
						}

					}
				});
				return false;
			});
		});
	</script>

	<script type="application/javascript">
		$(function () {
			//检查是否拥有标识
			checkLogin(${sessionScope.result.data.uID});
			//请求该id的用户数据
			$.ajax({
				url: "/getSaveById", //仓库表更新数据接口
				dataType: "json",
				type: "POST",
				data: {sID:"${requestScope.sID}"},
				success: function (data) {
					if (data.status == 200) {
						$("#sID").val(data.data.sID);
						$("#sName").val(data.data.sName);
						$("#sNsave").val(data.data.sNsave);
						$("#sTsave").val(data.data.sTsave);
						$("#sAddr").val(data.data.sAddr);
						$("#sExplain").val(data.data.sExplain);
						$("#sStatus").val(data.data.sStatus);
					} else {
						layer.msg("获取失败");
					}

				}
			});

		})
	</script>


</div>
</body>

</html>
