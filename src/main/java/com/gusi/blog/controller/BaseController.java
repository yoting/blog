package com.gusi.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gusi.blog.pojo.BaseInfo;
import com.gusi.blog.pojo.UserBlog;
import com.gusi.blog.service.ArticleService;
import com.gusi.blog.service.BaseInfoService;
import com.gusi.blog.service.CategoryService;
import com.gusi.blog.service.UserService;

@Component
public class BaseController {

	@Resource
	protected ServletContext context;
	@Resource
	protected HttpSession session;
	@Resource
	protected HttpServletRequest request;
	// @Resource
	protected HttpServletResponse response;

	@Resource
	BaseInfoService biService;
	@Resource
	UserService userService;
	@Resource
	CategoryService categoryService;
	@Resource
	ArticleService articleService;

	protected Map<String, Object> obj = new HashMap<String, Object>();

	protected ModelAndView createSingleView(String path, Map<String, Object> obj) {
		ModelAndView mv = new ModelAndView();

		setBaseInfo2Session();

		if (obj != null) {
			for (Map.Entry<String, Object> entry : obj.entrySet()) {
				mv.addObject(entry.getKey(), entry.getValue());
			}
		}
		mv.setViewName(path);
		return mv;
	}

	protected ModelAndView createLayoutView_(String path, Map<String, Object> obj) {
		return createLayoutView(path, null, obj);
	}

	protected ModelAndView createBackLayoutView(String path, Map<String, Object> obj) {
		ModelAndView mv = createLayoutView(path, "back/layout", obj);

		mv.addObject("basePath", "/WEB-INF/view/");
		mv.addObject("headerPath", "/WEB-INF/view/back/header.jsp");
		mv.addObject("footerPath", "/WEB-INF/view/back/footer.jsp");
		mv.addObject("contentPath", "/WEB-INF/view/" + path + ".jsp");

		return mv;
	}

	protected ModelAndView createFrontLayoutView(String path, Map<String, Object> obj) {
		ModelAndView mv = createLayoutView(path, "front/layout", obj);

		mv.addObject("basePath", "/WEB-INF/view/");
		mv.addObject("headerPath", "/WEB-INF/view/front/header.jsp");
		mv.addObject("footerPath", "/WEB-INF/view/front/footer.jsp");
		mv.addObject("contentPath", "/WEB-INF/view/" + path + ".jsp");

		return mv;
	}

	/**
	 * 创建一个有布局的view
	 * 
	 * @param path
	 *            view内容文件的路径
	 * @param layout
	 *            布局文件路径地址，如果布局文件为null，默认使用后台布局文件
	 * @param obj
	 *            模型对象
	 * @return ModelAndView
	 */
	private ModelAndView createLayoutView(String path, String layout, Map<String, Object> obj) {
		ModelAndView mv = new ModelAndView();
		if (layout == null) {
			mv.setViewName("back/layout");
		} else {
			mv.setViewName(layout);
		}

		setBaseInfo2Session();

		if (obj != null) {
			for (Map.Entry<String, Object> entry : obj.entrySet()) {
				mv.addObject(entry.getKey(), entry.getValue());
			}
		}
		return mv;
	}

	/**
	 * 将一些基本信息，分页大小、默认显示图片、关于博主等信息放入session中或者servletContext中
	 */
	private void setBaseInfo2Session() {
		context = session.getServletContext();
		Object appliactionObj = context.getAttribute("appliactionObj");
		Object sessionObj = session.getAttribute("sessionObj");
		if (appliactionObj == null || sessionObj == null) {
			List<BaseInfo> infos = biService.getAllBaseInfo();
			Map<String, Object> var = new HashMap<String, Object>();
			for (BaseInfo info : infos) {
				var.put(info.getK(), info.getV());
				context.setAttribute(info.getK(), info.getV());
			}

			UserBlog aboutme = userService.getAboutme();
			session.setAttribute("aboutme", aboutme);

			List categoryList = categoryService.getAllCategory();
			List topBlogList = articleService.getTopBlogList(3);
			List newBlogList = articleService.getNewBlogList(null);
			session.setAttribute("categoryList", categoryList);
			session.setAttribute("topBlogList", topBlogList);
			session.setAttribute("newBlogList", newBlogList);

			context.setAttribute("appliactionObj", true);
			session.setAttribute("sessionObj", true);
		}
	}

}
