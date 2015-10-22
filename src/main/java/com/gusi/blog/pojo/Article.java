package com.gusi.blog.pojo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

import com.gusi.blog.common.utils.StringUtils;
import com.gusi.platform.core.model.ItemIdLong;

@Entity
@Table(name = "blog_article")
public class Article extends ItemIdLong {
	private Category category;// 类别
	private String title;// 标题
	private String link;// 连接
	private String image;// 图像
	private String keywords;// 关键字
	private String description;// 描述
	private String content;// 内容
	private String copyFrom;// 来源
	private Integer indexNum;// 序号
	private Integer weight;// 权重
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date weightInvalidate;// 权重时间
	private Integer hits;// 点击量
	private String style;// 显示格式
	private UserBlog author;// 作者

	@ManyToOne
	@JoinColumn(name = "category")
	@NotFound(action = NotFoundAction.IGNORE)
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	@Transient
	public String getDescription() {
		String data = StringUtils.rabbr(this.getContent(), 200);
		return data;
	}

	@Transient
	public String getDescriptionShort() {
		String data = StringUtils.rabbr(this.getContent(), 50);
		return data;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCopyFrom() {
		return copyFrom;
	}

	public void setCopyFrom(String copyFrom) {
		this.copyFrom = copyFrom;
	}

	public Integer getIndexNum() {
		return indexNum;
	}

	public void setIndexNum(Integer indexNum) {
		this.indexNum = indexNum;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Date getWeightInvalidate() {
		return weightInvalidate;
	}

	public void setWeightInvalidate(Date weightInvalidate) {
		this.weightInvalidate = weightInvalidate;
	}

	public Integer getHits() {
		return hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	@ManyToOne
	@JoinColumn(name = "author")
	@NotFound(action = NotFoundAction.IGNORE)
	public UserBlog getAuthor() {
		return author;
	}

	public void setAuthor(UserBlog author) {
		this.author = author;
	}

}
