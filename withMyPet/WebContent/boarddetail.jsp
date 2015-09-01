<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="post" value="${requestScope.post }"/>
<c:set var="media_tag" value="${requestScope.media_tag }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boarddetail.jsp</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#like").click(function(){
			var url = "likecount.do";
			var like_count = ${post.like_count};
			var post_no = ${post.post_no}; 
			
			$.get(url, {"post_no":post_no, "like_count":like_count},  successFunction);
		});
		
		$("#hate").click(function(){
			var url = "hatecount.do";
			var hate_count = ${post.hate_count};
			var post_no = ${post.post_no};
			
			$.get(url, {"post_no":post_no, "hate_count":hate_count},  successFunction);
		});
		
		$("#back").click(function(){
			var url = "boardlistview.do";
			
			$.get(url, successFunction);
		});		

	});
</script>
</head>
<body>
<div>
	<table border="1" cellspacing="0">
		<tr>
			<td>${post.post_no }</td>
			<td colspan="5">${post.subject }</td>
		</tr>
		<tr>
			<td>${post.member.e_mail}</td>
			<td><fmt:formatDate value="${post.post_date }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
			<td>${post.like_count }</td>
			<td><input type="button" id="like" value="좋아요"></td>
			<td>${post.hate_count }</td>
			<td><input type="button" id="hate" value="싫어요"></td>
		</tr>
		<tr>
			<td colspan="5">${post.msg } 
							${media_tag.img }
							${media_tag.video }<input type="text" id="msg"></td>
		</tr>
		<tr>
			<c:if test="${sessionScope.e_mail} eq ${post.member.e_mail}">
				<td><input type="button" id="adjust" value="수정하기"></td>
				<td><input type="button" id="delete" value="삭제하기"></td>
			</c:if>
			<td><input type="button" id="back" value="돌아가기"></td>
		</tr>
	</table>
	<jsp:include page="boardreply.jsp"/>
	<jsp:include page="boardreplylist.do"/>
	
</div>

</body>
</html>