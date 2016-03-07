<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.henu.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>用户管理</title>
	<style>
		body {
			margin: 0 auto;
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
		    overflow-y : scroll;
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
		.content>p {
		    margin: 0 auto;
		    width: 50%;
		    text-align: center;
		    font-size: 17pt;
		    font-weight: 200;
		    margin-top: 20px;
		    color: teal;
		    border-bottom: 1px gray solid;
		    margin-bottom: 20px;
		}
		.content>div {
		    width: 70%;
		    margin: 0 auto;
		    border-bottom: 1px gray solid;
		    height: 40px;
		    line-height: 3;
		    font-size: 13pt;
		}
		.content label {
			width: 15%;
		    margin-left: 14%;
		}
		.content span {
			width: 20%;
		    margin-left: 14%;
		}
		.address {
			height : 20% !important;;
		}
		.address>label {
			float : left;
		}
		.address>div {
			margin-left: 44%;
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
				<li>订单管理</li>
				<li>评论管理</li>
				<li>交易分析</li>
			</ul>
		</div>
		<div class="right">
			<span class="search">
				<input placeholder="请输入关键字"/>查询
			</span>
			<%User user = (User)request.getAttribute("user"); %>
			<div class="content">
				<p>您正在查看用户:<%=user.getUsername()%></p>
				<div>
					<label>编号</label>
					<span>1</span>
				</div>
  				<div>
					<label>用户名</label>
					<span><%=user.getUsername()%></span>
				</div>
				<div>
					<label>性别</label>
					<span><%=user.getGender()%></span>
				</div>
  				<div>
					<label>年龄</label>
					<span><%=user.getAge()%></span>
				</div>
				<div>
					<label>注册时间</label>
					<span><%=user.getRegisterTime()%></span>
				</div>
  				<div>
					<label>最后登陆时间</label>
					<span><%=user.getLastUpdateTime()%></span>
				</div>
				<div>
					<label>用户ID</label>
					<span><%=user.getUserId()%></span>
				</div>
  				<div>
					<label>电话</label>
					<span><%=user.getPhone()%></span>
				</div>
				<div class="address">
					<label>收货地址</label>
					<div ><%=user.getAddress()%></div>
				</div>					
			</div>
		</div>
	</div>
	
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>