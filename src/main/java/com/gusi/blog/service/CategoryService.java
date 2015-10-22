package com.gusi.blog.service;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gusi.blog.dao.CategoryDao;
import com.gusi.blog.pojo.Category;
import com.gusi.platform.core.model.PageInfo;
import com.gusi.platform.core.service.UtilService;

@Service
@Transactional
public class CategoryService {
	@Resource
	private CategoryDao categoryDao;

	@Resource
	private UtilService utilService;

	/**
	 * 保存类别
	 * 
	 * @param category
	 */
	public void saveCategory(Category category) {
		Long parentId = category.getParentCategory().getId();
		Category parent = null;
		if (parentId != null) {
			parent = getCategoryById(parentId);
			parent.setHasChild(true);
			simpleUpdateCategory(parent);
			String parentIds = parent.getParentIds();
			if (parentIds == null) {
				category.setParentIds(parent.getId() + "");
			} else {
				category.setParentIds(parentIds + "," + parent.getId());
			}
		}
		category.setParentCategory(parent);
		int maxIndexNum = utilService.getCurrentMaxNumber("blog_category", "indexNum", null);
		category.setIndexNum(++maxIndexNum);

		categoryDao.save(category);

		String href = category.getHref();
		href += "/" + category.getId();
		category.setHref(href);
		categoryDao.update(category, false);
	}

	/**
	 * 根据Id得到一个类别
	 * 
	 * @param id
	 * @return
	 */
	public Category getCategoryById(Long id) {
		return categoryDao.getObjById(id);
	}

	/**
	 * 得到所有类别
	 * 
	 * @return
	 */
	public List getAllCategory() {
		return categoryDao.getObjList();
	}

	/**
	 * 得到不包含当前Id类别和子类别的类别
	 * 
	 * @param id
	 * @return
	 */
	public List getNoIdCategory(Long id) {
		List<Category> list = categoryDao.getObjList();
		Iterator<Category> itList = list.iterator();
		while (itList.hasNext()) {
			Category category = itList.next();
			if (category.getId() == id || (category.getParentIds() != null) && (category.getParentIds()).contains("" + id)) {
				itList.remove();// 使用Iterator的remove方法，这样modCount和exceptionModCount永远是一致的
			}
		}
		return list;
	}

	/**
	 * 分页得到类别信息
	 * 
	 * @param pageInfo
	 * @return
	 */
	public PageInfo getCategoryListPaged(PageInfo pageInfo) {
		return categoryDao.getObjListPaged(pageInfo);
	}

	/**
	 * 更新类别
	 * 
	 * @param category
	 */
	public void updateCategory(Category category) {
		Long parentId = null;
		Category parent = category.getParentCategory();
		if (parent != null) {
			parentId = category.getParentCategory().getId();
		}
		if (parentId != null) {
			parent = getCategoryById(parentId);
			parent.setHasChild(true);
			simpleUpdateCategory(parent);

			String parentParentIds = parent.getParentIds();
			if (parentParentIds == null) {
				category.setParentIds(parent.getId() + "");
			} else {
				category.setParentIds(parent.getId() + "," + parentParentIds);
			}
		} else {
			parent = null;
		}
		category.setParentCategory(parent);

		categoryDao.clear();
		categoryDao.update(category, false);

		List<Category> children = categoryDao.getAllChild(category.getId());
		for (Category child : children) {
			updateCategory(child);
		}
	}

	public void simpleUpdateCategory(Category category) {
		categoryDao.clear();
		categoryDao.update(category, false);
	}

	/**
	 * 删除类别
	 * 
	 * @param id
	 */
	public void deleteCategory(Long id) {
		Category selfCategory = getCategoryById(id);
		selfCategory.setState(-1);
		categoryDao.update(selfCategory, false);

		List<Category> allCategoryList = getAllCategory();
		List<Category> childrenList = Category.sort(allCategoryList, id);
		for (Category category : childrenList) {
			category.setState(-1);
			categoryDao.update(category, false);
		}
	}

	/**
	 * 得到一个类别的根类别
	 * 
	 * @param category
	 * @return
	 */
	public Category getRootCategory(Category category) {
		if (category.getParentCategory() == null) {
			return category;
		}
		category = category.getParentCategory();
		return getRootCategory(category);
	}

}
