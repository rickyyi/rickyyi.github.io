package com.henu.service;

import java.util.List;
import java.util.Map;

import com.henu.exception.ParameterException;
import com.henu.exception.ServiceException;
import com.henu.model.User;

public interface UserService {
	public User login(String username, String password) throws ParameterException, ServiceException;

	public void register(User user);
	
	public void delete(int Id);
	
	public void update(Map<String, Object> map);
	
	public User getByName(String username);
	
	public User getById(int id);
	
	public int getTotalCount();
	
	public List<User> query(Map<String, Object> map);
}
