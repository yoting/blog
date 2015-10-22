package com.gusi.blog.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.gusi.blog.pojo.UserBlog;
import com.gusi.blog.service.UserService;
import com.gusi.platform.core.model.PageInfo;

@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

	@Resource
	UserService userService;

	@ModelAttribute(value = "user")
	public UserBlog get(@RequestParam(required = false) Long id) {
		UserBlog user = null;
		if (id == null) {
			user = new UserBlog();
		} else {
			user = userService.getUserById(id);
		}
		return user;
	}

	@RequestMapping(value = "/listView")
	public ModelAndView listUser(int pageNo, int pageSize) {
		PageInfo pageInfo = new PageInfo(pageSize);
		pageInfo.getPageInfo(pageNo);
		pageInfo = userService.getUserListPaged(pageInfo);
		pageInfo.setUrl("user/listView");
		obj.put("pageInfo", pageInfo);
		return createBackLayoutView("user/userList", obj);
	}

	@RequestMapping(value = "/getCurrentUserView")
	public ModelAndView getCurrentUserView(@ModelAttribute(value = "user") UserBlog user) {
		return addOrUpdateView(user);
	}

	@RequestMapping(value = "/addOrUpdateView")
	public ModelAndView addOrUpdateView(@ModelAttribute(value = "user") UserBlog user) {
		obj.put("user", user);
		return createBackLayoutView("user/userAddOrUpdate", obj);
	}

	@RequestMapping(value = "/addOrUpdateUser")
	public String addOrUpdateUser(UserBlog user) {
		if (user.getId() == null) {
			userService.saveUser(user);
		} else {
			userService.updateUser(user);
		}
		return "redirect:/user/getCurrentUserView?id=" + user.getId();
	}

	@RequestMapping(value = "/getLoginUser")
	@ResponseBody
	public String getLoginUser(@RequestParam Long id) {
		UserBlog user = userService.getUserById(id);
		return JSON.toJSONString(user);
	}
}
