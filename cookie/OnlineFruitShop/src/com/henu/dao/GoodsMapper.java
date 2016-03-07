package com.henu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.henu.model.Goods;

@Component("goodsMapper")
public interface GoodsMapper {
	public void create(Goods goods);
	
	public void delete(@Param("id") int id);

    public void update(Map<String, Object> map);
    
    public int getStock(@Param("id") int id);
    
    public int updateStock(Map<String, Object> map);
    
    public Goods getById(@Param("id") int id);
    
    public List<Goods> getLastByLimit(@Param("limit") int limit);
    
    public List<Goods> query(Map<String, Object> map);

    public int getTotalCount(Map<String, Object> map);

}
