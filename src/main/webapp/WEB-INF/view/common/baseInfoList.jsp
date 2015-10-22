<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>通用基本信息管理</title>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
// 		$("#type").val(formatType(type))
		
	});
	
	function addOrUpdate(id){
		if( id==null){
			id=-1;
		}
		
		$.layer({
			type : 1,
			shade : [ 0 ],
			fix : false,
			title : '通用信息管理',
			maxmin : true,
			page:{
				url:'${ctx}/baseInfo/addOrUpdateView?id='+id,
				ok:function(datas){}
			},
// 			iframe : {
// 				src : '${ctx}/baseInfo/addOrUpdateView?id='+id,
// 				scrolling:'no'
// 			},
			area : [ '500px', '400px' ],
// 			btns:2,
// 			btn:['确定','取消'],
			
			
// 			yes:function(index){
// 				layer.alert(index,5,"title");
// 				layer.close(index);
// 			},
// 			no:function(index){
// 				alert(index);
// 				layer.close(index);
// 			}
		});
	}
	
	function formatType(type){
		if(type==1){
			return "字符串";
		}else if(type==2){
			return "数字";
		}else if(type==3){
			return "布尔";
		}else if(type==4){
			return "图片";
		}
	}
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
		<li><a
			href="${ctx }/article/listView?pageNo=1&pageSize=${pageSize }">通用信息</a></li>
		<li><a href="#">管理通用信息</a>
	</ol>
	<div>
		<jsp:include page="/WEB-INF/view/include/page.jsp"></jsp:include>
	</div>
	<div>
		<table id="baseInfo_table"
			class="table table-bordered table-striped table-condensed table-hover">
			<tr>
				<th style="width: 30px;">ID</th>
				<th style="width: 200px;">名称</th>
				<th>KEY（键）</th>
				<th>VALUE（值）</th>
				<th>数据类型</th>
				<th colspan="2" style="width: 150px;">操作<span
					style="display: inline-block; width: 40px;"></span><a href="#"
					onclick="addOrUpdate()">新增</a></th>
			</tr>
			<tbody>

				<c:forEach items="${pageInfo.objList }" var="info">
					<tr>
						<td>${info.id }</td>
						<td>${info.name }</td>
						<td>${info.k }</td>
						<td>${info.v }</td>
						<td>${info.blank }</td>

						<td><a href="#" onclick="addOrUpdate(${info.id})">修改</a></td>
						<td><a href="${ctx}/baseInfo/deleteBaseInfo?id=${info.id}">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


	<div class="clearfloat"></div>

</body>
</html>
