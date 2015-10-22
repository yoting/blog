<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>文章管理</title>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>
<script type="text/javascript">
	function zTreeOnClick(event, treeId, treeNode) {
		var categoryId = treeNode.id;
		$.ajax({
			type : 'POST',
			data : {
				"pageNo" : 1,
				"pageSize" : 5,
				"categoryId" : categoryId
			},
			dataType : 'JSON',
			url : "${ctx}/article/getArticleList",
			success : function(ret) {
				$("#tbody").html("");
				var content = "";
				for (var i = 0; i < ret.length; i++) {
					content += "<tr>";
					content += "<td>" + ret[i].id + "</td>";
					content += "<td><img src='"+ret[i].image+"' width='50px' height='50px' alt=''></td>";
					content += "<td>" + ret[i].title + "</td>";
					content += "<td>" + ret[i].category.name + "</td>";
					content += "<td>" + ret[i].description + "</td>";
					content += "<td>" + ret[i].weight + "</td>";
					content += "<td style='width: 50px;'><a href='${ctx }/article/addOrUpdateView?id="
							+ ret[i].id + "'>更新</a></td>";
					content += "<td style='width: 50px;'><a href='${ctx }/article/deleteView?id="
							+ ret[i].id + "'>删除</a></td>";
					content += "</tr>";
				}
				$("tbody").html(content);
			}
		});
	}
	function getFont(treeId, node) {
		// 		alert(treeId);
		return node.font ? node.font : {};
	}
	var setting = {
		data : {
			simpleData : {
				enable : true
			}
		},
		view : {
			fontCss : getFont,
			nameIsHTML : true,
			showLine:false
		},
		callback : {
			onClick : zTreeOnClick
		}
	};

	$(document).ready(function() {
		$.ajax({
			type : "POST",
			data : {},
			url : "${ctx}/category/getCategoryTree",
			success : function(ret) {
				var zNodes = ret.rows;
				$.fn.zTree.init($("#categoryTree"), setting, zNodes);
				var treeObj = $.fn.zTree.getZTreeObj("categoryTree");
				treeObj.expandAll(true);
			}
		});
	});
</script>
<style type="text/css">
.table-hover>tbody>tr:hover {
	background-color: #ef5b9c;
}

#content {
	width: 1366px;
	height: auto;
}

#left {
	width: 250px;
	padding: 0px;
	float: left;
	/* 	background-color: #ff99cc; */
}

#right {
	width: 1116px;
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
		<li><a href="${ctx }/article/listView?pageNo=1&pageSize=${pageSize }">文章管理</a></li>
		<li><a href="#">查看文章</a>
	</ol>
	<div id="content">
		<div id="left">
			<div class="content_wrap">
				<div class="zTreeDemoBackground left">
					<ul id="categoryTree" class="ztree"></ul>
				</div>
			</div>
		</div>
		<div id="right">
			<jsp:include page="/WEB-INF/view/include/page.jsp"></jsp:include>
			<div>
				<table
					class="table table-bordered table-striped table-condensed table-hover">
					<thead>
						<tr>
							<th style="width: 50px;">编号</th>
							<th style="width: 50px;">图片</th>
							<th style="width: 100px;">文章标题</th>
							<th style="width: 100px">文章类别</th>
							<th style="width: 350px;">内容摘要</th>
							<th style="width: 50px;">权重</th>

							<th colspan="2" style="width: 150px;">操作<span
								style="display: inline-block; width: 40px;"></span><a
								href="${ctx }/article/addOrUpdateView">写文章</a></th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${pageInfo.objList }" var="article">
							<tr>
								<td>${article.id }</td>
								<td><img src="${article.image }" width="50px" height="50px" alt=""></td>
								<td>${article.title}</td>
								<td>${article.category.name}</td>
								<td>${article.description }</td>
								<td>${article.weight }</td>
								<td style="width: 50px;"><a
									href="${ctx }/article/addOrUpdateView?id=${article.id}">更新</a></td>
								<td style="width: 50px;"><a
									href="${ctx }/article/deleteArticle?id=${article.id}">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="clearfloat"></div>

</body>
</html>
