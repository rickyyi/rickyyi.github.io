<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.henu.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.henu.pagination.Pagination" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品管理</title>
	<style>
		body {
			margin: 0 auto;
			height: 100%;
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
		    height: 600px;
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
	<%-- <%User user = (User)session.getAttribute("user");%> --%>
	<%List<Goods> goodsList = (List<Goods>)request.getAttribute("goodsList"); %>
	<div class="header">
		<div class="nav">
			<div class="logo">
				水果小镇-后台管理系统
			</div>
			<div class="tools">
				<span class="welcome">
					欢迎您，<%-- <%=user.getUsername()%> --%>
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
				<input placeholder="请输入关键字"/>
				<select name="key">
					<option value="goodsName">商品名称</option>
					<option value="category">商品类别</option>
				</select>
				<a href="#">查询</a>
			</span>
			<div class="content">
				<table>
					<tr class="tabHeader">
						<td>商品编号</td>
						<td>商品名称</td>
						<td>商品类别</td>
						<td>上架时间</td>
						<td>操作</td>
					</tr>
					<%for(Goods goods : goodsList) {%>
						<tr class="tabBady">
							<td><a href="<%=request.getContextPath()%>/goodsManager/getGoods/<%=goods.getId()%>"><%=goods.getId()%></a></td>
							<td><%=goods.getGoodsName() %></td>
							<td><%=goods.getCategory() %></td>
							<td><%=goods.getCreateTime() %></td>
							<td>
								<a href="<%=request.getContextPath()%>/goodsManager/getGoods/<%=goods.getId()%>">修改</a>
								<a href="<%=request.getContextPath()%>/goodsManager/delete/<%=goods.getId()%>">删除</a>
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