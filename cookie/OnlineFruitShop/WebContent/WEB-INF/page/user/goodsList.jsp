<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.henu.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.henu.pagination.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
	<style>
		body {
			margin: 0px;
		    width: 100%;
		    height: 100%;
		}
		a {
			text-decoration: none;
			color:black;
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
		.cate {
		    width: 90%;
		    margin-left: 5%;
		    margin-top: 50px;
		}
		ul.category>li {
		    float: left;
		    width: 5%;
		    cursor: pointer;
		    text-align: center;
		}
		ul.key {
		    margin-left: 1%;
		}
		ul.key>li {
		        float: left;
		    width: 5%;
		    margin-top: 1%;
		    cursor: pointer;
		}
		.pro {
		    width: 90%;
		    margin-left: 5%;
		    border-top: 1px solid #808080;
		    margin-top: 60px;
		}
		.pro li {
			float: left;
		    width: 24%;
		    /* margin-right: 1%; */
		    margin-top: 20px;
		    text-align: left;
		}

		.pro li img {
		    width: 93%;
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
	<%List<Goods> goodsList = (List<Goods>)request.getAttribute("goodsList"); %>
	<%Pagination pagination = (Pagination)request.getAttribute("pagination"); %>
	<div class="header">
		<div class="logo">水果小镇</div>
		<div class="section">
			<div>&nbsp;<a href="../../">首页</a>&nbsp;</div>
			<div>&nbsp;<a href="fruit">鲜果</a>&nbsp;</div>
			<div>&nbsp;<a href="fresh">生鲜</a>&nbsp;</div>
			<div>&nbsp;<a href="gift">礼品</a>&nbsp;</div>
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
		<div class="cate">
			<ul class="category">
				<li style="color:#9ACD32;">产品</li>
				<li><a href="fruit">鲜果</a></li>
				<li><a href="fruit">生鲜</a></li>
				<li><a href="fruit">礼品</a></li>
			</ul>
			<div style="clear:both;"></div>
			<ul class="key">
				<li style="color:#9ACD32;">关键字</li>
				<li>木瓜</li>
				<li>火龙果</li>
				<li>榴莲</li>
				<li>芭乐</li>
				<li>柠檬</li>
				<li>枇杷</li>
				<li>凤梨</li>
				<li>橙子</li>
				<li>苹果</li>
				<li>提子</li>
				<li>芒果</li>
				<li>枣</li>
				<li>柑橘</li>
				<li>蓝莓</li>
				<li>龙眼</li>
				<li>牛油果</li>
				<li>核桃</li>
				<li>梨</li>
				<li>草莓</li>
				<li>甜瓜</li>
				<li>香蕉</li>
				<li>奇异果</li>
				<li>番茄</li>
				<li>龙眼</li>
				<li>葡萄</li>
				                       
			</ul>
		</div>
		<div style="clear:both;"></div>
		<div class="pro">
			<ul style="margin-left: 1%;">
				<%for (Goods goods : goodsList) {%>
					<li>
						<a href="<%=request.getContextPath()%>/goods/detail/<%=goods.getId()%>">
							<img src="" data-original="<%=goods.getThumbnail()%>">
						</a>
						<div>
							<span class="name"><%=goods.getGoodsName() %></span>
							<span class="name">￥<font><%=goods.getPrice() %></font>/kg</span>
							<a href="<%=request.getContextPath()%>/goods/<%=goods.getId()%>">
								<i>买买买</i>
							</a>
						</div>
					</li>
				<%} %>
			<ul>
		</div>
		<div style="clear:both;"></div>

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

</body>
</html>