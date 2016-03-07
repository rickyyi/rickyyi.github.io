<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/style/login.css" />
</head>
<body style="margin:0;padding:0;overflow-x:hidden;overflow-y:hidden" >
<div class="bg"></div>
<section>
  <h1 class="logo"></h1>  
  <fieldset id="login">
    <legend>Admin Login</legend>
    <form id="credentials" class="fm-v clearfix" action="" method="post">
    <input id="username" type="text" name="username" placeholder="Username" required/>
    <input id="password" type="password" name="password" placeholder="Password" required/>
    <input class="btn-submit" name="submit" accesskey="l" value="Login" type="button" />
    </form>
  </fieldset>
</section>
	<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
	<script>
		$("document").ready(function(){
			$(".btn-submit").click(function(){
				var url = location.origin + "/OnlineFruitShop/admin/login";
				var username = $("#username").val();
				var password = $("#password").val();
				if (username != "" && password != "") {
					var formData = $("form").serialize();;
					$.ajax({
						type: "POST",
						url: url,
						data: formData,
						success: function(msg){
							if (msg.code == 200) {
								location = msg.callBack;
							} else if (msg.code == 401) {
								alert(msg.text);
							}
						}
					});
				}
			})
		})
	</script>
</body>
</html>