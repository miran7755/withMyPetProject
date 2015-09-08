<%@page import="vo.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>timelineListView.jsp</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#write").click(function(){
			$.post("timelinePost.jsp", successFunction);
		});
	});
</script>
</head>
<body>
	<h1 class="text-center">타임라인</h1>
	<div>
		<jsp:include page="timelinePost.jsp"/>
	</div>
	<c:forEach var="posts" items="${requestScope.posts }" varStatus="status">
	<hr style="border: solid 1px skyblue;">
	<table class="table table-striped text-center" width="650">
		<tr>
			<td>사진</td>
			<td>${posts.member.e_mail}</td>
			<td><fmt:formatDate value="${posts.post_date }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
		</tr>
		<tr>
			<td colspan="3">${posts.msg}</td>
		</tr>
			<c:forEach var="media_tags" items="${requestScope.media_tags }" varStatus="statuss">
			<c:if test="${media_tags.post_no eq posts.post_no && !empty media_tags.img && !empty media_tags.video}">
				<tr><td colspan="3">${media_tags.img}</td></tr>
				<tr><td colspan="3">${media_tags.video}</td></tr>
			</c:if>
			</c:forEach>
		<tr>
			<td>
				좋아요:${posts.like_count }개<input type="button" value="좋아요" id="like">&nbsp;&nbsp;&nbsp;
			</td>
			<td>
				싫어요:${posts.hate_count }개<input type="button" value="싫어요" id="hate">
			</td>	
			<td class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				댓글보기<span class="caret"></span>
				</a>				
				<ul class="dropdown-menu">
				<%-- <c:forEach var="replys" value="${requestScope.replys }" varStatus="status"> --%>
<%-- 이부분은 인클루드하던지 해라 --%>							
					<li role="separator" class="divider"></li>
					<li>
						<input type="text" id="reply_msg" placeholder="댓글을 입력하세요">
						<input type="button" id="reply" value="댓글남기기">
					</li>
					<%-- </c:forEach> --%>	
				</ul>			
			</td>
		</tr>
	</table>	
	</c:forEach>

	
</body>
</html>