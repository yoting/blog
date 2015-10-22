package com.gusi.blog.pojo;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.gusi.platform.core.model.ItemIdLong;

/**
 * 基本信息，以Map<String,String>的形式保存在数据库中
 * 
 * @author dyy_gusi 2014年12月24日上午10:42:27
 * 
 */
@Entity
@Table(name = "blog_baseInfo")
public class BaseInfo extends ItemIdLong {
	private String name;
	private String k;
	private String v;
	private Integer type;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getK() {
		return k;
	}

	public void setK(String k) {
		this.k = k;
	}

	public String getV() {
		return v;
	}

	public void setV(String v) {
		this.v = v;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}
