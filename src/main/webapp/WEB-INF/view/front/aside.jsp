<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tagLib.jsp"%>
<aside class="navsidebar">
	<c:if test="${showWeather eq 'true' }">
		<iframe
			style="background-color: rgba(254, 254, 254, 0.8); margin-top: 40px;"
			allowtransparency="true" frameborder="0" width="276" height="97"
			scrolling="no"
			src="http://tianqi.2345.com/plugin/widget/index.htm?s=2&z=3&t=0&v=0&d=1&bd=0&k=000000&f=000000&q=1&e=1&a=1&c=54511&w=276&h=150&align=center"></iframe>
	</c:if>
	<c:if test="${showWeibo eq 'true' }">
		<iframe id="sina_widget_2776876820"
			style="width: 276px; height: 500px;" frameborder="0" scrolling="no"
			src="http://v.t.sina.com.cn/widget/widget_blog.php?uid=2776876820&width=276&height=500&skin=wd_02&showpic=1"></iframe>
	</c:if>
	<c:if test="${showNav eq 'true' }">
		<nav>
			<ul>
				<li class="ab"><a href="#">关于我</a></li>
				<li class="sy"><a href="#">碎言碎语</a></li>
				<li class="js"><a href="#">技术探讨</a></li>
				<li class="msh"><a href="#">慢生活</a></li>
				<li class="xc"><a href="#">我的相册</a></li>
				<li class="ly"><a href="#">留言版</a></li>
			</ul>
		</nav>
	</c:if>
	<c:if test="${showImage eq 'true'}">
		<div class="slide">
			<!-- 代码 开始 
			<script language='javascript'>
				linkarr = new Array();
				picarr = new Array();
				textarr = new Array();
				var swf_width = 276;
				var swf_height = 200;
				//文字颜色|文字位置|文字背景颜色|文字背景透明度|按键文字颜色|按键默认颜色|按键当前颜色|自动播放时间|图片过渡效果|是否显示按钮|打开方式
				var configtg = '0xffffff|0|0x3FA61F|5|0xffffff|0xC5DDBC|0x000033|2|3|1|_blank';
				var files = "";
				var links = "";
				var texts = "";
				//这里设置调用标记
				linkarr[1] = "http://www.yangqq.com";
				picarr[1] = "${ctxResource}/index/images/01.jpg";
				textarr[1] = "Goodbye Summer 个人相册";
				linkarr[2] = "http://www.yangqq.com";
				picarr[2] = "${ctxResource}/index/images/02.jpg";
				textarr[2] = " Goodbye Summer 个人相册";
				linkarr[3] = "http://www.yangqq.com";
				picarr[3] = "${ctxResource}/index/images/03.jpg";
				textarr[3] = "Goodbye Summer 个人相册";
				linkarr[4] = "http://www.yangqq.com";
				picarr[4] = "${ctxResource}/index/images/04.jpg";
				textarr[4] = " Goodbye Summer 个人相册";
				linkarr[5] = "http://www.yangqq.com";
				picarr[5] = "${ctxResource}/index/images/02.jpg";
				textarr[5] = " Goodbye Summer 个人相册";

				for (i = 1; i < picarr.length; i++) {
					if (files == "")
						files = picarr[i];
					else
						files += "|" + picarr[i];
				}
				for (i = 1; i < linkarr.length; i++) {
					if (links == "")
						links = linkarr[i];
					else
						links += "|" + linkarr[i];
				}
				for (i = 1; i < textarr.length; i++) {
					if (texts == "")
						texts = textarr[i];
					else
						texts += "|" + textarr[i];
				}
				document
						.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ swf_width +'" height="'+ swf_height +'">');
				document
						.write('<param name="movie" value="images/bcastr3.swf"><param name="quality" value="high">');
				document
						.write('<param name="menu" value="false"><param name=wmode value="opaque">');
				document
						.write('<param name="FlashVars" value="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'">');
				document
						.write('<embed src="images/bcastr3.swf" wmode="opaque" FlashVars="bcastr_file='+files+'&bcastr_link='+links+'&bcastr_title='+texts+'& menu="false" quality="high" width="'+ swf_width +'" height="'+ swf_height +'" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
				document.write('</object>');
			</script>
			 代码 结束 -->
		</div>
	</c:if>
	<c:if test="${showMydoc eq 'true' }">
		<h2>
			<p>个人档案</p>
		</h2>
		<div class="vcard">
			<p class="fn">姓名：${aboutme.name }</p>
			<p class="nickname">网名：${aboutme.nick }</p>
			<p class="url">
				主页：<a href="${index }" target="_blank">${webTitle }'s blog</a>
			</p>
			<p class="address">现居：${aboutme.addr }</p>
			<p class="role">职业：${aboutme.job }</p>
		</div>
	</c:if>
	<c:if test="${showCate eq 'true' }">
		<h2>
			<p>博客分类</p>
		</h2>
		<ul class="news">
			<c:forEach items="${categoryList }" var="category">
				<c:if test="${category.parentCategory.name eq '博客文章' }">
					<li><a href="${category.href }" target="${category.target }">${category.name }</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${showNewBlog eq 'true' }">
		<h2>
			<p>近期文章</p>
		</h2>
		<ul class="news">
			<c:forEach items="${newBlogList }" var="newBlog">
				<li><a href="${newBlog.link }">${newBlog.title }</a></li>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${showFile eq 'true' }">
		<h2>
			<p>文章归档</p>
		</h2>
		<ul class="news">
			<li><a href="/">2008 年三月</a></li>
			<li><a href="/">2008 年四月</a></li>
			<li><a href="/">2008 年六月</a></li>
		</ul>
	</c:if>
	<c:if test="${showLink eq 'true' }">
		<h2>
			<p>友情链接</p>
		</h2>
		<ul class="news">
			<li><a href="http://www.yangqq.com">杨青个人博客</a></li>
		</ul>
	</c:if>
	<c:if test="${showShare eq 'true'}">
		<div class="share">
			<h2></h2>
			<p>
				<!-- Baidu Button BEGIN -->
				DanceSmile
			<div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare">
				<a class="bds_tsina"></a> <a class="bds_qzone"></a> <a
					class="bds_tqq"></a> <a class="bds_renren"></a> <span
					class="bds_more"></span> <a class="shareCount"></a>
			</div>
			<script type="text/javascript" id="bdshare_js"
				data="type=tools&amp;uid=6574585"></script>
			<script type="text/javascript" id="bdshell_js"></script>
			<script type="text/javascript">
				document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
						+ Math.ceil(new Date() / 3600000)
			</script>
		</div>
	</c:if>
</aside>