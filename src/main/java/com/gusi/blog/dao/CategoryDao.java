package com.gusi.blog.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gusi.blog.pojo.Category;
import com.gusi.platform.core.dao.impl.BaseDAOImpl;

@Repository
public class CategoryDao extends BaseDAOImpl<Category, Long> {
	public List<Category> getAllChild(Long id) {
		List<Category> list = new ArrayList<Category>();
		list = getObjListByCondition("obj.parentIds like '%" + id + "%'");
		return list;
	}

}
