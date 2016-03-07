package com.henu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.henu.model.User;

@Component("userMapper")
public interface UserMapper {
    public void create(User user);

    public void delete(@Param("id") int id);

    public void update(Map<String, Object> map);

    public User getByName(@Param("username") String username);

    public User getById(@Param("id") int id);

    public int getTotalCount();

    public List<User> query(Map<String, Object> map);
}
