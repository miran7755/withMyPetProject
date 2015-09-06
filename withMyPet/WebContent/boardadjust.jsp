<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardadjust.jsp</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#adjust").click(function(){
			var post_no = ${post.post_no};
			var subject = ${post.subject};
			var msg = ${post.msg};
			
			$.get("boardadjust.jsp", {"post_no":post_no, "subject":subject, "msg":msg}, successFunction);
		});
		
		$("#delete").click(function(){
			var post_no = ${post.post_no};
			$.get("boarddelete.do", {"post_no":post_no}, successFunction);
		});		
	});
</script>
</head>
<body>
<div>
	<h1 class="text-center">지식IN</h1>
	<table class="table table-striped text-center" border="1" cellspacing="0">
		<tr>
			<td width="10%">글번호</td>
			<td width="10%">${param.post_no }</td>
			<td width="10%">제목</td>
			<td width="70%" colspan="6">${param.subject }</td>
		</tr>
		<tr>
			<td width="10%">작성자</td>
			<td width="20%">${param.member.e_mail}</td>
			<td width="10%">작성날짜</td>
			<td width="20%"><fmt:formatDate value="${param.post_date }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
			<td width="10%">${param.like_count }</td>
			<td width="10%"><input type="button" id="like" value="좋아요"></td>
			<td width="10%">${param.hate_count }</td>
			<td width="10%"><input type="button" id="hate" value="싫어요"></td>
		</tr>
		<tr>
			<td width="90%" colspan="8">
				<textarea id="msg">
					${param.msg } 
					${param.img }
					${param.video} 
				</textarea>				
			</td>
		</tr>
	</table>
	<div class="text-center">
		<input type="button" id="adjust" value="수정하기"></td>
		<input type="button" id="back" value="돌아가기"></td>
	</div>	
</div>

</body>
</html>