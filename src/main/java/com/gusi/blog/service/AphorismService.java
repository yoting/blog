package com.gusi.blog.service;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gusi.blog.dao.AphorismDao;
import com.gusi.blog.pojo.Aphorism;
import com.gusi.platform.core.model.PageInfo;

@Service
@Transactional
public class AphorismService {
	@Resource
	AphorismDao aphorismDao;

	public List<Aphorism> getAllAphorism() {
		return aphorismDao.getObjListByCondition("1=1");
	}

	public PageInfo getAphorismListPaged(PageInfo pageInfo) {
		return aphorismDao.getObjListPaged(pageInfo);
	}

	public Aphorism getAphorismRandom() {
		List<Aphorism> aphorisms = aphorismDao.getObjListByCondition("obj.state = 0 or obj.state is NULL");
		Random random = new Random();
		if (aphorisms != null && aphorisms.size() > 0) {
			return aphorisms.get(random.nextInt(aphorisms.size()));
		} else {
			return null;
		}
	}

	public Aphorism getAphorismById(Long id) {
		return aphorismDao.getObjById(id);
	}

	public void saveAphorism(Aphorism aphorism) {
		aphorismDao.save(aphorism);
	}

	public void updateAphorism(Aphorism aphorism) {
		aphorismDao.update(aphorism, true);
	}
}
