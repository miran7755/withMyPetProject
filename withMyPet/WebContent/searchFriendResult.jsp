<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.Friend_list" %>
<%@page import="vo.Member" %>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="sf" value="${requestScope.sf }"/>
<script>
$(document).ready(function(){
	$("input[type=button]").click(function(){
		console.log("추가할 이메일 : " + $(this).prop("id")); //button의 부모 td의 부모 tr
	   
		//var e_mail=$(this).parent().parent().children().eq(2).html();
		var e_mail = $(this).prop("id");
		var url="addFriend.do";
	    $.post(url,{"add_email": e_mail}, successFunction);
	    });
	});

</script>
<html>

<body>
	<%-- <ul class="list-nonstyled">

		<li>${friendlist.Member.e_mail }</li>
		<c:forEach var="f" items="${sf}">
			<div>${f.img}</div>
			<div>${f.nickname}</div>
			<div>${f.e_mail }</div>

		</c:forEach>
		<!-- <li>김미란</li> -->
		<!-- <li>노희석</li> -->
	</ul> --%>
	
<!-- <form action="addFriend.do" method="post"> -->	
	<table class="table">
		<tr>
			<th>썸네일 </th>
			<th>닉네임 </th>
			<th>이메일 </th>
			<th>친구추가 </th>
		</tr>

		<c:forEach items="${sf}" var="f">

			<tr>
				<td>${f.img}</td>
				<td>${f.nickname}</td>
				<td>${f.e_mail}</td>
				
				<td><input type="button" id="${f.e_mail}" value="추가"></td>
				
			</tr>


		</c:forEach>

	</table>

</body>

</html>