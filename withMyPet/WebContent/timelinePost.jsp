<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
			var url = "timelinePost.do";
			var img = $("input[name=img]").val();
			var video = $("input[name=video]").val();
			var tag_name = $("#tag_msg").val();
			var tb_flag = "t";
			var msg = $("#msg").val();

			$.get(url, 
				{"tag_name" : tag_name, "img" : img, "video" : video, "tb_flag" : tb_flag, "msg" : msg}, 
				successFunction);
		});		
	});
</script>
</head>
<body>
<div>
<table class="table table-striped text-center" border="1" cellspacing="0" width="650">
	<tr> 
		<td colspan="4">
			<textarea id="msg" class="form-control" placeholder="친구들에게 소식을 전하세요." rows="3" required="required" autofocus="autofocus"></textarea>
		</td> 
	</tr>
	<tr>
		<td>사진 첨부<input type="file" class="multi" accept="jpg|png" name="img"></td>
		<td>동영상 첨부<input type="file" class="multi" accept="mp4|avi" name="video"></td>
	</tr>
	<tr>	
		<td>
			태그하기<input type="text" id="tag_msg">
		</td>
		<td><input type="button" id="write" value="글작성하기"></td>
	</tr>
</table>
</div>
</body>
</html>