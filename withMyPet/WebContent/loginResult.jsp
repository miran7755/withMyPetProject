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
//location.href="list.do";
location.href='${pageContext.request.contextPath}'; <%--/web12경로로 리다이렉션 설정 --%>
                                           <%--/web12의 welcome file페이지로 이동 --%>
</script>
</head>
<body>


</body>
</html>