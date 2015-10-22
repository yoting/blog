package com.gusi.blog.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gusi.blog.common.utils.StaticVar;
import com.gusi.blog.dao.BaseInfoDao;
import com.gusi.blog.pojo.BaseInfo;
import com.gusi.platform.core.model.PageInfo;

@Transactional
@Service
public class BaseInfoService {

	@Resource
	BaseInfoDao biDao;

	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List<BaseInfo> getAllBaseInfo() {
		List<BaseInfo> infos = biDao.getObjList();
		biDao.clear();
		for (BaseInfo info : infos) {
			info.setBlank(StaticVar.BaseInfoType.baseInfoTypeMap.get(info.getType()));
		}
		return infos;
	}

	public BaseInfo getBaseInfoById(Long id) {
		return biDao.getObjById(id);
	}

	public BaseInfo getBaseInfoByKey(String key) {
		List<BaseInfo> baseInfos = biDao.getObjListByCondition("obj.k ='" + key + "'");
		if (baseInfos != null && baseInfos.size() > 0) {
			return baseInfos.get(0);
		}
		return null;
	}

	public PageInfo getBaseInfoPaged(PageInfo pageInfo) {
		return biDao.getObjListPaged(pageInfo);
	}

	public void updateBaseInfo(BaseInfo info) {
		biDao.update(info, true);
	}

	public void saveBaseInfo(BaseInfo info) {
		biDao.save(info);
	}
}
