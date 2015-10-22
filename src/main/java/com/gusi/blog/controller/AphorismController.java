package com.gusi.blog.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.gusi.blog.common.utils.StaticVar;
import com.gusi.blog.pojo.Aphorism;
import com.gusi.blog.service.AphorismService;
import com.gusi.platform.core.model.PageInfo;
import com.gusi.platform.core.model.Root;

@Component
@RequestMapping(value = "/aphorism")
public class AphorismController extends BaseController {

	@Resource
	AphorismService aphorismService;

	@ModelAttribute(value = "aphorism")
	public Aphorism get(@RequestParam(required = false) Long id) {
		Aphorism aphorism = null;
		if (id == null) {
			aphorism = new Aphorism();
		} else {
			aphorism = aphorismService.getAphorismById(id);
		}
		return aphorism;
	}

	@RequestMapping(value = "/listView")
	public ModelAndView listView(int pageNo, int pageSize) {
		PageInfo pageInfo = new PageInfo(pageSize);
		pageInfo.getPageInfo(pageNo);
		pageInfo = aphorismService.getAphorismListPaged(pageInfo);
		pageInfo.setUrl("aphorism/listView");
		obj.put("pageInfo", pageInfo);
		return createBackLayoutView("aphorism/aphorismList", obj);
	}

	@RequestMapping(value = "/addOrUpdateView")
	public ModelAndView addOrUpdateView(Aphorism aphorism) {
		obj.put("aphorism", aphorism);
		return createBackLayoutView("aphorism/aphorismAddOrUpdate", obj);
	}

	/******** 华丽的分割线 *************/
	@RequestMapping(value = "/addOrUpdateAphorism")
	public String addOrUpdateAphorism(Aphorism aphorism) {
		if (aphorism.getId() == null) {
			aphorismService.saveAphorism(aphorism);
		} else {
			aphorismService.updateAphorism(aphorism);
		}
		return "redirect:/aphorism/listView?pageNo=1&pageSize=" + StaticVar.PageVar.PAGESIZE;
	}

	@RequestMapping(value = "/deleteAphorism")
	public String deleteAphorism(@RequestParam Long id) {
		Aphorism aphorism = aphorismService.getAphorismById(id);
		aphorism.setState(Root.State.STATE_DELETE);
		aphorismService.updateAphorism(aphorism);

		return "redirect:/aphorism/listView?pageNo=1&pageSize=" + StaticVar.PageVar.PAGESIZE;
	}

	@RequestMapping(value = "/getAphorismList")
	@ResponseBody
	public String getAphorismList(int pageNo, int pageSize) {
		// TODO:感觉这个方法没用
		PageInfo pageInfo = new PageInfo(pageSize);
		pageInfo = pageInfo.getPageInfo(pageNo);

		pageInfo = aphorismService.getAphorismListPaged(pageInfo);

		return JSON.toJSONString(pageInfo.getObjList());
	}
}
