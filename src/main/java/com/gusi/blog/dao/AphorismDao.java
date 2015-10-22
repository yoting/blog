package com.gusi.blog.dao;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.gusi.blog.pojo.Aphorism;
import com.gusi.platform.core.dao.impl.BaseDAOImpl;

@Repository
public class AphorismDao extends BaseDAOImpl<Aphorism, Long> {
	@Resource
	HibernateTemplate hibernateTemplate;

	// static {
	// System.out.println("haha");
	// hibernateTemplate.clear();
	// }
}
