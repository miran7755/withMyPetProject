<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="hi" value="${requestScope.hi}"/>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

window.alert('${hi}');
</script>
</head>
<body>
	<p>Hello.jsp</p>
	<c:out value="${hi }"></c:out>
</body>
</html>