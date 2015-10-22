<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>正能量管理</title>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>
<style type="text/css">
.table-hover>tbody>tr:hover {
	background-color: #ef5b9c;
}
</style>
</head>
<body>
	<ol class="breadcrumb">
		<li><a
			href="${ctx }/aphorism/listView?pageNo=1&pageSize=${pageSize }">正能量管理</a></li>
		<li><a href="#">查看正能量</a>
	</ol>

	<jsp:include page="/WEB-INF/view/include/page.jsp"></jsp:include>

	<div>
		<table id="aphorism_table"
			class="table table-bordered table-striped table-condensed table-hover">
			<tr>
				<th style="width: 30px">ID</th>
				<th style="width: 200px">图片</th>
				<th>谁说的</th>
				<th>内容</th>
				<th>状态</th>
				<th colspan="2" style="width: 150px;">操作<span
					style="display: inline-block; width: 40px;"></span><a
					href="${ctx}/aphorism/addOrUpdateView">新增</a></th>
			</tr>

			<tbody>
				<c:forEach items="${pageInfo.objList }" var="aphorism">
					<tr>
						<td>${aphorism.id }</td>
						<td><c:choose>
								<c:when test="${aphorism.image eq null}">
									<c:set var="aphorismPic" value="${defaultPicture }"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="aphorismPic" value="${aphorism.image }"></c:set>
								</c:otherwise>
							</c:choose> <img src="${aphorismPic }" alt=""
							style="width: 50px; height: 50px;"></td>
						<td>${aphorism.fromPeople }</td>
						<td>${aphorism.content }</td>
						<td>${aphorism.state }</td>
						<td style="width: 50px;"><a
							href="${ctx }/aphorism/addOrUpdateView?id=${aphorism.id}">更新</a></td>
						<td style="width: 50px;"><a
							href="${ctx }/aphorism/deleteAphorism?id=${aphorism.id}">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
