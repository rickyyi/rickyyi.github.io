package com.henu.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.henu.dao.UserMapper;
import com.henu.exception.ParameterException;
import com.henu.exception.ServiceException;
import com.henu.model.User;
import com.henu.pagination.Pagination;
import com.henu.service.UserService;
import com.henu.util.StringUtil;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    private Logger log = Logger.getLogger(UserService.class);
    @Override
    public User login(String username, String password) throws ParameterException, ServiceException {

        ParameterException parameterException = new ParameterException();

        if (StringUtil.isEmpty(username)) {
            parameterException.addErrorField("", "");
        }

        if (StringUtil.isEmpty(password)) {
            parameterException.addErrorField("", "");
        }


        if (parameterException.isErrorField()) {
            throw parameterException;
        }

        User user = userMapper.getByName(username);

        if(user != null){
            if (!password.equals(user.getPassword())) {

            }
        } else {
			throw new ServiceException("500");
		}
        return user;
    }


    @Override
    public void register(User user) {
    	userMapper.create(user);
    }


	@Override
	public User getByName(String username) {
		User user = userMapper.getByName(username);
		System.out.println(user.getPhone());
		return user;
	}


	@Override
	public void delete(int id) {
		userMapper.delete(id);	
	}


	@Override
	public void update(Map<String, Object> map) {
		userMapper.update(map);
		
	}


	@Override
	public int getTotalCount() {
		System.out.println("结果数" + userMapper.getTotalCount());
		return userMapper.getTotalCount();
	}


	@Override
	public List<User> query(Map<String, Object> map) {
		Pagination p = (Pagination) map.get("pagination");
		p.setTotalCount(getTotalCount());
		List<User> users = null;
		System.out.println("getOffset: "+p.getOffset()+" PageSize: "+p.getPageSize());
		try {
			 users = userMapper.query(map);
		} catch (Exception e) {
			System.out.println("没有结果" + e);
			log.error("没有结果");
		}
		return users;
	}


	@Override
	public User getById(int id) {
		return userMapper.getById(id);
	}

	
}
