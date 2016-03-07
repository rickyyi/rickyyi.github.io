package com.henu.service.base;

public interface BaseService<T> {
	
	public void Create(int id, T t);
	
	public void delete(int id);
	
	public void update(int id, T t);
	
	public void getOne(int id);
}
