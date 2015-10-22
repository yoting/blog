<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.contener_link
{
  text-align: left;
  position: relative;
  width: 110px;
  height: 40px;
  cursor: pointer;
  display: inline-block;
}
.contener_link .link_txt
{
  color: #2fa1d6;
  font-weight: bold;
  text-decoration: none;
  
  font-family:'Roboto';
  position: absolute;
  width: 110px;
/*   font-weight: 300; */
  text-decoration: none;
  font-size:22px;
  padding: 10px;
  color: #ffffff;
}
.contener_link:hover
{
  background-color: white;
  color: #2fa1d6;
  font-weight: bold;
  text-decoration: none;
  
  -webkit-animation-duration:1s;
  -webkit-animation-name: diaganim;
  -moz-animation-duration:1s;
  -moz-animation-name: diaganim;
  -ms-animation-duration:1s;
  -ms-animation-name: diaganim;
  animation-duration:1s;
  animation-name: diaganim;
}
@-webkit-keyframes diaganim 
{
  0% {-webkit-transform: skewX(-30deg);}
  100% {-webkit-transform: skewX(0deg);}
}
@-moz-keyframes diaganim 
{
  0% {-moz-transform: skewX(-30deg);}
  100% {-moz-transform: skewX(0deg);}
}
@-ms-keyframes diaganim 
{
  0% {-ms-transform: skewX(-30deg);}
  100% {-ms-transform: skewX(0deg);}
}
@keyframes diaganim 
{
  0% {transform: skewX(-30deg);}
  100% {transform: skewX(0deg);}
}
</style>
<body>
	<div align="left" style="background-color: #f391a9; padding: 5px;">
		<div class="contener_link">
			<div class="link_txt">
				<a href="${ctx }/user/getCurrentUserView?id=${user.id}">我的信息</a>
			</div>
		</div>
		<div class="contener_link">
			<div class="link_txt">
				<a href="${ctx }/baseInfo/listView?pageNo=1&pageSize=${pageSize}">通用配置</a>
			</div>
		</div>
		<div class="contener_link">
			<div class="link_txt">
				<a href="${ctx }/category/getCategory?pageNo=1&pageSize=-1">导航栏</a>
			</div>
		</div>
		<div class="contener_link">
			<div class="link_txt">
				<a href="${ctx }/article/listView?pageNo=1&pageSize=${pageSize }">文章管理</a>
			</div>
		</div>
		<div class="contener_link">
			<div class="link_txt">
				<a href="${ctx }/aphorism/listView?pageNo=1&pageSize=${pageSize }">格言管理</a>
			</div>
		</div>
		<div class="contener_link">
			<div class="link_txt">
				<a href="${ctx }/common/pictureMngView">文件管理</a>
			</div>
		</div>
		<div class="contener_link">
			<div class="link_txt">
				<a href="${ctx }/user/listView?pageNo=1&pageSize=${pageSize }">用户管理</a>
			</div>
		</div>
		<span style="float: right;"> <a
		href="${ctx }/category/categoryTreeView">zTree</a>&nbsp; <a
		href="${ctx }/category/categoryTableView">treeTable</a>
			<a href="${ctx }/">去前台</a>
		</span>
	</div>
</body>
</html>
