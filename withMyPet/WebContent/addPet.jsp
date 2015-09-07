<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="msg" value="${requestScope.msg}"/>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>addPet.jsp</title>
<script>

window.alert('${msg}');
</script>
</head>
<body>
	<p>펫 추가 결과 :</p>
	
	<c:out value="${msg }"></c:out>
</body>
</html>