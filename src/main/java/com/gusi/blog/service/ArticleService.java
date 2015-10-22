package com.gusi.blog.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gusi.blog.dao.ArticleDao;
import com.gusi.blog.dao.CategoryDao;
import com.gusi.blog.pojo.Article;
import com.gusi.platform.core.model.PageInfo;
import com.gusi.platform.core.service.UtilService;

@Service
@Transactional
public class ArticleService {
	@Resource
	private ArticleDao articleDao;

	@Resource
	private CategoryDao categoryDao;

	@Resource
	private UtilService utilService;

	@Resource
	private CategoryService categoryService;

	public void saveArticle(Article article) {
		int currentMaxNum = utilService.getCurrentMaxNumber("blog_article", "indexNum", null);
		++currentMaxNum;
		article.setIndexNum(currentMaxNum);
		article.setHits(0);
		articleDao.clear();
		articleDao.save(article);

		String link = article.getLink();
		link += "/article/show/" + article.getId();
		article.setLink(link);
		articleDao.clear();
		articleDao.update(article, false);
	}

	public List getAllArticle() {
		return articleDao.getObjList();
	}

	public Article getArticleById(Long id) {
		return articleDao.getObjById(id);
	}

	/**
	 * 查看文章，通过Id找到需要查看的文章，并且返回上一篇，下一篇，相关文章，修改点击量
	 * 
	 * @param id
	 * @return
	 */
	public Map<String, Object> getAritcleByShow(Long id) {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		Article currentArticle = getArticleById(id);
		returnMap.put("currentArticle", currentArticle);

		Long currentId = id;
		Article prevArticle = null;
		while (true) {
			--currentId;
			if (currentId <= 0) {
				break;
			}
			prevArticle = getArticleById(currentId);
			if (prevArticle != null) {
				break;
			}
		}
		currentId = id;
		Article nextArticle = null;
		while (true) {
			++currentId;
			if (currentId > utilService.getCurrentMaxNumber("blog_article", "id", null)) {
				break;
			}
			nextArticle = getArticleById(currentId);
			if (nextArticle != null) {
				break;
			}
		}
		returnMap.put("prevArticle", prevArticle);
		returnMap.put("nextArticle", nextArticle);

		List<Article> relations = new ArrayList<Article>();
		String keywords = currentArticle.getKeywords();
		String[] keywordsArr = keywords.replace("，", ",").split(",");
		String condition = "1=1 and (";
		for (String keyword : keywordsArr) {
			condition += " obj.keywords like '%" + keyword + "%' or";
		}
		condition = condition.substring(0, condition.length() - 2);
		condition += ")";
		relations = articleDao.getObjListByCondition(condition);
		returnMap.put("relationArticles", relations);

		int hits = currentArticle.getHits() == null ? 0 : currentArticle.getHits();
		++hits;
		currentArticle.setHits(hits);
		articleDao.clear();
		updateArticle(currentArticle, false);

		return returnMap;
	}

	public Article getArticleByIndexNum(int indexNum) {
		List<Article> articles = articleDao.getObjListByCondition("obj.indexNum='" + indexNum + "'");
		if (articles == null || articles.size() < 1) {
			return null;
		} else {
			return articles.get(0);
		}
	}

	public PageInfo getArticleListPaged(PageInfo pageInfo) {
		return articleDao.getObjListPaged(pageInfo);
	}

	/**
	 * 返回5篇最新的文章
	 * 
	 * @return
	 */
	public List getNewBlogList(Integer num) {
		List<Article> returnList = new ArrayList<Article>();
		List<Article> articles = articleDao.getObjListSorted("obj.createDate", true);
		for (int i = 0; i < (articles.size() < (num == null ? 5 : num) ? articles.size() : (num == null ? 5 : num)); i++) {
			returnList.add(articles.get(i));
		}
		return returnList;
	}

	/**
	 * 返回3篇推荐的文章
	 * 
	 * @return
	 */
	public List getTopBlogList(Integer num) {
		List<Article> returnList = new ArrayList<Article>();
		List<Article> topArticles = articleDao.getObjListSortedByCondition(
				"obj.weight is not NULL and (obj.weightInvalidate is null or obj.weightInvalidate >"
						+ new SimpleDateFormat("yyyy-MM-dd").format(new Date()) + ")", "obj.weight", true);
		Random random = new Random();
		if (topArticles.size() > num) {
			for (int i = 0; i < num; i++) {
				returnList.add(topArticles.get(i));
			}
		} else {
			for (int i = 0; i < topArticles.size(); i++) {
				returnList.add(topArticles.get(i));
			}

			int abc = num - topArticles.size();
			List<Article> allArticle = articleDao.getObjList();
			if (allArticle != null && allArticle.size() > 0) {
				for (int i = 0; i < abc; i++) {
					returnList.add(allArticle.get(random.nextInt(allArticle.size())));
				}
			}
		}
		return returnList;
	}

	public void updateArticle(Article article) {
		updateArticle(article, true);
	}

	/**
	 * 
	 * @param article
	 * @param isUpdateTime
	 */
	public void updateArticle(Article article, boolean isUpdateTime) {
		articleDao.update(article, isUpdateTime);
	}

	public void deleteArticle(Long id) {

	}

	/**
	 * 分页查询指定类别下所有文章
	 * 
	 * @param categoryId
	 *            指定类别
	 * @param pageInfo
	 *            分页信息
	 * @return
	 */
	public PageInfo getArticleInCategory(Long categoryId, PageInfo pageInfo) {
		pageInfo.setCondition(" 1=1");
		pageInfo.appendCondition(" and (obj.category.id='" + categoryId + "' or obj.category.parentIds like '%" + categoryId + "%') ")
				.appendCondition(" and (obj.state = 0 or obj.state is NULL)");
		return getArticleListPaged(pageInfo);
	}
}
