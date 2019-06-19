<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>注册成功页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
    <style>
        [type="button"]{
        width:20%;
        height:40px;
        margin-top:20px;
        text-indent:50px;
            padding-left:5px;
       }
    </style>
</head>
<body  >
    <h2>注册成功啦，恭喜！！！</h2>
	<%
      request.setCharacterEncoding("utf-8");
      //获取请求参数信息
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String sex = request.getParameter("sex");
      String[] hobbies = request.getParameterValues("hobbies");
     %>
     用户名：<%=username %><br>
     密码：<%=password%><br>
     性别： <%=sex%><br>
  <% out.println("倾向书籍类型：");
      for(int i=0;i<hobbies.length;i++){
        out.println(hobbies[i]+"&nbsp;");
      }
  %><br>

    <input type="button" name="register" onclick="back()"  value="返回主页面">
</body>
</html>
<script language="JavaScript">
function back() {
window.location="index.jsp";
}
</script>