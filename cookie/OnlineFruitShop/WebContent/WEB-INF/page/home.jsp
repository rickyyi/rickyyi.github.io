<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.henu.model.User" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
  <style>
	#allmap{height:800px;}
  </style>
  <title>水果小镇</title>
</head>

<body>
	<!-- <div id="allmap" style="hight:100%;"></div>-->
	用户<%User user = (User)request.getSession().getAttribute("user");%><%=user.getUsername() %>
	<%  %>
	<button type="button" class="login-btn" id="login-btn">登录</button>
	<a href="<%=request.getContextPath()+"/pass/logout"%>">退出</a>
	<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3VjM9r1X7LbGudozYBwRhf4j"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#login-btn").click(function(){
				location.href="pass/serviceLogin?backURL="+encodeURIComponent(location.href);
			});
		});
		var map = new BMap.Map("allmap");    // 创建Map实例
		map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
		map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
		map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
		map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	</script>
</body>
</html>