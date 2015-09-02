<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		//메뉴용 a태그를 클릭했을때 이벤트처리
		$(document).on("click", "a", function(event){
		//$("a").click(function(event){
			event.preventDefault(); //a태그의 기본이벤트(url요청하기) 막기
			var url = $(this).prop("href");
			if(url.trim() != ""){
				//url을 get방식으로 요청한 후 응답되면 successFunction함수를 호출하라
				$.get(url, successFunction);
			}
		});
	});
	
	function successFunction(responseData){
		$("article").html(responseData);
	}
</script>
</head>
<body>
	<div>
		<header>
			<nav>index 입니다.</nav>
		</header>
		<article>
			<a href="addpet.do">펫 추가하기</a> <a href="boardpost.jsp">게시판에글쓰기</a>
		</article>
		<footer>은행</footer>
	</div>
</body>
</html>