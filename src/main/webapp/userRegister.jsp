<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<script  src="./js/jquery-3.2.1.js"></script>
	<script src="./js/jquery.cookie.js"></script>
<title>用户注册页面</title>
</head>
<body>
	<%--<form action="<%=basePath%>/userDisplay.jsp" method="post">--%>
	<form>
	    <h2 align="center">欢迎注册本图书管理网站</h2>
		<table border="1" width="60%" align="center">
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="username" id="uname">
				</td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name="password" id="pwd">
				</td>
			</tr>
			<tr>
				<td>确认密码:</td>
				<td><input type="password" name="password" id="pwd2">
				</td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input type="radio" value="男" name="sex" checked="checked" />男
					<input type="radio" value="女" name="sex" />女</td>
			</tr>
			<tr>
				<td>倾向书籍类别</td>
				<td><input type="checkbox" value="编程" name="hobbies" /> 编程<input
					type="checkbox" value="文学" name="hobbies" checked="checked" />文学 <input
					type="checkbox" value="历史" name="hobbies" />历史<input
					type="checkbox" value="艺术" name="hobbies" checked="checked" />艺术</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" onclick="register()">注册</button>
					<button type="reset">清空</button>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" onclick="back()">返回登录界面</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
<script>
	function back() {
		window.location="index.jsp";
	}
	function register() {
		var uname=$("#uname").val();
		var pwd=$("#pwd").val();
		var user={
			username:uname,
			password:pwd
		};
		console.log(user);
		$.ajax({
			type:"put",
			url:"user/insertUser.action",
			contentType:"application/json",
			data: JSON.stringify(user),
			dataType: "json",
			success:function (data) {
				console.log(data);
				switch (data) {
					case 1:
						alert("注册成功");break;
					case 0:
						alert("该用户名已被使用，请重新注册");
						document.getElementById("uname").value="";
						document.getElementById("pwd2").value="";
						document.getElementById("pwd").value="";
						break;
				}
			},
			error:function (e) {
				console.log(e.responseText)

			}
		});
	}
	function f() {
		var p1=$("#pwd").val();
		var p2=$("#pwd2").val();
		console.log("p1="+p1);
		console.log("p2="+p2);
		if(p1==p2){
			register();
		}else {
			alert("请确认密码");
			document.getElementById("pwd2").value="";
			document.getElementById("pwd").value="";
		}
	}

</script>
