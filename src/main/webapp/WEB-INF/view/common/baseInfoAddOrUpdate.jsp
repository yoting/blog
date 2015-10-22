<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>通用信息管理</title>
<%@ include file="/WEB-INF/view/include/headerLib.jsp"%>

<script type="text/javascript">
	var type;
	$(document).ready(function() {

		$("#type1").css("display", "none");
		$("#type2").css("display", "none");
		$("#type3").css("display", "none");
		$("#type4").css("display", "none");
		var typeIsNull = "${baseInfo.type==null}";
		if (typeIsNull == 'true') {
			$("#type1").css("display", "block");
			type = 1;
		} else {
			type = "${baseInfo.type}";
			$("#type" + type).css("display", "block");
		}

		$("#showValue").css("display", "block");
		if (typeIsNull == 'true' || type == 1) {//如果没有type或者type是字符串
			$("#showValue").css("display", "none");
		} else if (type == 2) {
			$("#v").attr("readonly", false);
		} else {
		}
	});

	function closeWin() {
		var ue = UE.getEditor("container");
		var text = ue.getContent();
		var onlyText = ue.getContentTxt();
		var isText = $("#onlyText").is(':checked');
		if (type == 1)
			if (isText)//只保留文字
				$("#v").val(onlyText);
			else
				//保留HTML内容标签
				$("#v").val(text);
		return $("#baseInfoForm").submit();
		//在iframe中关闭自身
		var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引
		parent.layer.close(index); //执行关闭
	}

	//给V设置value
	function setValue(value) {
		$("#v").val(value);
	}
	function setBoolean() {
		var v = $("#checkbox").is(':checked');
		$("#v").val(v);
	}
</script>

</head>
<body>
	<div style="width: 500px;">
		<form:form action="${ctx }/baseInfo/addOrUpdateBaseInfo" method="post"
			modelAttribute="baseInfo" class="form-horizontal" id="baseInfoForm"
			onsubmit="closeWin();">
			<form:hidden path="id" />
			<div class="form-group">
				<label for="name" class="col-sm-3 control-label">名称：</label>
				<div class="col-sm-8">
					<form:input path="name" class="form-control"
						placeholder="请输入名称（中文）" />
				</div>
			</div>
			<div class="form-group">
				<label for="k" class="col-sm-3 control-label">KEY：</label>
				<div class="col-sm-8">
					<form:input path="k" class="form-control" placeholder="请输入KEY（英文）" />
				</div>
			</div>
			<div class="form-group">
				<label for="type" class="col-sm-3 control-label">类型：</label>
				<div class="col-sm-8">
					<form:select path="type" class="form-control"
						onchange="changeType()">
						<form:option value="1">字符串</form:option>
						<form:option value="2">数字</form:option>
						<form:option value="3">布尔</form:option>
						<form:option value="4">图片</form:option>
					</form:select>
					<script type="text/javascript">
						function changeType() {
							var type = $("#type").val();
							$("#type1").css("display", "none");
							$("#type2").css("display", "none");
							$("#type3").css("display", "none");
							$("#type4").css("display", "none");
							if (type == 1) {
								$("#showValue").css("display", "none")
							} else {
								$("#showValue").css("display", "block");
							}
							$("#type" + type).css("display", "block");
						}
					</script>
				</div>
			</div>

			<div class="form-group">
				<label for="v" class="col-sm-3 control-label">VALUE：</label>
				<div class="col-sm-8">
					<div id="showValue" style="display: block;">
						<form:input path="v" class="form-control" readonly="true"
							placeholder="请通过下面操作" />
					</div>
					<div id="type1" style="display: none;">
						<div>
							<script type="text/plain" id="container" name="vString"
								style="height:70px;">${baseInfo.v }</script>
							<script type="text/javascript"
								src="${ctxResource }/ueditor/ueditor.config.js"></script>
							<script type="text/javascript"
								src="${ctxResource }/ueditor/ueditor.all.js"></script>
							<script type="text/javascript">
								var ue = UE.getEditor("container", {
									toolbars : [ [ 'undo', 'redo' ] ]
								});
								ue.ready(function() {
									setValue("");
								});
							</script>
						</div>
						<input type="checkbox" name="onlyText" id="onlyText" value="只保留文字"><label
							for="onlyText">只保留文字内容（不含HTML标签）</label>
					</div>
					<div id="type2" style="display: none;">
						<div class="btn-group">
							<button class="btn btn-default" type="button"
								onclick="setValue(1)">1</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(2)">2</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(3)">3</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(4)">4</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(5)">5</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(6)">6</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(7)">7</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(8)">8</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(9)">9</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(10)">10</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(11)">11</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(12)">12</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(13)">13</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(14)">14</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(15)">15</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(16)">16</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(17)">17</button>
							<button class="btn btn-default" type="button"
								onclick="setValue(18)">18</button>
						</div>

					</div>
					<div id="type3" style="display: none;">
						<span>选择： <input type="checkbox" name="isSelected"
							id="checkbox" onchange="setBoolean();"><label
							for="checkbox"> 是 </label>
						</span>
					</div>
					<div id="type4" style="display: none;">
						<script type="text/javascript">
							initFileUpload("baseInfo", "${baseInfo.k}", "v");
						</script>
						<div id="filePicker">选择</div>
						<div id="uploader-demo" class="col-sm-8"
							style="margin-top: -40px; margin-left: 50px;">
							<!--用来存放item -->
							<div id="fileList" class="uploader-list"
								style="height: 100px; border-radius: 4px;">
								<img alt="" src="${baseInfo.v }" width="100px;" height="100px;"
									style="border-radius: 4px;">
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="form-group"
				style="width: 100%; margin: 0px; padding: 0px; margin-top: 20px;">
				<div class="col-sm-10 col-sm-offset-1">
					<button type="submit" class="btn btn-primary  btn-md btn-block">确定提交</button>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>
