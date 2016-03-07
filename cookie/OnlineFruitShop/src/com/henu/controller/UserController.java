package com.henu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.henu.model.User;
import com.henu.pagination.Pagination;
import com.henu.service.UserService;

@Controller
@RequestMapping(value="/userManager")
public class UserController {

	@Autowired
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value="/register", method = RequestMethod.POST)
	public void register(@RequestBody User user,BindingResult bindingResult) {

	}
	
	@RequestMapping("/list")
    public String getAdmin(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
    		@RequestParam(value = "keyword", defaultValue = "") String keyword,
    		HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
        if (currentPage < 1) {
            currentPage = 1;
        }

        Pagination pagination = new Pagination();
        pagination.setCurrentPage(currentPage);

        map.put("pagination", pagination);
        map.put("keyword", keyword);
        List<User> users = userService.query(map);
        request.setAttribute("users", users);
        request.setAttribute("pagination", pagination);
        return "user/userManager";
    }
	
	

/*    public String getUser(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Pagination pagination = new Pagination();
        pagination.setCurrentPage(1);
        map.put("pagination", pagination);
        List<User> users = userService.query(map);
        ModelAndView mv = new ModelAndView();
        request.setAttribute("user", users);
    	return "user/userManager";
    }*/
	
	@RequestMapping("/getUser/{id}")
    public String getUser(@PathVariable int id, HttpServletRequest request) {
		User user = userService.getById(id);
		request.setAttribute("user", user);
    	return "user/userDetail";
    }
	
	
}
