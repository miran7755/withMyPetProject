<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <c:set var="petlist" value="${requestScope.petlist}" /> --%>

<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>viewPet.jsp</title>
</head>
<script>
$(document).ready(function(){
	//alert("kkkk");
	$("input[type=button]").click(function(){
		
		var petNo= $(this).prop("id");
		alert("펫 삭제");
		$.post("deletepet.do",{
			"petNo" :petNo
		},successFunction); /* function(resultData){
			$("#result").html(resultData);
		});	 */	
		
		
		
		/*
		function(resultData) {
				$("#result").html(resultData)
		*/
		
	});
});
</script>
<body>
<div id="result">
<div class="container" >
펫 리스트 보기
	<table>
		<c:forEach var="pl" items="${requestScope.petList}">
			<tr><td>  ${pl.img } ${pl.name} ${pl.gender} ${pl.birthdate} 
						<input type="button" name="deletePetBtn" id="${ pl.pet_no }"value="삭제">
						<input type="hidden" id="petno" value="${pl.pet_no}">
			</td></tr>
					
		</c:forEach>
		<tr><td></td>
		</tr>
	
	</table>
<%-- 	<div class="row">
		<div class="col-md-12">
			<div class="slider-module">
				<ul class="list-nonstyled" >
				<c:out value="${petlist}"/>
					<c:forEach var="pl" items="${petlist}">
						<li>  ${pl.img } ${pl.name} ${pl.gender} ${pl.birthdate} 
						<input type="button" name="deletePetBtn" id="${ pl.pet_no }"value="삭제">
						<input type="hidden" id="petno" value="${pl.pet_no}">
						
						</li>
					</c:forEach>
					<!-- <li>김미란</li> -->
					<!-- <li>노희석</li> -->
				</ul>
				
			</div>
		</div>
	</div>
 --%></div>
</div>
</body>
</html>