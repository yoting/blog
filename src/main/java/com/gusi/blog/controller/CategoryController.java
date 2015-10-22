package com.gusi.blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gusi.blog.pojo.Category;
import com.gusi.blog.service.CategoryService;
import com.gusi.platform.core.model.PageInfo;

@Controller
@RequestMapping(value = "/category")
public class CategoryController extends BaseController {

	@Resource
	CategoryService categoryService;

	@ModelAttribute(value = "category")
	public Category get(@RequestParam(required = false) Long id) {
		Category category = null;
		if (id == null) {
			category = new Category();
		} else {
			category = categoryService.getCategoryById(id);
		}
		return category;
	}

	@RequestMapping(value = "/listView")
	public ModelAndView listView() {
		return createBackLayoutView("category/categoryList", obj);
	}

	@RequestMapping(value = "/addView")
	public ModelAndView addView() {
		obj.put("category", new Category());
		return createBackLayoutView("category/categoryAdd", obj);
	}

	@RequestMapping(value = "/updateView")
	public ModelAndView updateView(Category category) {
		obj.put("category", category);
		return createBackLayoutView("category/categoryUpdate", obj);
	}

	@RequestMapping(value = "/categoryTreeView")
	public ModelAndView categoryTreeView(@RequestParam(required = false) Long id) {
		obj.put("id", id);
		return createSingleView("category/categoryTree", obj);
	}

	@RequestMapping(value = "/getCategory")
	public ModelAndView getCategory(@RequestParam int pageNo, @RequestParam int pageSize) {
		PageInfo pageInfo = new PageInfo(pageSize);
		pageInfo = pageInfo.getPageInfo(pageNo);
		// pageInfo.setCondition("obj.state > -1");
		pageInfo = categoryService.getCategoryListPaged(pageInfo);
		pageInfo.setObjList(Category.sort(pageInfo.getObjList(), null));
		obj.put("pageInfo", pageInfo);
		return createBackLayoutView("category/categoryList", obj);
	}

	/******** 这是一条华丽的分隔线 *********/
	@RequestMapping(value = "/getCategoryTree")
	@ResponseBody
	public Map<String, Object> getCategoryTree(Long id) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<Category> categoryList = null;
		if (id == null) {
			categoryList = categoryService.getAllCategory();
		} else {
			categoryList = categoryService.getNoIdCategory(id);
		}
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (Category category : categoryList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", category.getId());
			Long pId = 0L;
			if (category.getParentCategory() != null) {
				pId = category.getParentCategory().getId();
			}
			map.put("pId", pId);
			map.put("name", category.getName());
			list.add(map);
		}
		jsonMap.put("total", list.size());
		jsonMap.put("rows", list);

		return jsonMap;
	}

	@RequestMapping(value = "/createCategory")
	public String createCategory(Category category, HttpServletRequest request) {
		category.setHref(request.getContextPath());
		categoryService.saveCategory(category);
		return "redirect:/category/getCategory?pageNo=1&pageSize=-1";
	}

	@RequestMapping(value = "/updateCategory")
	public String updateCategory(Category category) {
		categoryService.updateCategory(category);
		return "redirect:/category/getCategory?pageNo=1&pageSize=-1";
	}

	@RequestMapping(value = "/deleteCategory")
	public String deleteCategory(Long id) {
		categoryService.deleteCategory(id);
		return "redirect:/category/getCategory?pageNo=1&pageSize=-1";
	}

}
