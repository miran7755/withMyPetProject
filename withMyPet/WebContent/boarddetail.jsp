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
			$.get("boardlistview.do", successFunction);
		});		
		
		$("#adjust").click(function(){
			alert("버튼클릭");
			var post_no = ${post.post_no};
			var subject = "${post.subject}";
			var e_mail = "${post.member.e_mail}";
			var post_date = '${post.post_date}';
			var like_count = ${post.like_count};
			var hate_count = ${post.hate_count};
			var msg = "${post.msg}";
			var img = "${media_tag.img}";
			var video = "${media_tag.video}";
			
			$.get("boardadjust.jsp", {"post_no":post_no, "subject":subject, "e_mail":e_mail, "post_date":post_date, "like_count":like_count, "hate_count":hate_count, "msg":msg, "img":img, "video":video}, successFunction);
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
			<td width="10%">${post.post_no }</td>
			<td width="10%">제목</td>
			<td width="70%" colspan="6">${post.subject }</td>
		</tr>
		<tr>
			<td width="10%">작성자</td>
			<td width="20%">${post.member.e_mail}</td>
			<td width="10%">작성날짜</td>
			<td width="20%"><fmt:formatDate value="${post.post_date }" pattern="yyyy-MM-dd KK:mm:ss"/></td>
			<td width="10%">${post.like_count }</td>
			<td width="10%"><input type="button" id="like" value="좋아요"></td>
			<td width="10%">${post.hate_count }</td>
			<td width="10%"><input type="button" id="hate" value="싫어요"></td>
		</tr>
		<tr>
			<td width="90%" colspan="8">
				<textarea id="content" readonly="readonly" cols="75" rows="6" style="width:100%;">${post.msg }${media_tag.img }${media_tag.video} 
				</textarea>
			</td>
		</tr>
		<jsp:include page="boardreply.jsp"/>
		<jsp:include page="boardreplylist.do"/>
	</table>
	<div class="text-center">
		<c:if test="${sessionScope.loginInfo.e_mail eq post.member.e_mail}">
			<input type="button" id="adjust" value="수정하기">
			<input type="button" id="delete" value="삭제하기">
		</c:if>
		<input type="button" id="back" value="돌아가기">
	</div>
	
	 
	
	
</div>

</body>
</html>