package com.henu.service;

import java.util.List;
import java.util.Map;

import com.henu.model.Order;

public interface OrderService {

	public void create(Order order) throws Exception;
	
	public List<Order> findByUserId(int userId);
	
	public List<Order> query(Map<String, Object> map);

	public int getTotalCount();
}
