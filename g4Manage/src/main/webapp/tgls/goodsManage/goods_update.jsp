<%--
  Created by IntelliJ IDEA.
  User: Richard Lyu
  Date: 2020/3/26
  Time: 19:51
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

<body>
<div class="cBody">
	<form id="updateGoods" class="layui-form" enctype="multipart/form-data">
		<input type="hidden" name="gID" id="gID">
		<div class="layui-form-item">
			<label class="layui-form-label">商品名</label>
			<div class="layui-input-inline shortInput">
				<input type="text" name="gName" id="gName"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品数量</label>
			<div class="layui-input-inline shortInput">
				<input type="text" name="gNum" id="gNum"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
		<label class="layui-form-label">入货价</label>
		<div class="layui-input-inline shortInput">
			<input type="text" name="gInprice" id="gInprice"
				   autocomplete="off" class="layui-input">
		</div>
	</div>
		<div class="layui-form-item">
			<label class="layui-form-label">出货价</label>
			<div class="layui-input-inline shortInput">
				<input type="text" name="gOutprice" id="gOutprice"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品说明</label>
			<div class="layui-input-inline shortInput">
                <textarea type="text" name="gExplain" id="gExplain"
						  autocomplete="off" class="layui-textarea">
                </textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">存放仓库</label>
			<div class="layui-input-inline shortInput">
				<input type="text" name="sID" id="sID"
					   autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品状态</label>
			<div class="layui-input-inline shortInput">
				<select name="gStatus" id="gStatus">
					<option value="0">
						正常
					</option>
					<option value="1">
						缺货
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
				console.log($('#updateGoods').serialize());
				$.ajax({
					url: "/updateUser",//商品表更新数据接口
					dataType: "json",
					type: "POST",
					data: $('#updateGoods').serialize(),
					success: function (data) {
						if (data.status == 200) {
							alert("更改成功");
							window.location.reload();
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
			checkLogin(${sessionScope.result.data.gID});
			//请求该id的用户数据
			$.ajax({
				url: "/selUserById",//商品表更新数据接口
				dataType: "json",
				type: "POST",
				data: {gID:"${requestScope.gID}"},
				success: function (data) {
					if (data.status == 200) {
						$("#gID").val(data.data.gID);
						$("#gName").val(data.data.gName);
						$("#gNum").val(data.data.gNum);
						$("#gInprice").val(data.data.gInprice);
						$("#gOutprice").val(data.data.gOutprice);
						$("#gExplain").val(data.data.gExplain);
						$("#sID").val(data.data.sID);
						$("#gStatus").val(data.data.gStatus);
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
