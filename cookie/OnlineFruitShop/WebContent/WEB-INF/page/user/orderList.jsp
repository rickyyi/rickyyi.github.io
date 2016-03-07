<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.henu.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的订单</title>
	<style>
		body {
			margin: 0px;
		    width: 100%;
		    height: 100%;
		}
		a {
			text-decoration: none;
		}
		li {
			list-style: none;
		}
		.header {
		    height: 30%;
		}
		.header>div {
		    height: 100px;
		    float: left;
		}
		.logo {
		    margin-left: 10%;
		    line-height: 6;
		}
		.section {
		    margin-left: 12%;
		}

		.section>div {
			margin-left: 30px;
		    float: left;
		    line-height: 2;
		    margin-top: 7%;
		    height: 30px;
		    cursor: pointer;
		}
		.section>div:hover {
			background: #EAEAEA;
		}
		.tools {
		    float: right !important;
		    line-height: 6;
		    margin-right: 10%;
		}
		.main {
			min-height: 700px;
		    /*background: #9ACD32;*/
		    clear: both;
		    border-top: 1px #808080 solid;
		}
		.nav {
		    width: 80%;
		    margin: 100px 10%;
		}
		.detail {
		    width: 80%;
		    margin: 0 auto;
		    border: 1px solid #D8D5D5;
		    border-radius: 2px;
		}
		table {
		    width: 90%;
		    margin: 30px auto;
		}
		.detail td {
		    width: 2%;
		    text-align: center;
		    height: 30px;
		}
		tr.cont {
		    background: #EAEAEA;
		    border: 1px solid #ECE1E1;
		}
	</style>
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/jquery-lazyload/1.9.5/jquery.lazyload.js"></script>
	<script>
		$(function() {
		          $("img").lazyload({ 
		          placeholder : "images/loading.gif",
		                 effect: "fadeIn"
		           });  
		      });
	</script>
</head>
<body>
	<%User user = (User)request.getSession().getAttribute("user"); %>
	<%List<Order> orderList = (List<Order>) request.getAttribute("orderList"); %>
	<div class="header">
		<div class="logo">水果小镇</div>
		<div class="section">
			<div>&nbsp;首页&nbsp;</div>
			<div>&nbsp;鲜果&nbsp;</div>
			<div>&nbsp;生鲜&nbsp;</div>
			<div>&nbsp;礼品&nbsp;</div>
			<div>个人中心</div>
		</div>
		<div class="tools">
			<input type="text" value="橙子"/>
			<span>
				<i>搜索</i>
			</span>
		</div>
	</div>
	<div class="main">
		<div class="nav">
			<span>当前位置:</span>
			<span>水果小镇</span>>
			<span>个人中心</span>>
			<span><%=user.getUsername() %>的订单</span>
		</div>
		<div class="detail">
			<table>
				<tr class="title">
					<td>订单号</td>
					<td>商品编号</td>
					<td>下单时间</td>
					<td>订单数量</td>
					<td>订单金额</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
			<%for(Order order : orderList) {%>
				<tr class="title">
					<td><%=order.getId()%></td>
					<td><a href="<%=request.getContextPath()%>/goods/detail/<%=order.getGoodsId()%>" title="查看详情"><%=order.getGoodsId()%></a></td>
					<td><%=order.getCreateTime()%></td>
					<td><%=order.getOrderCount() %><i>kg</i></td>
					<td><%=order.getTotalPrice() %></td>
					<td><%=order.getOrderStatus()%></td>
					<td>
						<a href="#">删除</a>
						<a href="#">评价</a>
					</td>
				</tr>
			<%} %>
			</table>
		</div>
	</div>

</body>
</html>