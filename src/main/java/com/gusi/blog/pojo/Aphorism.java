package com.gusi.blog.pojo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.gusi.blog.common.utils.StringUtils;
import com.gusi.platform.core.model.ItemIdLong;

/**
 * 格言
 * 
 * @author dyy_gusi 2014年12月18日下午4:02:35
 * 
 */

@Entity
@Table(name = "blog_aphorism")
public class Aphorism extends ItemIdLong {
	private String content;
	private String fromPeople;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fromDate;
	private String image;

	public String getContent() {
		return content;
	}

	@Transient
	public String getContentNoStyle() {
		String data = StringUtils.rabbr(this.getContent(), Integer.MAX_VALUE);
		return data;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFromPeople() {
		return fromPeople;
	}

	public void setFromPeople(String fromPeople) {
		this.fromPeople = fromPeople;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
