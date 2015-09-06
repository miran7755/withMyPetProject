<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <c:set var="e_mail" value="${sessionScope.e_mail}" /> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardpost.jsp</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MultiFile.js'></script>
<script>
	$(document).ready(function() {
		$("#write").click(function() {
			var url = "boardpost.do";
			var subject = $("input[name=subject]").val();
			var img = $("input[name=img]").val();
			var video = $("input[name=video]").val();
			var tb_flag = "b";
			var msg = $("#msg").val();

			$.get(url, 
				{"subject" : subject, "img" : img, "video" : video, "tb_flag" : tb_flag, "msg" : msg}, 
				successFunction);
		});
		
		$("#back").click(function(){
			$.get("boardlistview.do", successFunction);
		});
	});
</script>
</head>
<body>
<div>
<h1 class="text-center">지식IN</h1>
<table class="table table-striped text-center" border="1" cellspacing="0">
	<tr>
		<td colspan="2"><input type="text" placeholder="제목을 입력하세요." name="subject" style="width:90%;" required="required" autofocus="autofocus"></td> 
	</tr>
	<tr>
		<td>사진첨부</td>
		<td>동영상첨부 </td>
	</tr>
	<tr>
		<td><input type="file" class="multi" accept="jpg|png" name="img"></td>
		<td><input type="file" class="multi" accept="mp4|avi" name="video"></td>
	</tr>
	<tr> 
		<td colspan="2"><textarea id="msg" class="form-control" placeholder="내용을 입력하세요." rows="3" required/></td> 
	</tr>
	<tr>
		<td><input type="button" id="write" value="글작성하기"></td>
		<td><input type="button" id="back" value="돌아가기"></td>
	</tr>
</table>
</div>
</body>
</html>