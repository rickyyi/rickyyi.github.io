package com.henu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.henu.model.Goods;
import com.henu.pagination.Pagination;

public class GoodsServiceTest {
	private  GoodsService us = (GoodsService) new FileSystemXmlApplicationContext("conf/applicationContext.xml").getBean("goodsService");
/*	@Test
	public void create() {
		Goods goods = new Goods();
		goods.setGoodsName("凤梨");
		goods.setCategory("鲜果");
		goods.setIntroduction("来之澳大利亚");
		goods.setPrice(12);
		goods.setStock(1000);
		goods.setThumbnail("c://logs");
		goods.setImageList("c://logs,c://logs,c://logs,c://logs");
		us.create(goods);
	}*/
	
/*	@Test
	public void delete() {
		us.delete(2);
	}*/

/*	@Test
	public void update() {
		Goods goods = new Goods();
		goods.setGoodsName("小红");
		goods.setCategory("新鲜上市");
		goods.setIntroduction("新鲜上市的小红");
		goods.setPrice(12.00f);
		goods.setStock(66600);
		goods.setThumbnail("所虐他");
		us.update(1, goods);
	}*/
	
/*	@Test
	public void getStock() {
		System.err.println(us.getStock(1));
	}
*/
/*	@Test
	public void updateStock() throws NoStockException{
		us.updateStock(3, 6);
	}
	
	@Test
	public void getById(){
		System.out.println(us.getById(3).getGoodsName());
	}*/
	
	@Test
	public void query() {
		Map<String, Object> map = new HashMap<String, Object>();

	    Pagination pagination = new Pagination();
	    pagination.setCurrentPage(1);

	    map.put("pagination", pagination);
	    map.put("keyword", "鲜果");
	    map.put("type", "category");
	    List<Goods> goods = us.query(map);
	    System.out.println("商品数量："+goods.size());
	}
	/*	@Test
	public void getByName() {
		User user = us.getByName("tom");
		Assert.assertEquals("123", user.getPassword());
	}
	
	@Test
	public void delete() {
		us.delete(3);
	}
	
	
	@Test
	public void getTotalCount() {
		System.out.println(us.getTotalCount());
	}
	@Test
	public void getByName() {
		User user = us.getByName("tom");
		Assert.assertEquals("123", user.getPassword());
	}
	
	@Test
	public void getById() {
		User user = us.getById(4);
		Assert.assertEquals("123", user.getPassword());
	}
	@Test
	public void query() {
		Map<String, Object> map = new HashMap<String, Object>();

	    Pagination pagination = new Pagination();
	    pagination.setCurrentPage(1);

	    map.put("pagination", pagination);
	    map.put("keyword", "t");
	    List<User> users = us.query(map);
	    System.out.println("用户数量："+users.size());
	}*/
/*	@Test
	public void getBylimit() {
		List<Goods> goods = us.getLastByLimit();
		Assert.assertEquals(2, goods.size());
	}*/
}
