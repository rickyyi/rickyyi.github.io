package com.henu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.henu.dao.GoodsMapper;
import com.henu.exception.NoStockException;
import com.henu.model.Goods;
import com.henu.pagination.Pagination;
import com.henu.service.GoodsService;
import com.henu.util.PropertyUtil;

public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public void create(Goods goods) {
		goodsMapper.create(goods);
		
	}

	@Override
	public void delete(int id) {
		goodsMapper.delete(id);
		
	}

	@Override
	public void update(int id, Goods goods) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("goods", goods);
		goodsMapper.update(map);
	}

	@Override
	public int getStock(int id) {
		return goodsMapper.getStock(id);
	}

	@Override
	public void updateStock(int id, int buyCount) throws NoStockException {
		int rest = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rest = this.getStock(id)-buyCount;
			map.put("id", id);
			map.put("stock", rest);
			goodsMapper.updateStock(map);
		} catch (Exception e) {
			throw new NoStockException();
		}
	}

	@Override
	public Goods getById(int id) {
		return goodsMapper.getById(id);
	}

	@Override
	public int getTotalCount() {
        int result = goodsMapper.getTotalCount(new HashMap<String, Object>());
        return result;
	}
	
	@Override
	public List<Goods> query(Map<String, Object> map) {
		Pagination p = (Pagination) map.get("pagination");
		p.setTotalCount(goodsMapper.getTotalCount(map));
		return goodsMapper.query(map);
	}
 
	@SuppressWarnings("null")
	@Override
	public List<Goods> getLastByLimit() {
		String limit = PropertyUtil.getProperty("lastSaleLimit");
		if (limit == null && limit.equals("")) {
			limit = "10";
		}
		return goodsMapper.getLastByLimit(Integer.parseInt(limit));
	}


}
