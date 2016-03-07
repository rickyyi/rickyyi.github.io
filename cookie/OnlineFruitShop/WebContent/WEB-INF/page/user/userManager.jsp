<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.henu.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.henu.pagination.Pagination" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
	<style>
		body {
			margin: 0 auto;
		}
		a {
			text-decoration: none;
		}
		ul {
			list-style-type: none;
		}
		.header {
    		height: 50px;
    		background: #6D88D2;
		}
		.logo {
		    float: left;
		    line-height: 2;
		    font-size: 24px;
		    margin-left: 40px;
		    color: white;
		}
		.tools {
		    float: right;
		    font-size: 18px;
		    line-height: 3;
		    margin-right: 75px;
		}
		.left {
		    background: #E4E4E4;
		    float: left;
		    height: 602px;
		    width: 14%;
		}
		.menu{
			padding: 0px;
		}
		.menu li {
			    line-height: 2;
			    text-align: center;
			    border: 1px gray solid;
			    background: #B4DCDA;	
		}
		.menu>li {
			    font-size: 17pt;
			    font-weight: 100;
			    font-family: arial;	
		}
		.menu li:hover {
			background: #B4DCDA;
		}
		.menu li ul	{
		    transition: 3s;
		    margin-left: -45px;
		     display:none; 
		}
		.menu li ul	li{
		    background: #CDCDE0;
		    font-size: 13pt;
		}
		.menu li:hover ul {
		    display:block;
		}
		.menu li ul li:hover{
		    background:#6D88D2;
		}
		.right {
		    float: left;
		    width: 86%;
		    height: 596px;
		}
		
		.search {
			float: right;
		    margin-right: 55px;
		    margin-top: 30px;
		}
		.content {
		    margin: 62px auto;
		    background: whitesmoke;
		    width: 90%;
		    border: 1px gray solid;
		}
		
		table {
		    width: 98%;
		    margin-top: 10px;
		    margin-left: 10px;
		    border: 1px black solid;
		    margin-bottom: 10px;
		    border-radius: 5px;
		}
		tr.tabHeader {
		    height: 40px;
		    background: #CDCDE0;
		    text-align: center;
		}
		tr.tabBady {
		    height: 35px;
		    text-align: center;
		}
		.pagination {
		    width: 90%;
		    text-align: center;
		    margin: auto;
		}
	</style>
</head>
<body>
	<div class="header">
		<div class="nav">
			<div class="logo">
				水果小镇-后台管理系统
			</div>
			<div class="tools">
				<span class="welcome">
					欢迎您，管理员
				</span>
				<span class="logout">
					退出
				</span>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="left">
			<ul class="menu">
				<li>用户管理
					<ul>
						<li>管理员</li>
						<li>用户</li>
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/admin/goodsManager/list">商品管理</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/admin/goodsManager/getGoods/0">添加商品</a></li>
						<li><a href="<%=request.getContextPath()%>/admin/goodsManager/list">商品列表</a></li>
					</ul>
				
				</li>
				<li><a href="<%=request.getContextPath()%>/admin/orderManager/list">订单管理</a></li>
				<li>评论管理</li>
				<li><a href="<%=request.getContextPath()%>/admin/tradeAnalysis">交易分析</a></li>
			</ul>
		</div>
		<div class="right">
			<span class="search">
				<input placeholder="请输入关键字"/>查询
			</span>
			<div class="content">
				<table>
					<tr class="tabHeader">
						<td>用户编号</td>
						<td>用户名</td>
						<td>注册时间</td>
						<td>角色</td>
						<td>操作</td>
					</tr>
					<%List<User> users = (List<User>)request.getAttribute("users"); %>
					<%for(User user : users) {%>
						<tr class="tabBady">
							<td><%=user.getId() %></td>
							<td><%=user.getUsername() %></td>
							<td><%=user.getRegisterTime() %></td>
							<td><%=user.getLastUpdateTime() %></td>
							<td>
								<a href="<%=request.getContextPath()%>/userManager/getUser/<%=user.getId()%>">查看详情</a>
							</td>
						</tr>
					<%} %>
					
				</table>
			</div>
			<%Pagination pagination = (Pagination)request.getAttribute("pagination"); %>
			<div class="pagination">
				<span>
				<%if(!pagination.isFirstPage() && pagination.getPageCount() > 1){ %>
					<a id="pre" href="<%=request.getContextPath()%>/userManager/list?currentPage=<%=pagination.getCurrentPage()-1%>">上一页</a><%}else{ %>
					<font>上一页</font>
				<%} %>
					<font id="current"><%=pagination.getCurrentPage() %></font>
					<font>/</font>
					<font id="total"><%=pagination.getPageCount() %></font>
				<%if (!pagination.isLastPage() && pagination.getPageCount() > 1 ) {%>
					<a id="next" href="<%=request.getContextPath()%>/userManager/list?currentPage=<%=pagination.getCurrentPage()+1%>">下一页</a><%}else{ %>
					<font>下一页</font>
				<%} %>
				</span>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
</body>
</html>