package com.gusi.blog.dao;

import org.springframework.stereotype.Repository;

import com.gusi.blog.pojo.Article;
import com.gusi.platform.core.dao.impl.BaseDAOImpl;

@Repository
public class ArticleDao extends BaseDAOImpl<Article, Long> {

	// @Override
	// public void update(Article obj, Boolean isUpdateTime, Boolean
	// isUpdateNull) {
	// Article oldObj = getObjById(obj.getId());
	// super.update(obj, isUpdateTime, isUpdateNull);
	// }

}
