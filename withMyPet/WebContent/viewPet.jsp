<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="petlist" value="${requestScope.petlist}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewPet.jsp</title>
</head>

<body>
펫 리스트 보기
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="slider-module">

				<ul class="list-nonstyled">
					<c:forEach var="pl" items="${petlist}">
						<li>${pl.name}</li>


					</c:forEach>
					<!-- <li>김미란</li> -->
					<!-- <li>노희석</li> -->
				</ul>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>