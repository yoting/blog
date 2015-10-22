package com.gusi.blog.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.gusi.blog.pojo.UserBlog;
import com.gusi.blog.service.ArticleService;
import com.gusi.blog.service.CategoryService;
import com.gusi.blog.service.UserService;

@Controller
@RequestMapping("/common")
public class CommonController extends BaseController {
	@Resource
	ArticleService articleService;
	@Resource
	CategoryService categoryService;
	@Resource
	UserService userService;

	/**
	 * 登录
	 * 
	 * @param userName
	 *            用户名
	 * @param password
	 *            密码
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/login")
	public String login(HttpServletRequest request, @RequestParam String userName, @RequestParam String password) {
		UserBlog user = userService.getLoginUser(userName, password);
		if (user != null) {
			request.getSession().setAttribute("user", user);
			return "redirect:/back";
		} else {
			return "redirect:/";
		}
	}

	/**
	 * 文件上传
	 * 
	 * @param request
	 * @param response
	 * @param file
	 *            文件
	 * @param folder
	 *            保存文件夹
	 * @param fileName
	 *            保存文件名称，如果为null，系统根据当前时间自动生成文件名称
	 * @return
	 */
	@RequestMapping(value = "/fileUpload/{folder}/{fileName}")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file, @PathVariable String folder,
			@PathVariable String fileName) {
		String path = request.getContextPath() + "/resource/upload/" + folder;
		String realPath = request.getSession().getServletContext().getRealPath("") + "\\resource\\upload\\" + folder;
		System.out.println("path:" + path);
		System.out.println("realPath:" + realPath);
		File destPath = new File(realPath);
		if (!destPath.exists()) {
			destPath.mkdirs();
		}

		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateStr = format.format(new Date());
		String newFileName = dateStr + new Random().nextInt(100);
		String fileType = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));

		if (fileName == null || fileName.isEmpty() || fileName.equalsIgnoreCase("noFileName")) {
			newFileName += fileType;
		} else {
			newFileName = fileName + fileType;
		}
		try {
			File destFile = new File(realPath, newFileName);
			file.transferTo(destFile);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("uri", path + "/" + newFileName);
			return JSON.toJSONString(map);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return JSON.toJSONString("");
	}

	@RequestMapping(value = "/pictureMngView")
	public ModelAndView pictureMngView() {
		return createBackLayoutView("common/pictureMng", obj);
	}
}
