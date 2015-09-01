<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="replys" value="${requestScope.replys }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardreplylist.jsp</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#reply_like").click(function(){			
			var url = "replylikecount.do";
			var reply_no = $("#reply_no").val();
			
			$.get(url, {"reply_no":reply_no});
		});
		
		
	});
</script>
</head>
<body>
	<div>
		<table border="1" cellspacing="0">
			<tr>
				<td>내용</td>
				<td>작성자</td>
				<td>날짜</td>
				<td>추천수</td>
				<%-- <c:if test="${replys.reply_email ne null}"> --%>
				<td>추천하기</td>
				<td>신고하기</td>
				<%-- </c:if> --%>
			</tr>
			<c:forEach var="reply" items="${replys}" varStatus="status">
			<tr>
				<td>${reply.msg}</td>
				<td>${reply.reply_email }</td>
				<td><fmt:formatDate value="${reply.reply_date }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
				<td>${reply.like_count }</td>
				<%-- <c:if test="${reply.reply_email ne null}"> --%>
				<td><input type="text" hidden="value" value="${reply.reply_no }" id="reply_no"><input type="button" value="추천하기" id="reply_like"></td>
				<td><input type="button" value="신고하기" id="report"></td>
				<%-- </c:if>		 --%>
				<%-- <c:if test="${reply.reply_email eq sessionScope.email }">
				<td><input type="button" value="삭제하기" id="reply_delete"></td>
				</c:if> --%>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>