<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Pragma" content="no-cache">
<title>signupResult.jsp</title>
<script>
<%--window.alert('<%=request.getAttribute("msg")%>');
location.href="productList.do";
--%>

window.alert('${requestScope.msg}');
//location.href="productlist.do";
location.href='${pageContext.request.contextPath}/index.jsp';

</script>
</head>
<body>
<%-- <% String msg = (String)request.getAttribute("msg");
out.print(msg);%>
 --%>



</body>
</html>