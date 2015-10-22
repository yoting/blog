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
		initFileUpload("aphorism", null, "image");
	});

	function submitAphorism() {
		var ue = UE.getEditor("container");
		var onlyText = ue.getContentTxt();
		$("#container").val(onlyText);
		return $("#aphorismForm").submit();
	}
</script>
<style type="text/css">
#main {
	width: 1366px;
}

#left {
	width: 400px;
	padding: 0px;
	float: left;
	background-color: #ff99cc;
}

#right {
	width: 966px;
	padding: 0px;
	float: left;
	/* 	margin-left: 400px; */
	overflow: auto;
}

.clearfloat {
	clear: both;
}
</style>
</head>
<body>
	<ol class="breadcrumb">
		<li><a href="${ctx }/article/listView?pageNo=1&pageSize=10">文章管理</a></li>
		<c:choose>
			<c:when test="${aphorism.id eq null }">
				<li><a href="#">新建格言</a>
			</c:when>
			<c:otherwise>
				<li><a href="#">编辑格言</a>
			</c:otherwise>
		</c:choose>
	</ol>
	<div id="main">
		<form:form action="${ctx }/aphorism/addOrUpdateAphorism" method="post"
			modelAttribute="aphorism" class="form-horizontal" id="aphorismForm"
			onsubmit="submitAphorism();">
			<div id="left">
				<form:hidden path="id" />

				<div class="form-group">
					<label for="title" class="col-sm-3 control-label">谁说的：</label>
					<div class="col-sm-8">
						<form:input path="fromPeople" class="form-control"
							placeholder="请输入名人" />
					</div>
				</div>

				<div class="form-group">
					<form:hidden path="image" />
					<script type="text/javascript">
						initFileUpload("aphorism", null, "image");
					</script>
					<label class="col-sm-3 control-label">图像：<br />
						<div id="filePicker">选择</div></label>
					<div id="uploader-demo" class="col-sm-8" style="margin-top: -10px;">
						<!--用来存放item -->
						<div id="fileList" class="uploader-list"
							style="height: 100px; background-color: white; border-radius: 4px;">
							<img alt="" src="${aphorism.image }" width="100px;"
								height="100px;" style="border-radius: 4px;">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-1">
						<button type="submit" class="btn btn-primary  btn-md btn-block">确定发布</button>
					</div>
				</div>
			</div>
			<div id="right">
				<script type="text/plain" id="container" name="content"
					style="height:100px;">${aphorism.content }</script>
				<script type="text/javascript"
					src="${ctxResource }/ueditor/ueditor.config.js"></script>
				<script type="text/javascript"
					src="${ctxResource }/ueditor/ueditor.all.js"></script>
				<script type="text/javascript">
					var ue = UE.getEditor("container", {});
					ue.ready(function() {
					});
				</script>
			</div>
		</form:form>
	</div>
	<div class="clearfloat"></div>
</body>
</html>
