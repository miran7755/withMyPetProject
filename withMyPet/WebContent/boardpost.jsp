<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="e_mail" value="${sessionScope.e_mail}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardpost.jsp</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script	src='http://jquery-multifile-plugin.googlecode.com/svn/trunk/jquery.MultiFile.js'></script>
<script>
	$(document).ready(function() {
		$("#write").submit(function() {
			var url = "boardpost.do";
			var subject = $("input[name=subject]").val();
			var img = $("input[name=img]").val();
			var video = $("input[name=video]").val();
			var tb_flag = $("input[name=tb_flag]").val();
			var msg = $("input[name=msg]").val();

			$.get(url, 
				{"subject" : subject, "img" : img, "video" : video, "tb_flag" : tb_flag, "msg" : msg}, 
				successFunction);
		});
	});
</script>
</head>
<body>

	<form action="boardpost.do">
		제목 : <input type="text" name="subject"> <br> 
		사진첨부 : <input type="file" class="multi" accept="jpg|png" name="img"><br>
		동영상첨부 : <input type="file" class="multi" accept="mp4|avi" name="video"><br>
		종류 : <input type="text" name="tb_flag"> <br> 
		내용 : <input type="text" name="msg"> <br> 
		<input type="submit" id="write" value="글작성하기">
	</form>

</body>
</html>