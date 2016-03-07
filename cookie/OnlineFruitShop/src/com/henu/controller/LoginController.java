package com.henu.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.henu.exception.ParameterException;
import com.henu.exception.ServiceException;
import com.henu.model.LoginVO;
import com.henu.model.User;
import com.henu.service.UserService;
import com.henu.util.SessionUtil;

import net.sf.json.JSONObject;

@Controller
public class LoginController<T> extends BaseController{

    private final String DEFAULTURL = "";

    Logger log = Logger.getLogger(LoginController.class);

	@Autowired
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/serviceLogin")
    public String getLoginForUser(){
        return "user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public @ResponseBody Object login(@RequestParam(value = "username") String username,
                      @RequestParam(value = "password") String password,
                      @RequestParam(value = "callback", defaultValue = DEFAULTURL) String callback,
                      HttpSession session){

        JSONObject jsonObject = null ;
        LoginVO loginVO = new LoginVO();

        try {
            User u = userService.login(username,password);
            u.setPassword(null);

            loginVO.setCode(200);
            loginVO.setText("成功");
            loginVO.setUserId(u.getId());
            loginVO.setUsername(u.getUsername());
            loginVO.setCallback(callback);
            jsonObject = JSONObject.fromObject(loginVO);
            this.addSession("user", u);
            session.setAttribute("user", u);
        } catch (ParameterException e) {
            loginVO.setCode(401);
            loginVO.setText("登录验证失败");
            loginVO.setCallback("");
            jsonObject = JSONObject.fromObject(loginVO);
        } catch (ServiceException e) {
        	loginVO.setCode(401);
            loginVO.setText("登录验证失败");
            loginVO.setCallback("");
            jsonObject = JSONObject.fromObject(loginVO);
		}
        return jsonObject;
    }

    @RequestMapping("/logout")
    public String logout() {
    	SessionUtil.removeSession("user");
    	System.out.println("logout");
    	return "redirect:/";
    }
    
    /**
     * Admin Login service
     */
/*    @RequestMapping("/admin/serviceLogin")
    public String getLoginFor(){
        return "admin/login";
    }
    @RequestMapping(value = "/admin/login", method = RequestMethod.POST)
    public @ResponseBody Object ForAdmin(@RequestParam(value = "username") String username,
            @RequestParam(value = "password") String password) {
		LoginVO loginVO = new LoginVO();
    	try {
			User u = userService.login("tom","123");
			u.setPassword(null);
			this.addSession("user", u);
			loginVO.setUsername(u.getUsername());
			loginVO.setCode(200);
			loginVO.setCallback("userManager/list");
		} catch (ParameterException e) {
			
		} catch (ServiceException e) {

		}
    	
    	return loginVO;
    	
    }*/
}
