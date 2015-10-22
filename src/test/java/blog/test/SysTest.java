package blog.test;

import java.util.Date;

import javax.annotation.Resource;

import junit.framework.TestCase;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gusi.blog.pojo.Aphorism;
import com.gusi.blog.pojo.Article;
import com.gusi.blog.pojo.UserBlog;
import com.gusi.blog.service.AphorismService;
import com.gusi.blog.service.ArticleService;
import com.gusi.blog.service.UserService;
import com.gusi.platform.core.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/conf/gusi.platform.core.xml", "classpath:/conf/applicationContext.xml" })
public class SysTest extends TestCase {

	@Resource
	private UserService userService;

	@Resource
	ArticleService as;
	@Resource
	AphorismService aphorismService;

	@Test
	public void addArticle() {
		for (int i = 0; i < 100; i++) {
			Article a = new Article();
			a.setTitle(i + "");
			as.saveArticle(a);
		}
	}

	@Test
	public void addAphorism() {
		for (int i = 0; i < 100; i++) {
			Aphorism a = new Aphorism();
			a.setContent(i + "");
			aphorismService.saveAphorism(a);
		}
	}

	@Test
	public void testSave() {
		for (int i = 0; i < 20; i++) {
			UserBlog userblog = new UserBlog();
			userblog.setUserName("userName" + (i + 1));
			userblog.setPassword("password" + (i + 1));
			userblog.setAboutme("aboutMe" + (i + 1));
			userService.saveUser(userblog);
		}
	}

	@Test
	public void testUpdate() {
		User user = userService.getUserById(1L);
		for (int i = 1; i <= 20; i++) {
			UserBlog u = userService.getUserById(Long.parseLong("" + i));
			u.setCreater(user);
			u.setUpdater(user);
			u.setBirthday(new Date());
			userService.updateUser(u);
		}
	}
}
