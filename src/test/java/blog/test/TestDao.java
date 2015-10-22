package blog.test;

import java.util.Random;

import org.junit.Test;

import com.gusi.blog.dao.ArticleDao;
import com.gusi.blog.pojo.Aphorism;
import com.gusi.blog.pojo.Article;

public class TestDao {

	@Test
	public void testRandom() {
		Random random = new Random();
		for (int i = 0; i < 10; i++)
			System.out.println(random.nextInt(5));
	}

	@Test
	public void addArticle() {
		for (int i = 0; i < 100; i++) {
			Article a = new Article();
			a.setTitle(i + "");
			ArticleDao ad = new ArticleDao();
			ad.save(a);
		}
	}

	@Test
	public void addAphorism() {
		for (int i = 0; i < 100; i++) {
			Aphorism a = new Aphorism();
			a.setContent(i + "");
		}
	}
}
