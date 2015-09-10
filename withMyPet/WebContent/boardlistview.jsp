<%@page import="vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardlistview.jsp</title>
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#write").click(function(){
			$.post("boardpost.jsp", successFunction);
		});
	});
</script>
</head>
<body>
	<h1 class="text-center">지식IN</h1>
	<jsp:include page="searchForm.jsp"/>
	<table class="table table-striped text-center table table-hover" width="650">
		<tr><td>순번</td><td>제목</td><td>작성자</td><td>작성시간</td><td>좋아요</td><td>싫어요</td></tr>
		<c:forEach var="list" items="${requestScope.pb.list }" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td><a href="boarddetail.do?post_no=${list.post_no}">${list.subject }</a></td>
				<td>${list.member.e_mail}</td>
				<td>
				<fmt:formatDate value="${list.post_date }" pattern="yyyy-MM-dd KK:mm:ss"/>
				</td>
				<td align="center">${list.like_count }</td>
				<td align="center">${list.hate_count }</td>
			</tr>
		</c:forEach>
	</table>	
	<c:if test="${ empty param.item || empty param.value }"> 
	<div class="text-center" id="pageGroup">
		<c:set var="currentPage" value="1"/>
		<c:if test="${!empty param.currentPage}">
			<c:set var="currentPage" value="${param.currentPage}"/>
		</c:if>
	
		<c:set var="startPage" value="${pb.startPage}"/>
		<c:set var="endPage" value="${pb.endPage}"/>
		<c:set var="totalPage" value="${pb.totalPage}"/>
		
		<c:if test="${endPage>totalPage}">
			<c:set var="endPage" value="${totalPage}"/>
		</c:if>
		<c:if test="${startPage > 1}">
			[<a href="boardlistview.do?currentPage=${startPage-1}">Prev</a>]
		</c:if>

		<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
			<c:set var="href" value="href='boardlistview.do?currentPage=${status.index}'"/>
				[<a ${currentPage == status.index ? "" : href}>
					${status.index}
				</a>]
				&nbsp;&nbsp;&nbsp;
		</c:forEach>
		<c:if test="${endPage!=totalPage}">
			[<a href="boardlistview.do?currentPage=${endPage+1}">Next</a>]
		</c:if>
		<form class="text-right">
			<input type="button" value="새글쓰기" id="write">
		</form>
	</div>
</c:if>
</body>
</html>