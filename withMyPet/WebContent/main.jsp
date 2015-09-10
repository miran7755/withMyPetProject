<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="loginInfo" value="${sessionScope.loginInfo}" />
<!DOCTYPE html>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- /.website title -->
<title>With My Pet</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<!-- CSS Files -->
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet" media="screen">
<link href="css/owl.theme.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">

<!-- Colors -->
<link href="css/css-index.css" rel="stylesheet" media="screen">
<!-- <link href="css/css-index-green.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-purple.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-red.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-orange.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-yellow.css" rel="stylesheet" media="screen"> -->

<!-- Google Fonts -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />

</head>
<script>

	window.fbAsyncInit = function() {
		FB.init({appId : '697333240402235',
				xfbml : true,
				cookie : true,
				version : 'v2.4'
				});
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			FB.api('/me?fields=id,name,email',function(user) {
				if (user) {
					var image = document.getElementById('image');
					image.src = 'http://graph.facebook.com/'+ user.id + '/picture';
					console.log("user.email : "	+ user.email);
					var email = document.getElementById('email');
					var emailVal = user.email;
					$.post("fbSignupLogin.do", 
						   {"n_email" : user.email, "n_nickname" : user.name, "n_pwd" : "fb"});
					$.post("friendlist.do", "email="+ emailVal,	function(resultData) {
						$("#friendlist").html(resultData);
					});
				}
			});
		} else if (response.status === 'not_authorized') {	
			}			
		}, {scope : 'email'});
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function signinCallback(authResult) {
		if (authResult['access_token']) {

		} else if (authResult['error']) {

		}
	}

	(function(d) {
		var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement('script');
		js.id = id;
		js.async = true;
		js.src = "//connect.facebook.net/ko_KR/all.js";
		ref.parentNode.insertBefore(js, ref);
	}(document));

	function showUserInfo(id) {
		FB.api({method : 'fql.query', query : 'SELECT name, pic_square FROM user WHERE uid='+ id},
			function(response) {document.getElementById('userInfo').innerHTML += ('<img src="' + response[0].pic_square + '"> ' + response[0].name);
			});
		}

	};

$(document).ready(function() {
	$.post("timelineListView.do", successFunction);
	
 	$(document).on("click", "a", function(event) { 
		event.preventDefault(); 
		var url = $(this).prop("href");

		if (url.trim() != "") {
			$.get(url, successFunction);
		}
	}); 
	
	$("#search").submit(function(event) {
		event.preventDefault();
		$.post("friendsearch.do", $(this).serialize(), successFunction);
		});
	
	
	$("#petSignUpBtn").click(function(event) {
		event.preventDefault();
		var petName = $("#petName").val();
		var animalCode = $("#animalName").val();
		var gender = $(":input:radio[name=gender]:checked").val();
		var image = $("#imagePath").val();
		var birthdate = $("#birthdate").val();
		console.log(petName);
		console.log(animalCode);
		console.log(image);
		$.post("addpet.do", {
			"petName" : petName,
			"animalCode" : animalCode,
			"gender" : gender,
			"image" : image,
			"birthdate" : birthdate

		});
		alert("pet 등록");
	});
});
	
	function successFunction(responseData) {
		$("#aaa").html(responseData);
	};
	

</script>

