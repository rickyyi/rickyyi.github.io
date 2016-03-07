package com.henu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.henu.model.Order;
import com.henu.pagination.Pagination;

public class OrderServiceTest {
	private  OrderService us = (OrderService) new FileSystemXmlApplicationContext("conf/applicationContext.xml").getBean("orderService");
/*	@Test
	public void create() throws Exception {
		Order order = new Order();
		order.setUserId(3);
		order.setGoodsId(3);
		order.setOrderCount(10);
		order.setOrderStatus("等待发货");
		order.setTotalPrice(10);
		us.create(order);
	}*/
	
/*	@Test
	public void findByUserId(){
		List<Order> orders = us.findByUserId(3);
		for(Order order : orders){
			System.out.println(order.getCreateTime());
		}
	}*/

	@Test
	public void query() {
		Map<String, Object> map = new HashMap<String, Object>();

	    Pagination pagination = new Pagination();
	    pagination.setCurrentPage(1);

	    map.put("pagination", pagination);
	    //map.put("keyword", "鲜果");
	    //map.put("type", "category");
	    List<Order> ordersList = us.query(map);
	    System.out.println("商品数量："+ordersList.size());
	}

}
