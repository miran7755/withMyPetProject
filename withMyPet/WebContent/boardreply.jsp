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
		
		$.post(url, {"post_no":post_no, "reply_email":reply_email, "msg":reply_msg, "img":img});	
	});
});
</script>
</head>
<body>

<div>
	<table border="1" cellspacing="0">
		<tr><td colspan="3">댓글 남기기</td></tr>
		<tr>
			<td>댓글 : <input type="text" id="reply_msg"></td>
			<td>사진첨부 : <input type="file" accept="jpg|png" id="img"><br></td>
			<td><input type="button" value="댓글남기기" id="reply_button"></td>
		</tr>
		
	</table>	 
</div>

</body>
</html>