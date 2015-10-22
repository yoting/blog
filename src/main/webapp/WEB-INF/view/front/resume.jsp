<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人简历</title>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>
<link href="${ctxResource }/index/css/index.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div class="resume">
		<%@ include file="/resource/upload/user/resume.html"%>
	</div>
</body>
</html>
