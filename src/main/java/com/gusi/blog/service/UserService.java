package com.gusi.blog.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gusi.blog.dao.UserDao;
import com.gusi.blog.pojo.UserBlog;
import com.gusi.platform.core.model.PageInfo;

@Service
@Transactional
public class UserService {
	@Resource
	private UserDao userDao;

	public void saveUser(UserBlog user) {
		userDao.save(user);
	}

	public UserBlog getUserById(Long id) {
		return userDao.getObjById(id);
	}

	public List getAllUser() {
		return userDao.getObjList();
	}

	public PageInfo getUserListPaged(PageInfo pageInfo) {
		return userDao.getObjListPaged(pageInfo);
	}

	public void updateUser(UserBlog user) {
		UserBlog oldUser = userDao.getObjById(user.getId());
		user.setUserName(oldUser.getUserName());
		user.setPassword(oldUser.getPassword());
		userDao.clear();
		userDao.update(user, true);
	}

	public void deleteUser(Long id) {
		userDao.delete(id);
	}

	public UserBlog getLoginUser(String userName, String password) {
		List<UserBlog> users = userDao.getObjListByCondition("obj.userName='" + userName + "' and obj.password='" + password + "'");
		if (users != null && users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}

	public UserBlog getAboutme() {
		List<UserBlog> users = userDao.getObjListByCondition("isShow is true");
		if (users != null && users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}

}
