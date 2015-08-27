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
//location.href="/main.jsp";
location.href='${pageContext.request.contextPath}/main.jsp'; <%--/web12경로로 리다이렉션 설정 --%>
                                           <%--/web12의 welcome file페이지로 이동 --%>
</script>
</head>
<body>


</body>
</html>