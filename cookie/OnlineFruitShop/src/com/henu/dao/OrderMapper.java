package com.henu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.henu.model.Order;

@Component("orderMapper")
public interface OrderMapper {
	
	public void create(Order order);
	
	public List<Order> findByUserId(@Param("userId") int userId);
	
    public List<Order> query(Map<String, Object> map);

    public int getTotalCount(Map<String, Object> map);
}
