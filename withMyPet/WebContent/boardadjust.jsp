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
			var post_no = ${param.post_no};
			var subject = $("#subject").val();
			var msg = $("#content").val();
			var tb_flag = "b";
			
			$.get("boardadjust.do", {"post_no":post_no, "subject":subject, "msg":msg, "tb_flag":tb_flag}, successFunction);
		});
			
		$("#back").click(function(){
			$.get("boardlistview.do", successFunction);
		});	
	});
	
	FormNotice.reply.focus();
	FormNotice.reply.value = FormNotice.reply.value;
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
			<td width="70%" colspan="6">
				<textarea id="subject" cols="40" rows="1" style="width:100%;" required>${param.subject }</textarea>		
			</td>
		</tr>
		<tr>
			<td width="10%">작성자</td>
			<td width="20%">${sessionScope.loginInfo.e_mail}</td>
			<td width="10%">작성날짜</td>
			<td width="20%">${param.post_date }</td>
			<td width="10%">${param.like_count }</td>
			<td width="10%"><input type="button" id="like" value="좋아요"></td>
			<td width="10%">${param.hate_count }</td>
			<td width="10%"><input type="button" id="hate" value="싫어요"></td>
		</tr>
		<tr>
			<td width="90%" colspan="8">
			<form name="FormNotice">
				<textarea id="content" cols="75" rows="6" style="width:100%;" required>${param.msg }${param.img }${param.video}
				</textarea>				
			</form>
			</td>
		</tr>
	</table>
	<div class="text-center">
		<input type="button" id="adjust" value="수정하기">
		<input type="button" id="back" value="돌아가기">
	</div>	
</div>

</body>
</html>