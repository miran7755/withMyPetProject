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
			
			if(obj == "추천"){
				var url = "replylikecount.do";
				var reply_no = $(this).prop("id");
				var post_no = ${post.post_no};
				
				$.get(url, {"reply_no":reply_no, "post_no":post_no}, successFunction);
			}else if(obj == "신고"){
				var reply_no = $(this).prop("id");
				var post_no = ${post.post_no};
				var reported_email = $(this).parent().parent().children().eq(1).html();
				var reporter_email = "${sessionScope.loginInfo.e_mail}";
				
				window.open("report.jsp?reply_no="+reply_no+"&post_no="+post_no+"&reported_email="+reported_email+"&reporter_email="+reporter_email, "신고사유를 작성해주세요.", 'width=300, height=300');				
			}else if(obj == "삭제"){
				var url = "boardreplydelete.do";
				var reply_no = $(this).prop("id");
				var post_no = ${post.post_no};
				
				$.get(url, {"reply_no":reply_no, "post_no":post_no}, successFunction);
			}		
		});
	});
</script>
</head>
<body>
	<c:if test="${replys.size() ne 0 }">
	<div>
		<table class="table table-striped text-center" border="1" cellspacing="0">
			<tr height="30">
				<td width="55%">내용</td>
				<td width="20%">작성자</td>
				<td width="15%">날짜</td>
				<td width="4%">추천수</td>
				<td width="3%">추천</td>
				<td width="3%">신고</td>		
			</tr>
			<c:forEach var="reply" items="${replys}" varStatus="status">
			<tr align="center">
				<td>${reply.msg}${reply.img}</td>
				<td>${reply.reply_email }</td>
				<td><fmt:formatDate value="${reply.reply_date }" pattern="MM-dd KK:mm:ss"/></td>
				<td>${reply.like_count }</td>
				<td width="1%"><input type="button" value="추천" id="${reply.reply_no }"></td>
				<td><input type="button" value="신고" id="${reply.reply_no }"></td>
				<c:if test="${reply.reply_email eq sessionScope.loginInfo.e_mail }">
					<td ><input type="button" value="삭제" id="${reply.reply_no }"></td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
	</div>
	</c:if>
</body>
</html>