<body data-spy="scroll" data-target="#navbar-scroll">
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.4&appId=697333240402235";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<!-- /.preloader -->
	<div id="preloader"></div>
	<div id="top"></div>


	<!-- NAVIGATION -->
	<div id="menu">
		<nav class="navbar-wrapper navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-backyard">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand site-name" href="#top"><img
						src="images/logo2.png" alt="logo"></a>
				</div>

				<div id="navbar-scroll"
					class="collapse navbar-collapse navbar-backyard navbar-left">
					<form class="navbar-form navbar-left" role="search" id="search">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search" name="search_email">
							</div>
							<button type="submit" >Submit</button>
						</form> 
					<ul class="nav navbar-nav">
						<li><a href="timelineListView.do">타임라인</a></li>
						<li><a href="boardlistview.do">지식in</a></li>
						<li><a href="#download"></a></li>
					</ul>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><img id="image"></li>

					<!-- <li> <div id="id"></div></li> -->
					<!-- <li> <div id="name"></div></li> -->
					<!-- <li> <div id="email"></div></li> -->
					<li>
						<div>${sessionScope.loginInfo.e_mail}</div>

					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원정보 
						<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a data-toggle="modal" data-target="#myModal">Pet등록</a></li>
							<li><a href="viewpet.do">나의 Pet 보기</a></li>
							<li><a href="#">회원정보 수정</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout.do">Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</div>


	<div class="row">
		<div class="col-sm-8 blog-main">

			<div class="blog-post">
				<!-- <h2 class="blog-post-title">Timeline 노출되는 부분</h2> -->
				<div id="aaa">
					<div align="left">
						<img id="image" />
						<div id="name"></div>
						<div id="id"></div>
						<!-- <div id="email"></div> -->
						<div id="birthday"></div>


					</div>
					<%-- <jsp:include page="searchFriendResult.jsp" /> --%>
				</div>
			</div>
		</div>

		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
			<div class="sidebar-module sidebar-module-inset">
				<h4>Side Bar 노출 부분</h4>
				<p>
					Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras
					mattis consectetur purus sit amet fermentum. Aenean lacinia
					bibendum nulla sed consectetur.
				</p>
			</div>
			<div class="sidebar-module">
				<h4>Friends List</h4>
				<div id="friendlist">


				<!-- <ol class="list-unstyled" id="friendlist"> -->
					<!-- <li><a href="#">Noh heeseok</a></li> -->
					<!-- <li><a href="#">Pack gyerae</a></li> -->
					<jsp:include page="friendlistResult.jsp" />

				<!-- </ol> -->
				</div>
			</div>
			<div class="sidebar-module">
				<h4>Elsewhere</h4>
				<ol class="list-unstyled">
					<li><a href="#">GitHub</a></li>
					<li><a href="#">Twitter</a></li>
					<li><a href="#">Facebook</a></li>
				</ol>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- <div class="modal bootstrap-dialog"> -->

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Pet 등록</h4>
				</div>
				<div class="modal-body">
					<div id="register" class="animate form">
						<form action="hello.do" autocomplete="off">
							<%-- <h1>Sign up</h1> --%>
							<div>
								<label for="petName" class="uname">Pet 이름 </label> <input
									id="petName" class="form-control" name="petName"
									required="required" type="text" placeholder="Pet이름을 등록하세요." />
							</div>
							<p>

								<!-- Single button -->
							<div class="btn-group">
								pet종류 <select id="animalName">
									<option value="1">개</option>
									<option value="2">고양이</option>
									<option value="3">앵무새</option>

								</select>

							</div>



							<!-- <label for="petSearch" class="youmail"></label> <input
								id="kindName" name="kindName" required="required"
								class="form-control" type="text" placeholder="마우스를 클릭해서 검색해주세요."
								data-toggle="modal" data-target="#kindSearchPopup" disabled />
							</p> -->

							<p>
								<label for="passwordsignup">성별 </label> <input type="radio"
									name="gender" value="M" checked>수컷 <input type="radio"
									name="gender" value="F">암컷
							</p>
							<p>
								<label for="birth">생년월일(ex.2015-09-12)</label> <input
									id="birthdate" type="text" class="form-control"
									placeholder="2015-09-12">
							</p>
							<!-- <div class="col-lg-6"></div> -->
							<p>
								프로필 사진 <input id="imagePath" name="image" type="file"
									value="이미지 등록" />
							</p>


						</form>
					</div>
				</div>

				<div class="modal-footer">
					<form class="form-inline">
						<div class="form-group">
							<button id="petSignUpBtn" type="button" class="btn btn-default"
								data-dismiss="modal">Pet 등록</button>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>

	
	<!-- /.footer -->
	<footer id="footer">
		<div class="container">
			<div class="col-sm-4 col-sm-offset-4">
				<!-- /.social links -->
				<div class="social text-center">
					<ul>
						<li><a class="wow fadeInUp" href="https://twitter.com/"><i
								class="fa fa-twitter"></i></a></li>
						<li><a class="wow fadeInUp" href="https://www.facebook.com/"
							data-wow-delay="0.2s"><i class="fa fa-facebook"></i></a></li>
						<li><a class="wow fadeInUp" href="https://plus.google.com/"
							data-wow-delay="0.4s"><i class="fa fa-google-plus"></i></a></li>
						<li><a class="wow fadeInUp" href="https://instagram.com/"
							data-wow-delay="0.6s"><i class="fa fa-instagram"></i></a></li>
					</ul>
				</div>
				<div class="text-center wow fadeInUp" style="font-size: 14px;">
					Copyright Backyard 2015 - Template by <a
						href="http://www.moxdesign.com">MoxDesign</a>
				</div>
				<a href="#" class="scrollToTop"><i class="pe-7s-up-arrow pe-va"></i></a>
			</div>
		</div>
	</footer>

	<!-- /.javascript files -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script>
		new WOW().init();
	</script>
</body>
</html>