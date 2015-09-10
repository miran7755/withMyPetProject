<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="post" value="${requestScope.post }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardreply.jsp</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#reply_button").click(function(){
		var url = "boardreply.do";
		var post_no = ${post.post_no};
		var reply_email = "${post.member.e_mail}";
		var reply_msg = $("#reply_msg").val();
		var img = $("#img").val();
		
		$.post(url, {"post_no":post_no, "reply_email":reply_email, "msg":reply_msg, "img":img}, successFunction);	
	});
});
</script>
</head>
<body>
<div>
	<table class="table table-striped text-center" border="1" cellspacing="0">
		<tr>
			<td>댓글 남기기</td>
			<td><input type="file" accept="jpg|png" id="img"><br></td>
			<td><input type="button" value="댓글남기기" id="reply_button"></td>
		</tr>
		<tr>
			<td colspan="3" style="border: 1px solid;">
    			<textarea id="reply_msg" placeholder="댓글을 입력하세요." name="content" cols="75" rows="3" style="width:100%;" required></textarea>
   			</td>
   		</tr>
	</table>
		
	<!-- <TEXTAREA  id="reply_msg"  COLS=70 ROWS=3 required>댓글을 입력하세요.</TEXTAREA> -->
			<!-- <td colspan="3">댓글 : <input size="81" autocomplete="off" style="height:30px;" type="text" id="reply_msg" required></td> -->
		
		 
</div>
</body>
</html>