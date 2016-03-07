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
<title>用户管理</title>
	<style>
		body {
			margin: 0 auto;
			height: 100%;
		}
		a {
			text-decoration: none;
			color:black;
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
		.main {
			height: 100%;
			background: red;
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
		.content>form{
		    width: 50%;
		    margin: 0 auto;
		}
		form>div {
		    margin-top: 6%;
		}
		form>div>label {

		}
		form>div>input {
		    margin-right: 34%;
		    float: right;
		    height: 25px;
		    border-radius: 2px;
		    border: none;
		}
		form>div>input {
		    margin-right: 34%;
		    float: right;
		    height: 25px;
		    border-radius: 2px;
		    border: none;
		}
		form>div>textarea {
		        float: right;
			    width: 65%;
			    border-radius: 2px;
			    border: none;
			    height: 120px;
		}
		.submit {
			    height: 48px;
		}
		.submit>input{
			width: 30%;
		    height: 32px;
		    font-size: 14pt;
		    background: #6D88D2;
		}
	</style>
</head>
<body>
	<%Goods goods = (Goods)request.getAttribute("goods"); %>
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
				<li><a href="<%=request.getContextPath()%>/admin/tradeAnalysis">交易分析</a></li>
			</ul>
		</div>
		<div class="right">
			<span class="search">
				<input placeholder="请输入关键字"/>查询
			</span>
			<div class="content">
				<%if (goods.getId()>0) {%>
					<p>修改商品</p>
				<%} else { %>
					<p>添加商品</p>
				<%} %>
				
				<form action="<%=request.getContextPath()%>/goodsManager/editGoods" method="POST">
					<input type="hidden" value="<%=goods.getId()%>" name="id">
					<div class="#">
						<label>商品名称</label>
						<input type="text" name="goodsName" value=<%=goods.getGoodsName()%>>
					</div>
					<div class="">
						<label>商品类别</label>
						<select name="category" >
							<option value="fruit">鲜果</option>
							<option value="fresh">生鲜</option>
							<option value="gift">礼品</option>
						</select>
						
						<%-- <input type="text" name="category" value=<%=goods.getCategory()%>> --%>
					</div>
					<div class="">
						<label>单价</label>
						<input type="text" name="price" value=<%=goods.getPrice()%>>
					</div>
					<div class="">
						<label>库存</label>
						<input type="text" name="stock" value=<%=goods.getStock()%>>
					</div>
					<div class="">
						<label>商品图片</label>
						<textarea name="imageList"><%=goods.getImageList()%></textarea>
					</div>
					<div class="" style="margin-top: 30%;">
						<label>缩略图</label>
						<input type="text" name="thumbnail" value=<%=goods.getThumbnail()%>>
					</div>
					<div class="">
						<label>商品描述</label>
						<input type="text" name="introduction" value="<%=goods.getIntroduction()%>" style="margin-right: 0%;width: 67%;">
					</div>
					<div class="submit">
						<input type="submit" value="提交">
					</div>
				</form>	
			</div>	
		</div>
	</div>
</body>
</html>