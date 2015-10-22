<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新建类别</title>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>
<script type="text/javascript">
	function selectParent() {
		$.layer({
			type : 2,
			shade : [ 0 ],
			fix : false,
			title : '选择父类别',
			maxmin : true,
			iframe : {
				src : '${ctx}/category/categoryTreeView'
			},
			area : [ '300px', '500px' ],

		});
	}
</script>
</head>
<body>

	<ol class="breadcrumb">
		<li><a href="${ctx }/category/getCategory?pageNo=1&pageSize=-1">文章类别管理</a></li>
		<li><a href="#">新建文章类别</a>
	</ol>

	<div>
		<form:form action="${ctx }/category/createCategory" method="post"
			modelAttribute="category" class="form-horizontal">

			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">类别名称：</label>
				<div class="col-sm-5">
					<form:input path="name" class="form-control" placeholder="请输入类别名称" />
				</div>
			</div>

			<div class="form-group">
				<label for="parentCategoryInfo" class="col-sm-3 control-label">父类别：</label>
				<div class="col-sm-5">
					<form:hidden path="parentCategory.id" />
					<div class="input-group">
						<input type="text" id="parentCategoryInfo" value=""
							disabled="disabled" class="form-control" placeholder="请输选择">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button"
								onclick="selectParent()">选择</button>
						</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-3 control-label">类别描述：</label>
				<div class="col-sm-5">
					<form:textarea path="description" class="form-control"
						placeholder="请输入类别描述" />
				</div>
			</div>
			<div class="form-group">
				<label for="target" class="col-sm-3 control-label">显示目标：</label>
				<div class="col-sm-5">
					<form:select path="target" class="form-control">
						<option value="_self">当前页面打开</option>
						<option value="_blank">新建标签页打开</option>
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<label for="enableComment1" class="col-sm-3 control-label">是否允许评论：</label>
				<div class="col-sm-offset-0 col-sm-5">
					<div class="checkbox">
						<label> <form:checkbox path="enableComment" />允许
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="state" class="col-sm-3 control-label">显示状态：</label>
				<div class="col-sm-5">
					<form:select path="state" class="form-control">
						<option value="0">正常</option>
						<option value="-1">隐藏</option>
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-5">
					<button type="submit" class="btn btn-default">确定</button>
				</div>
			</div>
		</form:form>

	</div>
</body>
</html>
