package com.gusi.blog.pojo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.gusi.platform.core.model.ItemIdLong;

@Entity
@Table(name = "blog_category")
public class Category extends ItemIdLong {
	private Category parentCategory;
	private String parentIds;
	private Boolean hasChild;
	private String name;
	private String href;
	private String target;
	private String description;
	private Integer indexNum;
	private Boolean enableComment;

	@ManyToOne
	@JoinColumn(name = "parentCategory")
	@NotFound(action = NotFoundAction.IGNORE)
	public Category getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(Category parentCategory) {
		this.parentCategory = parentCategory;
	}

	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	public Boolean getHasChild() {
		return hasChild;
	}

	public void setHasChild(Boolean hasChild) {
		this.hasChild = hasChild;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getIndexNum() {
		return indexNum;
	}

	public void setIndexNum(Integer indexNum) {
		this.indexNum = indexNum;
	}

	public Boolean getEnableComment() {
		return enableComment;
	}

	public void setEnableComment(Boolean enableComment) {
		this.enableComment = enableComment;
	}

	/**
	 * 给list排序，按照深度优先的顺序排序
	 * 
	 * @param list
	 * @param pId
	 * @return
	 */
	public static List<Category> sort(List<Category> list, Long pId) {
		List<Category> sortedList = new ArrayList<Category>();
		for (Category category : list) {
			if (pId == null && category.getParentCategory() == null) {
				sortedList.add(category);
				sortedList.addAll(sort(list, category.getId()));
			} else if (category.getParentCategory() != null && category.getParentCategory().getId() == pId) {
				sortedList.add(category);
				sortedList.addAll(sort(list, category.getId()));
			}
		}
		return sortedList;
	}

}
