<%--
  Created by IntelliJ IDEA.
  User: yangbodong
  Date: 2017/7/11
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<form action="login" method="post" accept-charset="UTF-8">
    <input type="text" value="" name="user_name"/>
    <input type="password" value="" name="password_content"/>
    <input type="submit" value="登陆" id="login">
    <input type="reset" value="取消">
</form>
<%
    Object obj = request.getAttribute("reason");
    if(obj != null) {
%>
<h3> <%=obj%></h3>
<%
}
%>

</body>
</html>
