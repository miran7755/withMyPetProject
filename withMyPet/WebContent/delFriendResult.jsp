<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<title>addFriendResult.jsp</title>
<script>
	alert('${requestScope.msg}');
location.href='${pageContext.request.contextPath}/main.jsp';
</script>
</head>
<body>


</body>
</html>