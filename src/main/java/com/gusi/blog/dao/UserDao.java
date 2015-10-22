package com.gusi.blog.dao;

import org.springframework.stereotype.Repository;

import com.gusi.blog.pojo.UserBlog;
import com.gusi.platform.core.dao.impl.BaseDAOImpl;

@Repository
public class UserDao extends BaseDAOImpl<UserBlog, Long> {
}
