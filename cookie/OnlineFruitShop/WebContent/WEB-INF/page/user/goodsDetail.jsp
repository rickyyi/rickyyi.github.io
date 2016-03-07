<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.henu.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.henu.pagination.*" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品详情</title>
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
			border-bottom: 1px solid gray;
		}
		.header {
		    height: 100px;
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
		    margin-top: 5%;
		    background: yellow;
		    width: 16%;
		    margin-left: 10%;
		    margin-bottom: 1%;
		}
		.detail {
		    width: 80%;
		    margin: 0 auto;
		    background: #32BECD;
		}
		.thumbnail {
		    background: #E4E4E4;
		    height: 500px;
		    width: 500px;
		    float: left;
		}
		.info {
		    /*background: #D8BFD8;*/
		    margin-left: 4%;
		    float: left;
		    width: 48%;
		}
		h2 {
			opacity: 0.8;
		}
		.info>div {
		    margin-top: 60px;
		}
		.info>div>font {
		    color: #43C323;
		    font-family: serif;
		}
		.info>div>span {
		    margin-left: 9%;
		}
		input[type="submit"] {
		    height: 40px;
		    width: 33%;
		    border: 1px #F4F3EE solid;
		    border-radius: 7px;
		    font-size: 24px;
		    color: #008080;
		    margin-left: 20%;
		    cursor: pointer;
		}
		input[type="submit"]:hover{
				background: #AFAFAA;	
		}
		.buyCount>span>font:hover {
			color: red;
			cursor: pointer;
		}
		.pull-left {
			    width: 34px;
    			text-align: center;
		}
		.comment {
		    clear: both;
		    /*background: #CED4C2;;*/
		    width: 80%;
		    margin-left: 10%;
		    min-height: 50px;
		    margin-top: 90px;
		}
		.title {
		    height: 40px;
		    background: #DCDCD5;
		    font-size: 16pt;
		    line-height: 2;
		    /* margin-left: 1%; */
		}
		.title>span{
			display: block; 
		    background: #DCDCD5;
		    height: 40px;
		    width: 12%;
		    float: left;
		    text-align: center;
		}
		.title>span:hover{
			background: #F7F7F7 !important;
			cursor: pointer;
		}
		.left {
			float: left;
			height: 133px;
		}
		.right {
    		height: 133px;
    		padding-top: 3px;

		}
		.right>p{
			    margin-left: 11%;
			        width: 87%
		}
		.img>img{
			width: 100%;
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
	<%Goods goods = (Goods)request.getAttribute("goods"); %>
	<div class="header">
		<div class="logo">水果小镇</div>
		<div class="section">
			<div>&nbsp;<a href="../../">首页</a>&nbsp;</div>
			<div>&nbsp;<a href="../list/fruit">鲜果</a>&nbsp;</div>
			<div>&nbsp;<a href="../list/fresh">生鲜</a>&nbsp;</div>
			<div>&nbsp;<a href="../list/gift">礼品</a>&nbsp;</div>
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
			<a>首页</a>>
			<a>全部鲜果</a>>
			<a>墨西哥牛油果</a>
		</div>
		<div class="detail">
			<div class="thumbnail">
				<img style="height: 500px;" data-original="<%=goods.getThumbnail() %>" src="">
			</div>
			<div class="info">
				<h2><%=goods.getGoodsName() %></h2>
				<div class="price">
					<font>果园价</font>
					<span>￥<%=goods.getPrice() %></span>
				</div>
				<div class="stock">
					<font>库&nbsp;存</font>
					<span><%=goods.getStock()%>kg</span>
				</div>
				<div class="buyCount">
					
					<font>数&nbsp;量</font>
					
					<span>
						<font id="minus">-</font>
							<input class="pull-left" id="count" type="tel" value="1" disabled="disabled">
						<font id="plus">+</font>
					</span>
				</div>
				<div class="totalPrice">
					<font>总&nbsp;价</font>
					<span>
						￥<%=goods.getPrice() %>
					</span>
				</div>
				<div class="">
					<input type="hidden" id="gid" value="<%=goods.getId()%>">
					<input type="submit" value="立即购买"/>
				</div>
			</div>
		</div>
		<div class="clear" style="clear:both;"></div>
		<div class="comment">
			<div class="title">
				<span>商品简介</span>
				<span>顾客评论(10)</span>
			</div>
			<div class="content" style="display:none;">
				<ul style="margin-left: -2%;">
					<li style="border-bottom: 1px #808080 solid;">
						<div class="left">
							<img src="http://cdn.fruitday.com/up_images/default_userpic.png">
							<p>13122868630</p>
						</div>
						<div class="right">
							<p style="max-height: 72px;overflow: hidden;word-wrap: break-word;">内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！内容 牛油果味道不错！配煎蛋味道美美哒！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<img src="http://cdn.fruitday.com/up_images/default_userpic.png">
							<p>13122868630</p>
						</div>
						<div class="right">
							<p>内容 牛油果味道不错！配煎蛋味道美美哒！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<img src="http://cdn.fruitday.com/up_images/default_userpic.png">
							<p>13122868630</p>
						</div>
						<div class="right">
							<p>内容 牛油果味道不错！配煎蛋味道美美哒！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<img src="http://cdn.fruitday.com/up_images/default_userpic.png">
							<p>13122868630</p>
						</div>
						<div class="right">
							<p>内容 牛油果味道不错！配煎蛋味道美美哒！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<img src="http://cdn.fruitday.com/up_images/default_userpic.png">
							<p>13122868630</p>
						</div>
						<div class="right">
							<p>内容 牛油果味道不错！配煎蛋味道美美哒！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<img src="http://cdn.fruitday.com/up_images/default_userpic.png">
							<p>13122868630</p>
						</div>
						<div class="right">
							<p>内容 牛油果味道不错！配煎蛋味道美美哒！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<img src="http://cdn.fruitday.com/up_images/default_userpic.png">
							<p>13122868630</p>
						</div>
						<div class="right">
							<p>内容 牛油果味道不错！配煎蛋味道美美哒！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
					<li>
						<div class="left">
							<img src="http://cdn.fruitday.com/up_images/default_userpic.png">
							<p>13122868630</p>
						</div>
						<div class="right">
							<p>内容 牛油果味道不错！配煎蛋味道美美哒！</p>
							<p>2016-02-24 09:53:29</p>
						</div>
					</li>
					<div style="clear:both;"></div>
				</ul>
			</div>
			<%String[] img = goods.getImageList().split(";"); %>
			<div class="img">
				<% for(int i=0; i<img.length; i++) {%>
							<img src="" data-original="<%=img[i]%>" >
				<%} %>

			</div>
		</div>
	</div>
	<div class="footer">
		
	</div>
	<script type="text/javascript">
	$(function(){
		$("document").ready(function(){
			$(".totalPrice>span").text($(".price>span").text());
		})
		$("#minus").click(function(){
			var count = $("#count").val();
			var stock = parseInt($(".stock>span").text().split("kg")[0]);
			var price = parseInt($(".price>span").text().split("￥")[1]);
			if (count <=1) {
				$(this).css("cursor", "no-drop");
				
			} else {
				count = count -1;
				$("#count").val(count);
				$(this).css("cursor", "pointer");
				$("#plus").css("cursor", "pointer");
				$(".totalPrice>span").text("￥"+count*price);
			}
		});
		$("#plus").click(function(){
			var count = parseInt($("#count").val());
			var stock = parseInt($(".stock>span").text().split("kg")[0]);
			var price = parseInt($(".price>span").text().split("￥")[1]);
			if (count >= stock) {
				$(this).css("cursor", "no-drop");
			} else {
				count = count + 1;
				$("#count").val(count);
				$(this).css("cursor", "pointer");
				$("#minus").css("cursor", "pointer");
				$(".totalPrice>span").text("￥"+count*price);
			}
		});
		$("input[type=\"submit\"]").click(function(){
			var buyCount = $("#count").val();
			var gid = $("#gid").val();
			var url = location.origin + "/OnlineFruitShop/buy?gid="+gid+"&count="+buyCount;
			$.get(url,function(data){
				if (data == 200) {
					if (confirm("订单提交成功，查看订单？")==true){
						alert("跳转查看订单")
					} else {
						window.location.reload();
					}
				}

			})
		})
		$(".title>span").click(function(){
		    if ($(this).text()=="商品简介") {
		    	$(this).css("background", "#F7F7F7");
		    	$(this).siblings("span").css("background", "#DCDCD5");
		    	$(".img").css("display","block");
		   		$(".content").css("display", "none");
		   } else {
		   		$(this).css("background", "#F7F7F7");
		    	$(this).siblings("span").css("background", "#DCDCD5");
		   		$(".content").css("display","block");
		   		$(".img").css("display", "none");
		   }
		})
	})
	</script>
</body>
</html>