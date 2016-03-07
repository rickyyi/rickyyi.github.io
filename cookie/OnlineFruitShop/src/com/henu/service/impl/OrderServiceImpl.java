package com.henu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.henu.dao.GoodsMapper;
import com.henu.dao.OrderMapper;
import com.henu.model.Order;
import com.henu.pagination.Pagination;
import com.henu.service.OrderService;

public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public void create(Order order) throws Exception {

		int oldStock = goodsMapper.getStock(order.getGoodsId());
		Map<String, Object> map = new HashMap<String, Object>();
		synchronized (OrderServiceImpl.class) {
			if(oldStock>0 && order.getOrderCount() <= oldStock) {
				int newStock = oldStock - order.getOrderCount();
				map.put("id", order.getGoodsId());
				map.put("stock", newStock);
				orderMapper.create(order);
				goodsMapper.updateStock(map);
			} else {
				throw new Exception("参数不合法");
			}
		}

	}

	@Override
	public List<Order> findByUserId(int userId) {
		return orderMapper.findByUserId(userId);
	}

	@Override
	public int getTotalCount() {
        int result = orderMapper.getTotalCount(new HashMap<String, Object>());
        return result;
	}
	
	@Override
	public List<Order> query(Map<String, Object> map) {
		Pagination p = (Pagination) map.get("pagination");
		p.setTotalCount(orderMapper.getTotalCount(map));
		return orderMapper.query(map);
	}
}
