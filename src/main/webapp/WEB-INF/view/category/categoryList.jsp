<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>类别展示</title>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#category_table").treetable({
			expandable : true,
			column : 1,
			initialState:'expanded'
		});
	});
</script>
<style type="text/css">
.table-hover>tbody>tr:hover {
	background-color: #ef5b9c;
}
</style>
</head>
<body>
	<ol class="breadcrumb" >
		<li><a href="${ctx }/category/getCategory?pageNo=1&pageSize=-1">文章类别管理</a></li>
		<li><a href="#">查看文章类别</a>
	</ol>

	
	<div>
		<table id="category_table"
			class="table table-bordered table-striped table-condensed table-hover">
			<tr>
				<th style="width: 30px;">ID</th>
				<th style="width: 200px;">名称</th>
				<th>描述</th>
				<th>父类别</th>
				<th>状态</th>
				<th>备注</th>
				<th colspan="2" style="width: 150px;">操作<span
					style="display: inline-block; width: 40px;"></span><a
					href="${ctx}/category/addView">新增</a></th>

			</tr>
			<tbody>
				<c:forEach items="${pageInfo.objList }" var="category">
					<tr data-tt-id=${category.id }
						data-tt-parent-id=${category.parentCategory.id }>
						<td>${category.id }</td>
						<td>${category.name }</td>
						<td>${category.description }</td>
						<td>${category.parentCategory.name}</td>
						<td>${category.state }</td>
						<td>${category.remark }</td>
						<td style="width: 50px;"><a
							href="${ctx }/category/updateView?id=${category.id}">更新</a></td>
						<td style="width: 50px;"><a
							href="${ctx }/category/deleteCategory?id=${category.id}">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
