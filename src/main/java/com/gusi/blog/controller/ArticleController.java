package com.gusi.blog.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.gusi.blog.common.utils.StaticVar;
import com.gusi.blog.pojo.Article;
import com.gusi.blog.pojo.Category;
import com.gusi.blog.service.ArticleService;
import com.gusi.blog.service.CategoryService;
import com.gusi.platform.core.model.PageInfo;
import com.gusi.platform.core.model.Root;

@Controller
@RequestMapping(value = "/article")
public class ArticleController extends BaseController {

	@Resource
	ArticleService articleService;
	@Resource
	CategoryService categoryService;

	@ModelAttribute(value = "article")
	public Article get(@RequestParam(required = false) Long id) {
		Article article = null;
		if (id == null) {
			article = new Article();
		} else {
			article = articleService.getArticleById(id);
		}
		return article;
	}

	/**
	 * 展示所有文章视图
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = "/listView")
	public ModelAndView listView(int pageNo, int pageSize) {
		PageInfo pageInfo = new PageInfo(pageSize);
		pageInfo.getPageInfo(pageNo);
		pageInfo = articleService.getArticleListPaged(pageInfo);
		pageInfo.setUrl("article/listView");
		obj.put("pageInfo", pageInfo);
		return createBackLayoutView("article/articleList", obj);
	}

	/**
	 * 新建或者更新视图
	 * 
	 * @param article
	 * @return
	 */
	@RequestMapping(value = "/addOrUpdateView")
	public ModelAndView addOrUpdateView(Article article) {
		obj.put("article", article);
		return createBackLayoutView("article/articleAddOrUpdate", obj);
	}

	/*** 这是一条华丽的分隔线(以下是功能性的方法，提供给页面请求，不是页面跳转controller) ***/

	/**
	 * 执行新建或者更新操作
	 * 
	 * @param request
	 * @param article
	 * @return
	 */
	@RequestMapping(value = "/addOrUpdateArticle")
	public String addOrUpdateArticle(HttpServletRequest request, Article article) {
		if (article.getId() == null) {
			String path = request.getContextPath();
			article.setLink(path);
			articleService.saveArticle(article);
		} else {
			// article.setCategory(null);
			articleService.updateArticle(article);
		}

		return "redirect:/article/listView?pageNo=1&pageSize=" + StaticVar.PageVar.PAGESIZE;
	}

	/**
	 * 删除文章操作
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteArticle")
	public String deleteArticle(@RequestParam Long id) {
		Article article = articleService.getArticleById(id);
		article.setState(Root.State.STATE_DELETE);
		articleService.updateArticle(article);
		return "redirect:/article/listView?pageNo=1&pageSize=" + StaticVar.PageVar.PAGESIZE;
	}

	/**
	 * 根据文章类别获得对应的所有的文章（ajax调运）
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param categoryId
	 * @return
	 */
	@RequestMapping(value = "/getArticleList")
	@ResponseBody
	public String getArticleList(int pageNo, int pageSize, @RequestParam(required = false) Long categoryId) {
		PageInfo pageInfo = new PageInfo(pageSize);
		pageInfo.getPageInfo(pageNo);
		if (categoryId != null && categoryId > 0) {
			pageInfo.setCondition("obj.category.id='" + categoryId + "' or (obj.category.parentIds like '%" + categoryId + "%')");
		}
		pageInfo = articleService.getArticleListPaged(pageInfo);
		List<Article> articles = pageInfo.getObjList();
		for (Article article : articles) {
			Category category = new Category();
			category.setName(article.getCategory().getName());

			// article.setContent(null);
			article.setCategory(category);
		}
		String returnJson = JSON.toJSONString(articles);
		return returnJson;
	}
}
