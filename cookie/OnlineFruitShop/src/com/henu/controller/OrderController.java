package com.henu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.henu.model.Order;
import com.henu.model.User;
import com.henu.pagination.Pagination;
import com.henu.service.GoodsService;
import com.henu.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private GoodsService goodsService;
	/*
	 * for admin
	 * */
	@RequestMapping("/admin/orderManager/list")
	public String orderManager(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
    		@RequestParam(value = "keyword", defaultValue = "") String keyword,
    		HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
        if (currentPage < 1) {
            currentPage = 1;
        }

        Pagination pagination = new Pagination();
        pagination.setCurrentPage(currentPage);

        map.put("pagination", pagination);
        map.put("keyword", keyword);
        List<Order> ordersList = orderService.query(map);
        request.setAttribute("ordersList", ordersList);
        request.setAttribute("pagination", pagination);
        return "admin/orderManager";
	}
	/*
	 * for user
	 * */
	@RequestMapping("/buy")
	public @ResponseBody int buy(@RequestParam(value="gid") int gid,
								@RequestParam(value="count") int count,
								HttpSession session){
		int code = 0;
		User user = (User)session.getAttribute("user");
		try {
			Order order = new Order();
			order.setUserId(user.getId());
			order.setGoodsId(gid);
			order.setOrderCount(count);
			order.setOrderStatus("等待发货");
			order.setTotalPrice(goodsService.getById(gid).getPrice()*count);
			orderService.create(order);
			code = 200;
		} catch (Exception e) {
			code = 500;
		}
		return code;	
	}
	
	@RequestMapping("/order")
	public String myorder(HttpSession session, HttpServletRequest request){
		User loginUser = (User)session.getAttribute("user");	
		List<Order> orderList = orderService.findByUserId(loginUser.getId());
		request.setAttribute("orderList", orderList);
		return "user/orderList";
	}
}
