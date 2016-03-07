<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/static/image/favicon.ico" >
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>水果小镇 - 登录</title>
	<style>
		body{
			margin:0 auto;
			
		}
		.content{
			width:100%;
		}
		.simpleHeader{
			    height: 30px;
			    margin: 0 auto;
			    position: relative;
			    padding-top: 45px;
			    width: 1000px;
		}
		.logo{
			    font-size: 20pt;
			    color: #1EB9EE;
			    font-family: YouYuan;
		}
		#trigger{
			float: right;
    		margin-top: 10px;
		}
		.login-body{
			    text-align: center;
		}
		.login-body form{
			margin: 100px auto 0px;
    		width:343px;
		}
		.username-box input{
			    height: 30px;
			    width: 100%;
			    font-size: 15pt;
		}
		.password-box{
			margin-top: 20px;
		}
		.password-box input{
				height: 30px;
			    width: 100%;
			    font-size: 15pt;
		}
		.login-tool{
			margin-top: 20px;
		}
		.login-btn input{
		    width: 100%;
		    height: 40px;
		    font-size: 20px;
		    border-radius: 3px;
		    cursor: pointer;
		    margin-top: 30px;
		    background-color: rgb(50, 165, 231);
		    color: white;
		    border: 0px;
		}
		.footer{
			text-align:center;
			margin-top: 200px;
			border-top: 1px solid #EDF3F7;
		}
	</style>
</head>
<body>
	<div class="content" id="content">
		<div class="simpleHeader" id="header">
			<a class="logo">水果小镇</a>
			<div id="trigger">
				<a href="" id="toLogin" class="linkAGray">登录</a>
				<span>|</span>
				<a href="" id="toRegister" class="linkAGray">注册</a>
		    </div>
		</div>
		<div class="login-body">
			<form action="login" method="POST">
				<div class="username-box">
					<input type="text" name="username" id="username" placeholder="手机号/邮箱/账号"/>
				</div>
				<div class="password-box">
					<input type="password" name="password" id="username" placeholder="密码"/>
				</div>
				<div class="login-tool">
					<span style="float:left;">
						<input type="checkbox"/>记住登录状态
					</span>
					<span style="float:right;">
						<a href="#" style="color: #00a7ea;">忘记密码</a>
					</span>
					    <input type="hidden" name="callback" id="callback"/>
				</div>
				<div class="login-btn" style="clear: both;">
					<input id="login" type="button" value="登录"/>
				</div>
			</form>
		</div>
		<div class="footer">
			<!-- <div class="footerInner">
				<div class="footerInner">
					<div class="footer-layer1">
						<div class="footer-innerLink">
							<a href="http://www.meizu.com/about.html" target="_blank" title="关于魅族">关于魅族</a>
							<img class="foot-line" src="https://https-res.meizu.com/resources/common/images/default/space.gif">
							<a href="http://hr.meizu.com" target="_blank" title="工作机会">工作机会</a>
							<img class="foot-line" src="https://https-res.meizu.com/resources/common/images/default/space.gif">
							<a href="http://www.meizu.com/contact.html" target="_blank" title="联系我们">联系我们</a>
							<img class="foot-line" src="https://https-res.meizu.com/resources/common/images/default/space.gif">
							<a href="http://www.meizu.com/legalStatement.html" target="_blank" title="法律声明">法律声明</a>
							<img class="foot-line" src="https://https-res.meizu.com/resources/common/images/default/space.gif">
							<a href="javascript:void(0);" id="globalName" class="footer-language" title="简体中文">简体中文&nbsp;&nbsp;&nbsp;</a>
						</div>
						<div class="footer-service">
							<span class="service-label">客服热线</span>
							<span class="service-num">400-788-3333</span>
							<a id="service-online" class="service-online" href="javascript:void(0);" title="在线客服">在线客服</a>
						</div>
						<div class="footer-outerLink">
							<a class="footer-sinaMblog" href="http://weibo.com/meizumobile" target="_blank"><i class="i_icon"></i></a>
							<a class="footer-tencentMblog" href="http://t.qq.com/meizu_tech" target="_blank"><i class="i_icon"></i></a>
							<a id="footer-weChat" class="footer-weChat" href="javascript:void(0);" target="_blank"><i class="i_icon"></i></a>
							<a class="footer-qzone" href="http://user.qzone.qq.com/2762957059" target="_blank"><i class="i_icon"></i></a>
						</div>
						<div id="globalContainer" class="footer-language_menu" style="left: 499.125px; bottom: 89px; display: none;">
							<a href="http://www.meizu.cn" title="简体中文" class="checked">简体中文</a>
							<a href="http://www.meizu.com.hk" title="繁體中文" class="ClobalItem">繁體中文</a>
							<a href="http://en.meizu.com" title="English" class="ClobalItem">English</a>
							<a href="http://ru.meizu.com" title="Русский" class="ClobalItem">Русский</a>
							<a href="http://il.meizu.com" title="עברית" class="ClobalItem" style="border-width:0px;">עברית</a>
						</div>
					</div>
					<div class="clear"></div>
					<div id="flymeCopyright" class="copyrightWrap">
						<div class="copyrightInner">
							<span>©2015 RICKY Telecom Equipment Co., Ltd. All rights reserved.</span>
							<a href="http://www.miitbeian.gov.cn/" class="linkAGray" target="_blank">备案号: 粤ICP备13003602号-4</a> 
							<a href="http://www.res.meizu.com/resources/www/images/icp2.jpg" class="linkAGray" target="_blank">经营许可证编号: 粤B2-20130198</a>
							<a target="_blank" href="http://www2.res.meizu.com/zh_cn/images/common/com_licence.jpg" hidefocus="true" class="linkAGray">营业执照</a>
						</div>
					</div>
				</div> 
			</div> -->
		</div>
	</div>
<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#callback").val(location.search.split("=")[1]);
		$("#login").on("click keyup", function(){
			var url = $("form").attr("action");
			var formData=$("form").serialize();
			$.ajax({
				type: "POST",
				url: url,
				data: formData,
				success: function(msg){
					if (msg.code == 200) {
						location = location.origin+"/OnlineFruitShop/";
					} else if (msg.code == 401) {
						alert(msg.text);
					}
				}
			});
		});
	});
</script>
</body>
</html>