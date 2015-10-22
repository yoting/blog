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
		initFileUpload("article", null, "image");
	});

	function selectCategory() {
		$.layer({
			type : 2,
			shade : [ 0 ],
			fix : false,
			title : '选择文章所属类别',
			maxmin : false,
			iframe : {
				src : '${ctx}/category/categoryTreeView'
			},
			area : [ '300px', '500px' ],
		});
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
			<c:when test="${article.id eq null }">
				<li><a href="#">新建文章</a>
			</c:when>
			<c:otherwise>
				<li><a href="#">编辑文章</a>
			</c:otherwise>
		</c:choose>
	</ol>
	<div id="main">
		<form:form action="${ctx }/article/addOrUpdateArticle" method="post"
			modelAttribute="article" class="form-horizontal" id="article">
			<div id="left">
				<form:hidden path="id" />
				<div class="form-group">
					<label for="parentCategoryInfo" class="col-sm-3 control-label">类别：</label>
					<div class="col-sm-8">
						<div class="input-group">
							<form:hidden path="category.id" />
							<input type="text" id="parentCategoryInfo" value=""
								disabled="disabled" class="form-control" placeholder="请输选择">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button"
									onclick="selectCategory()">选择</button>
							</span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-3 control-label">标题：</label>
					<div class="col-sm-8">
						<form:input path="title" class="form-control"
							placeholder="请输入文章标题" />
					</div>
				</div>
				<div class="form-group">
					<label for="keywords" class="col-sm-3 control-label">关键字：</label>
					<div class="col-sm-8">
						<form:input path="keywords" class="form-control"
							placeholder="请输入关键字，用逗号分隔" />
					</div>
				</div>
				<div class="form-group">
					<label for="weight" class="col-sm-3 control-label">权重：</label>
					<div class="col-sm-2">
						<form:input path="weight" class="form-control inline" />
					</div>
					<span class="input-group-btn">
						<button class="btn btn-default" type="button"
							onclick="setWeight(1)">1</button>
						<button class="btn btn-default" type="button"
							onclick="setWeight(2)">2</button>
						<button class="btn btn-default" type="button"
							onclick="setWeight(3)">3</button>
						<button class="btn btn-default" type="button"
							onclick="setWeight(4)">4</button>
						<button class="btn btn-default" type="button"
							onclick="setWeight(5)">5</button>
						<button class="btn btn-default" type="button"
							onclick="setWeight(6)">6</button>
					</span>
					<script type="text/javascript">
						function setWeight(weight) {
							$("#weight").val(weight);
						}
					</script>
				</div>
				<div class="form-group">
					<label for="weightInvalidate" class="col-sm-5 control-label">权重失效时间：</label>
					<div class="col-sm-2">
						<span style="float: left"> <input id="weightInvalidate"
							name="weightInvalidate" class="laydate-icon"> <script
								type="text/javascript">
								laydate({
									elem : '#weightInvalidate',
									event : 'focus'
								});
							</script>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label for="createDate" class="col-sm-5 control-label">强改创建日期：</label>
					<div class="col-sm-2">
						<span> <input id="createDate" name="article.createDate"
							class="laydate-icon"> <script type="text/javascript">
								laydate({
									elem : '#createDate',
									event : 'focus'
								});
							</script></span>
					</div>
				</div>
				<div class="form-group">
					<label for="updateDate" class="col-sm-5 control-label">强改修改日期：</label>
					<div class="col-sm-2">
						<span> <input id="updateDate" name="article.updateDate"
							class="laydate-icon"> <script type="text/javascript">
								laydate({
									elem : '#updateDate',
									event : 'focus'
								});
							</script></span>
					</div>
				</div>
				<div class="form-group">
					<form:hidden path="image" />
					<script type="text/javascript">
						initFileUpload("article", null, "image");
					</script>
					<label class="col-sm-3 control-label">图像：<br />
						<div id="filePicker">选择</div></label>
					<div id="uploader-demo" class="col-sm-8" style="margin-top: -10px;">
						<!--用来存放item -->
						<div id="fileList" class="uploader-list"
							style="height: 100px; background-color: white; border-radius: 4px;">
							<img alt="" src="${article.image }" width="100px;"
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
					style="height:385px;">${article.content }</script>
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
