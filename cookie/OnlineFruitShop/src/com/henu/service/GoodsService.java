package com.henu.service;

import java.util.List;
import java.util.Map;

import com.henu.exception.NoStockException;
import com.henu.model.Goods;

public interface GoodsService {
	public void create(Goods goods);
	
	public void delete(int Id);
	
	public void update(int id, Goods goods);
	
	public int getStock(int id);

	public void updateStock(int id, int buyCount) throws NoStockException;
	
	public Goods getById(int id);
	
	public List<Goods> getLastByLimit();
	
	public List<Goods> query(Map<String, Object> map);

	public int getTotalCount();
}
