package com.gusi.blog.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gusi.blog.common.utils.StaticVar;
import com.gusi.blog.pojo.Aphorism;
import com.gusi.blog.pojo.Article;
import com.gusi.blog.pojo.Category;
import com.gusi.blog.service.AphorismService;
import com.gusi.blog.service.ArticleService;
import com.gusi.blog.service.CategoryService;
import com.gusi.blog.service.UserService;
import com.gusi.platform.core.model.PageInfo;

@Component
@RequestMapping
public class FrontController extends BaseController {
	@Resource
	ArticleService articleService;
	@Resource
	CategoryService categoryService;
	@Resource
	AphorismService aphorismService;
	@Resource
	UserService userService;

	/**
	 * 首页Index
	 * 
	 * @return
	 */
	@RequestMapping("")
	public ModelAndView index() {
		Aphorism aphorism = aphorismService.getAphorismRandom();
		obj.put("aphorism", aphorism);
		return createFrontLayoutView("front/index", obj);
	}

	/**
	 * 返回后台
	 * 
	 * @return
	 */
	@RequestMapping(value = "/back")
	public ModelAndView back() {
		return createBackLayoutView("back/welcome", obj);
	}

	/**
	 * 导航，导航栏导航
	 * 
	 * @param cid
	 *            类别Id
	 * @return
	 */
	@RequestMapping(value = "/{cid}")
	public ModelAndView toCategory(@PathVariable Long cid, @RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = StaticVar.PageVar.PAGESIZE + "") Integer pageSize) {
		PageInfo pageInfo = new PageInfo(pageSize);
		pageInfo = pageInfo.getPageInfo(pageNo);

		Category category = categoryService.getCategoryById(cid);
		Category rootCategory = categoryService.getRootCategory(category);

		if (rootCategory.getName().equals("首页")) {
			return index();
		}
		if (rootCategory.getName().equals("博客文章")) {
			pageInfo = articleService.getArticleInCategory(cid, pageInfo);
			pageInfo.setUrl("/" + cid);
			obj.put("pageInfo", pageInfo);

			return createFrontLayoutView("front/blog", obj);
		}

		if (rootCategory.getName().equals("关于博主")) {
			return createFrontLayoutView("front/aboutme", obj);
		}

		if (rootCategory.getName().equals("个人简历")) {
			return createFrontLayoutView("front/resume", obj);
		}
		return index();
	}

	/**
	 * 显示文章
	 * 
	 * @param id
	 *            文章的Id
	 * @return
	 */
	@RequestMapping(value = "article/show/{id}")
	public ModelAndView getArticleById(@PathVariable Long id) {
		Map<String, Object> articleInfo = articleService.getAritcleByShow(id);

		Article article = (Article) articleInfo.get("currentArticle");
		if (article == null) {
			return createSingleView("error/404", obj);
		} else {
			obj.put("article", article);
			obj.put("prevArticle", (Article) articleInfo.get("prevArticle"));
			obj.put("nextArticle", (Article) articleInfo.get("nextArticle"));
			obj.put("relationArticles", (List<Article>) articleInfo.get("relationArticles"));
			return createFrontLayoutView("front/show", obj);
		}
	}

}
