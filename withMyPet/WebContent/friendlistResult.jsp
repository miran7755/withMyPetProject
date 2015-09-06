<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="vo.Friend_list" %>
<%@page import="java.util.ArrayList" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <c:set var="fl" value="${requestScope.fl}" />
<c:set var="email" value="${requestParam.email}" />
<c:set var="test" value="${requestScope.email}" />
 --%>
 <c:set var="fl" value="${requestScope.fl }"/>
<html>
<script>
$(document).ready(function(){
	$("input[type=button]").click(function(){
		var obj = $(this).val();
		console.log("삭제할 이메일 : " + $(this).prop("id"));
				
		/* 		parent().parent().children().eq(3).html()); //button의 부모 td의 부모 tr
 	    */
		var e_mail=$(this).prop("id");
		var url="delFriend.do";
	    $.post(url,{"del_email": e_mail}, successFunction);
	    });
	});
</script>

<body>
<%-- <c:out value="${fl}" />나와라 쫌 --%>


				<!-- <ul class="list-nonstyled"> -->
				<table class="table">
					<c:forEach var="f" items="${fl}">
					<tr>
						<td>${f.img}</td>
						<td>${f.nickname}</td>
						<td><input type="button" id="${f.friend_e_mail}" value="삭제 "></td>
						
					</tr>				
					</c:forEach> 
				</table>
					<!-- <li>김미란</li> -->
					<!-- <li>노희석</li> -->
				<!-- </ul> -->
			
</body>

</html>