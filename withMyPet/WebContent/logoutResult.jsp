<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<title>signupResult.jsp</title>
<script>
window.alert('${requestScope.msg}');
//location.href="loginForm.html";
location.href='${pageContext.request.contextPath}';
</script>
</head>
<body>
<%-- <% String msg = (String)request.getAttribute("msg");
out.print(msg);%>
 --%>



</body>
</html>