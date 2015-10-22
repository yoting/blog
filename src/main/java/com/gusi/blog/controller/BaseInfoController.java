package com.gusi.blog.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gusi.blog.common.utils.StaticVar;
import com.gusi.blog.pojo.BaseInfo;
import com.gusi.blog.service.BaseInfoService;
import com.gusi.platform.core.model.PageInfo;
import com.gusi.platform.core.model.Root;

@Controller
@RequestMapping(value = "/baseInfo")
public class BaseInfoController extends BaseController {

	@Resource
	BaseInfoService biService;

	@ModelAttribute(value = "baseInfo")
	public BaseInfo get(@RequestParam(required = false) Long id) {
		BaseInfo baseInfo = null;
		if (id == null) {
			baseInfo = new BaseInfo();
		} else {
			baseInfo = biService.getBaseInfoById(id);
		}
		return baseInfo;
	}

	@RequestMapping(value = "/listView")
	public ModelAndView listView(int pageNo, int pageSize) {
		PageInfo pageInfo = new PageInfo(pageSize);
		pageInfo.getPageInfo(pageNo);
		pageInfo = biService.getBaseInfoPaged(pageInfo);
		pageInfo.setUrl("baseInfo/listView");
		obj.put("pageInfo", pageInfo);
		return createBackLayoutView("common/baseInfoList", obj);
	}

	@RequestMapping(value = "/addOrUpdateView")
	public ModelAndView addOrUpdateView(BaseInfo baseInfo) {
		obj.put("baseInfo", baseInfo);
		return createSingleView("common/baseInfoAddOrUpdate", obj);
	}

	/******* 华丽的分割线 *********/
	@RequestMapping(value = "/addOrUpdateBaseInfo")
	public String addOrUpdateBaseInfo(BaseInfo info) {
		if (info.getId() == null) {
			biService.saveBaseInfo(info);
		} else {
			biService.updateBaseInfo(info);
		}
		return "redirect:/baseInfo/listView?pageNo=1&pageSize=" + StaticVar.PageVar.PAGESIZE;
	}

	@RequestMapping(value = "/deleteBaseInfo")
	public String deleteBaseInfo(BaseInfo info) {
		if (info != null) {
			info.setState(Root.State.STATE_DELETE);
		}
		biService.updateBaseInfo(info);
		return "redirect:/baseInfo/listView?pageNo=1&pageSize=" + StaticVar.PageVar.PAGESIZE;
	}

}
