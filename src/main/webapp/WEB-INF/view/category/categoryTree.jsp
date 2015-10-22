<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>类别树</TITLE>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>
<SCRIPT type="text/javascript">
	var categoryId;
	var categoryName;
	function zTreeOnClick(event, treeId, treeNode) {
		categoryId = treeNode.id;
		categoryName = treeNode.name;
		// 		alert(categoryId);
		// 		alert(categoryName);
	}
	var setting = {
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onClick : zTreeOnClick
		},
		view:{
			showLine:false	
		}
	};

	$(document).ready(function() {
		$.ajax({
			type : "POST",
			data : {},
			url : "${ctx}/category/getCategoryTree?id=${id}",
			success : function(ret) {
				// 						for (var i = 0; i < ret.total; i++) {
				// 							alert(ret.rows[i].id + ":" + ret.rows[i].pId + ":"
				// 									+ ret.rows[i].name);
				// 						}
				var zNodes = ret.rows;
				$.fn.zTree.init($("#categoryTree"), setting, zNodes);
			}
		});
	});

	//在iframe中关闭自身
	var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
	function closeWin() {
		parent.layer.close(index); //执行关闭
	};
	function selectWin() {
		// 		if (categoryId == null) {
		// 			layer.msg("您还没有选择，请选择！", 2);
		// 			return;
		// 		}
		parent.$("#parentCategory\\.id").val(categoryId);
		parent.$("#category\\.id").val(categoryId);
		parent.$("#parentCategoryInfo").val(
				"[" + categoryId + "]" + categoryName);

		parent.layer.close(index); //执行关闭
	};
</SCRIPT>
<style type="text/css">
.center {
	width: auto;
	display: table;
	margin-left: auto;
	margin-right: auto;
	padding-top: 5px;
	padding-bottom: 5px;
}

html,body {
	height: 100%;
	margin: 0;
	padding: 0;
}

.content_wrap {
	min-height: 100%;
	height: auto !important;
	height: 100%;
	margin: 0 auto -45px; /*margin-bottom的负值等于footer高度*/
}

.push,#footer {
	height: 45px;
	clear: both;
}

#footer {
	background: gray;
}
</style>
</HEAD>
<BODY id="content">
	<div class="content_wrap">
		<div class="zTreeDemoBackground left">
			<ul id="categoryTree" class="ztree"></ul>
		</div>
	</div>
	<div class="push"></div>
	<div id="footer">
		<div class="center">
			<button type="button" class="btn btn-default" id="closedbtn"
				onclick="closeWin()">取消选择</button>
			<button type="button" class="btn btn-default" id="selectedbtn"
				onclick="selectWin()">就是他了</button>
		</div>
	</div>
</BODY>
<script type="text/javascript">
$(function(){
	var $xubox = parent.$(".xubox_main");
	var height = $xubox.innerHeight();
	var $xubox_title = parent.$(".xubox_title");
	var titleHeight = $xubox_title.outerHeight();
	$("#content").css('height',height-titleHeight*2-9);
});
</script>
</HTML>