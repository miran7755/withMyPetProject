<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<title>signupResult.jsp</title>
<script>
window.alert('${ requestScope.msg}');
</script>


<c:choose>
<c:when test="${empty sessionScope.loginInfo}">
<script>
location.href = '${pageContext.request.contextPath}/index2.jsp';
</script>
</c:when>
<c:otherwise>
<script>
location.href = '${pageContext.request.contextPath}/main.jsp';
</script>
</c:otherwise>

</c:choose>

</head>
</html>