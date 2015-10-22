<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>文章管理</title>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {
		initFileUpload("picture");
	});
</script>
</head>
<body>
	<label class="col-sm-3 control-label">网站所有默认图片：<div id="filePicker">去选择</div></label>
	<div id="uploader-demo">
		<!--用来存放item -->
		<div id="fileList" class="uploader-list"
			style="height: 100px; background-color: gray; border-radius: 4px;"></div>
	</div>
	<label class="col-sm-3 control-label">首页推荐文章图片：<div id="filePicker2">去选择</div></label>
	<div id="uploader-demo">
		<!--用来存放item -->
		<div id="fileList" class="uploader-list"
			style="height: 100px; background-color: gray; border-radius: 4px;"></div>
	</div>
	<label class="col-sm-3 control-label">爱运动爱生活图片：<div id="filePicker3">去选择</div></label>
	<div id="uploader-demo">
		<!--用来存放item -->
		<div id="fileList" class="uploader-list"
			style="height: 100px; background-color: gray; border-radius: 4px;"></div>
	</div>
</body>
</html>
