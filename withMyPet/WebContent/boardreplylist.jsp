<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="post" value="${requestScope.post }"/>
<c:set var="replys" value="${requestScope.replys }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardreplylist.jsp</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("input[type=button]").click(function(){	
			var obj = $(this).val();
			
			if(obj == "추천하기"){
				var url = "replylikecount.do";
				var reply_no = $(this).prop("id");
				var post_no = ${post.post_no};
				
				$.get(url, {"reply_no":reply_no, "post_no":post_no}, successFunction);
			}else if(obj == "신고하기"){
				var reply_no = $(this).prop("id");
				var post_no = ${post.post_no};
				var reported_email = $(this).parent().parent().children().eq(1).html();
				var reporter_email = "${sessionScope.loginInfo.e_mail}";
				
				window.open("report.jsp?reply_no="+reply_no+"&post_no="+post_no+"&reported_email="+reported_email+"&reporter_email="+reporter_email, "", 'width=300, height=300');				
			}						
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
				<%-- <c:if test="${sessionScope. ne null}"> --%>
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
				<td><input type="button" value="추천하기" id="${reply.reply_no }"></td>
				<td><input type="button" value="신고하기" id="${reply.reply_no }"></td>
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