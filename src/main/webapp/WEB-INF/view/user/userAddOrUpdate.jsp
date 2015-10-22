<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人信息管理</title>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		initFileUpload("baseInfo", "photo", "photo");
		initResumeFileUpload("user", "resume");
	});
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
<body>
	<ol class="breadcrumb">
		<li><a href="${ctx }/article/listView?pageNo=1&pageSize=10">用户管理</a></li>
		<li><a href="#">修改个人基本信息</a>
	</ol>
	<div id="main">
		<form:form action="${ctx }/user/addOrUpdateUser" method="post"
			modelAttribute="user" class="form-horizontal" id="user">
			<form:hidden path="id" />
			<div id="left">
				<div class="form-group">
					<label for="name" class="col-sm-3 control-label">姓名:</label>
					<div class="col-sm-8">
						<form:input path="name" class="form-control" placeholder="请输入姓名" />
					</div>
				</div>
				<div class="form-group">
					<label for="nick" class="col-sm-3 control-label">昵称:</label>
					<div class="col-sm-8">
						<form:input path="nick" class="form-control" placeholder="请输入昵称" />
					</div>
				</div>
				<div class="form-group">
					<label for="job" class="col-sm-3 control-label">职业:</label>
					<div class="col-sm-8">
						<form:input path="job" class="form-control" placeholder="请输入职业" />
					</div>
				</div>
				<div class="form-group">
					<label for="addr" class="col-sm-3 control-label">地址:</label>
					<div class="col-sm-8">
						<form:input path="addr" class="form-control" placeholder="请输入现居地" />
					</div>
				</div>
				<div class="form-group">
					<label for="sign" class="col-sm-3 control-label">性别:</label>
					<div class="col-sm-8">
						<form:input path="sign" class="form-control" placeholder="请输入性别" />
					</div>
				</div>

				<div class="form-group">
					<label for="birthday" class="col-sm-3 control-label">生日：</label>
					<div class="col-sm-8">
						<span> <input id="birthday" name="birthday"
							value='<fmt:formatDate value="${user.birthday }"/>'
							class="laydate-icon"> <script type="text/javascript">
								laydate({
									elem : '#birthday',
									event : 'focus'
								});
							</script></span>
					</div>
				</div>
				<div class="form-group">
					<label for="isShow" class="col-sm-3 control-label">当前显示：</label>
					<div class="col-sm-offset-0 col-sm-9">
						<div class="checkbox">
							<label> <form:checkbox path="isShow" />是：当前网页展示该用户相关信息
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<form:hidden path="photo" />
					<script type="text/javascript">
						initFileUpload("baseInfo", "photo", "photo");
					</script>
					<label class="col-sm-3 control-label">头像：<br />
						<div id="filePicker">选择</div></label>
					<div id="uploader-demo" class="col-sm-8" style="margin-top: -10px;">
						<!--用来存放item -->
						<div id="fileList" class="uploader-list"
							style="height: 90px; border-radius: 4px;">
							<img alt="" src="${user.photo }" width="100px;" height="100px;"
								style="border-radius: 4px;">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">简历文件：</label>
					<div id="uploader" class="wu-example">
						<!-- 						用来存放文件信息 -->
						<span class="btns"> <span id="picker">选择文件</span>
						</span> <span id="thelist" class="uploader-list"></span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-1">
						<button type="submit" class="btn btn-primary  btn-md btn-block">确定发布</button>
					</div>
				</div>
			</div>
			<div id="right">
				<script type="text/plain" id="container" name="aboutme"
					style="height:390px;">${user.aboutme}</script>
				<script type="text/javascript"
					src="${ctxResource }/ueditor/ueditor.config.js"></script>
				<script type="text/javascript"
					src="${ctxResource }/ueditor/ueditor.all.js"></script>
				<script type="text/javascript">
					var ue = UE.getEditor("container", {});
					ue.ready(function() {
						// 						ue.setContent("${user.aboutme}");
					});
				</script>
			</div>
		</form:form>
	</div>
</body>
</html>
