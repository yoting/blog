<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<%@ include file="/WEB-INF/view/include/headerLib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<div>
		<%@ include file="/WEB-INF/view/include/page.jsp" %>
	</div>
	<div>
		<table border="1px">
			<tr>
				<td>ID</td>
				<td>USERNAME</td>
				<td>PASSWORD</td>
				<td colspan="2">OPERATION</td>
			</tr>
			<c:forEach items="${pageInfo.objList }" var="user">
				<tr>
					<td>${user.id }</td>
					<td>${user.userName }</td>
					<td>${user.password }</td>
					<td><a
						href="${ctx }/user/addOrUpdateView?id=${user.id}">更新</a></td>
					<td><a
						href="${ctx }/user/deleteUser?id=${user.id}">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>
