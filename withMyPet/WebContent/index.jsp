<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" /> -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- /.website title -->
<title>index</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<style type="text/css">
.hide {
	display: none;
}

.show {
	display: block;
}

#customBtn {
	display: inline-block;
	background: #cc3732;
	color: white;
	width: 175px;
	border-radius: 5px;
}

#customBtn:hover {
	background: #e74b37;
	cursor: hand;
}

span.label {
	font-weight: bold;
}

span.icon {
	background: url('/+/images/branding/btn_red_32.png') transparent 10px
		50% no-repeat;
	display: inline-block;
	vertical-align: middle;
	width: 40px;
	height: 40px;
}

span.buttonText {
	display: inline-block;
	vertical-align: middle;
	padding-left: 40px;
	padding-right: 40px;
}
</style>
<!-- CSS Files -->
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet">
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
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />
<!-- Facebook app 연결요청  -->
<script>
	//<c:if test="${!empty msg}">alert('${msg}')</c:if>

	window.fbAsyncInit = function() {
		FB.init({
			appId : '697333240402235',
			xfbml : true,
			cookie : true,

			version : 'v2.4'
		});

		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				alert("LoginStatus -------");
				FB.api('/me?fields=id,name,email', function(user) {
					if (user) {
						var image = document.getElementById('image');
						image.src = 'http://graph.facebook.com/' + user.id
								+ '/picture';
						var name = document.getElementById('name');
						name.innerHTML = user.name
						var id = document.getElementById('id');
						console.log(user.id);
						id.innerHTML = user.id;
						var email = document.getElementById('email');
						//var birthday = document.getElementById('birthday');
						console.log(user.email);
						//console.log(user.birthday);
						email.innerHTML = user.email;
						//birthday.innerHTML = user.birthday;
						
						
						
						  /* $.post("signup.do", {
							"n_email" : user.email,
							"n_nickname" : user.name,
							"n_pwd" : "fb" }
						 );
						console.log("email **** : " + user.email + " nickname ***  : " + user.name ); */
					}

				});  

			} else if (response.status === 'not_authorized') {

			}
		}, {
			scope : 'email'
		});

		FB.Event.subscribe('auth.login', function(response) {
			//document.location.reload();
			//로그인 하고서 main.jsp 연결
			if (response.status === 'connected') {
				alert("event.subscribe");				
				document.location.assign("main.jsp");
		
 			}

		});
	};

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
			// 승인 성공
			// 사용자가 승인되었으므로 로그인 버튼 숨김. 예:
			//document.getElementById('signinButton').setAttribute('style',
			//			'display: none');
		} else if (authResult['error']) {
			// 오류가 발생했습니다.
			// 가능한 오류 코드:
			//   "access_denied" - 사용자가 앱에 대한 액세스 거부
			//   "immediate_failed" - 사용자가 자동으로 로그인할 수 없음
			// console.log('오류 발생: ' + authResult['error']);
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
		FB
				.api(
						{
							method : 'fql.query',
							query : 'SELECT name, pic_square FROM user WHERE uid='
									+ id
						},
						function(response) {
							document.getElementById('userInfo').innerHTML += ('<img src="' + response[0].pic_square + '"> ' + response[0].name);

						});
	}
</script>




</head>

<body data-spy="scroll" data-target="#navbar-scroll">


	<!--  Facebook SDK -->
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

	<!-- /.parallax full screen background image -->
	<div class="fullscreen landing parallax"

		style="background-image: url('images/bg2.jpg');" data-img-width="2000"

		data-img-height="1333" data-diff="100">
		<div class="overlay">
			<div class="container">
				<div class="row">
					<div class="col-md-7">

						<!-- /.logo -->
						<div class="logo wow fadeInDown">
							<a href=""><img src="images/logo.png" alt="logo"></a>
						</div>

						<!-- /.main title -->
						<h1 class="wow fadeInLeft">Beautiful High Converting Landing
							Page</h1>

						<!-- /.header paragraph -->
						<div class="landing-text wow fadeInUp">
							<p>Backyard is a modern and customizable landing page
								template designed to increase conversion of your product.
								Backyard is flexible to suit any kind of your business. Try now
								and join with our happy customers!</p>
						</div>

						<!-- /.header button -->
						<!-- <div class="head-btn wow fadeInLeft">
						<a href="#feature" class="btn-primary">Features</a>
						<a href="#download" class="btn-default">Download</a>
					</div> -->

						<p>사용자정보 출력</p>
						<div align="left">
							<img id="image" />
							<div id="name"></div>
							<div id="id"></div>
							<div id="email"></div>
							<!-- <div id="birthday"></div> -->

						</div>

					</div>

					<!-- /.signup form -->
					<div class="col-md-5">

						<div class="signup-header wow fadeInUp">
							<h3 class="form-title text-center"></h3>
							<form class="form-header" action="login.do" role="form"
								method="POST" id="login">
								<div class="form-group">
									<input class="form-control input-lg" name="em" id="email"
										type="email" placeholder="Your Email address" required>
								</div>
								<div class="form-group">
									<input class="form-control input-lg" name="pw" id="password"
										type="password" placeholder="Password" required>
								</div>
								<div class="form-group last">
									<input type="submit" class="btn btn-warning btn-block btn-lg"
										value="Login">
								</div>
								<div class="fb-login-button" data-max-rows="1" data-size="large"
									data-show-faces="false" data-auto-logout-link="true" scope = 'email,user_friends, public_profile'></div>
								<div>
									<%--<a id="kakao-login-btn"></a> --%>


								</div>
								<!-- <div id="signinButton" class="show">
									<div class="g-signin" data-callback="loginFinishedCallback"
										data-approvalprompt="force"
										data-clientid="536877613212-vlu39lhu8sp87lvd83npe0ejm3df7kah.apps.googleusercontent.com"
										data-scope="https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email"
										data-height="short" data-cookiepolicy="single_host_origin">
									</div>
								</div> -->
								<div>
									<!-- data-callback="signinCallback" -->
									<span id="signinButton"> <span class="g-signin"
										data-callback="signinCallback"
										data-clientid="536877613212-vlu39lhu8sp87lvd83npe0ejm3df7kah.apps.googleusercontent.com"
										data-cookiepolicy="single_host_origin"
										data-requestvisibleactions="http://schemas.google.com/AddActivity"
										data-scope="https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email">
									</span>
									</span>
								</div>
								<p class="privacy text-center"></p>
							</form>
						</div>
						<div class="signup-header wow fadeInUp">
							<h3 class="form-title text-center">간편 가입하기</h3>
							<form class="form-header" action="signup.do" role="form"
								method="POST" id="signup">
								<div class="form-group">
									<input class="form-control input-lg" name="n_email" id="email"
										type="email" placeholder="Your Email address" required>
								</div>
								<div class="form-group">
									<input class="form-control input-lg" name="n_nickname"
										id="nickname" type="text" placeholder="Your nickname" required>
								</div>
								<div class="form-group">
									<input class="form-control input-lg" name="n_pwd" id="password"
										type="password" placeholder="Password" required>
								</div>
								<div class="form-group last">
									<input type="submit" class="btn btn-warning btn-block btn-lg"
										id="signupBtn" value="가입하기">
								</div>
								<!-- <p>OR</p>
								<a class="btn btn-block btn-social btn-facebook"> <i
									class="fb-signin-button"></i> Sign in Facebook
								</a>
								<div class="form-group last">
								<input type="button" class="fb-signin-button"
										id="signupBtnfb" value="페이스북으로 가입하기">
								
								<div class="fb-login-button" data-max-rows="1"
									data-size="large" data-show-faces="false"
									data-auto-logout-link="true"></div> -->


						<p class="privacy text-center">
							We will not share your email. Read our <a href="privacy.html">privacy
								policy</a>
						</p>
						</form>
					</div>

				</div>
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
				<div class="text-center wow fadeInUp" style="font-size: 14px;">Copyright
					DDonggangaziProject</div>
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

	<script src="https://apis.google.com/js/plusone.js"
		type="text/javascript"></script>
	<script>
		new WOW().init();
	</script>
	<!-- 구글 연동  -->

	<!-- <script type="text/javascript">
		/*
		 * 로그인을 승인하거나, 취소하거나, 승인 대화상자를
		 * 닫으면 실행됩니다.
		 */
		function loginFinishedCallback(authResult) {
			if (authResult) {
				if (authResult['error'] == undefined) {
					gapi.auth.setToken(authResult); // 반환된 토큰을 저장합니다.
					toggleElement('signinButton'); // 로그인에 성공하면 로그인을 숨깁니다.
					getEmail(); // 이메일 주소 가져오기 요청을 실행합니다.
				} else {
					console.log('An error occurred');
				}
			} else {
				console.log('Empty authResult'); // 문제 발생
			}
		}

		/*
		 * userinfo 끝점에 대한 요청을 실행하여 사용자의 이메일
		 * 주소를 가져옵니다. 이 함수에는 유효한 OAuth 액세스 토큰이 포함된 gapi.auth.setToken이
		 *  필요합니다.
		 *
		 * 요청이 완료되면 getEmailCallback이 실행되고 요청의 결과가
		 * 전달됩니다.
		 */
		function getEmail() {
			// userinfo 메소드를 사용할 수 있도록 oauth2 라이브러리를 로드합니다.
			gapi.client.load('oauth2', 'v2', function() {
				var request = gapi.client.oauth2.userinfo.get();
				request.execute(getEmailCallback);
			});
		}

		function getEmailCallback(obj) {
			var el = document.getElementById('email');
			var email = '';

			if (obj['email']) {
				email = 'Email: ' + obj['email'];
			}

			//console.log(obj);   // 전체 개체를 검사하려면 주석을 해제합니다.

			el.innerHTML = email;
			
			toggleElement('email');
		}

		function toggleElement(id) {
			var el = document.getElementById(id);
			if (el.getAttribute('class') == 'hide') {
				el.setAttribute('class', 'show');
			} else {
				el.setAttribute('class', 'hide');
			}
		}
	</script> -->


	<!-- 이 비동기 자바스크립트를 </body> 태그 앞에 배치 -->
	<script type="text/javascript">
		(function() {
			var po = document.createElement('script');
			po.type = 'text/javascript';
			po.async = true;
			po.src = 'https://apis.google.com/js/client:plusone.js?onload=render';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(po, s);
		})();

		function render() {
			gapi.signin
					.render(
							'customBtn',
							{
								//'callback': 'signinCallback',
								'clientid' : '841077041629.apps.googleusercontent.com',
								'cookiepolicy' : 'single_host_origin',
								'requestvisibleactions' : 'http://schemas.google.com/AddActivity',
								'scope' : 'https://www.googleapis.com/auth/plus.login'
							});
		}
	<%--새로운 추가 내용 --%>
		function getEmail() {
			// userinfo 메소드를 사용할 수 있도록 oauth2 라이브러리를 로드합니다.
			gapi.client.load('oauth2', 'v2', function() {
				var request = gapi.client.oauth2.userinfo.get();
				request.execute(getEmailCallback);
			});
		}

		function getEmailCallback(obj) {
			var el = document.getElementById('email2');
			var email = '';

			if (obj['email2']) {
				email = 'Email: ' + obj['email2'];
			}

			//console.log(obj);   // 전체 개체를 검사하려면 주석을 해제합니다.

			el.innerHTML = email;
			console.log("google=" + email);
			toggleElement('email2');
		}

		function toggleElement(id) {
			var el = document.getElementById(id);
			if (el.getAttribute('class') == 'hide') {
				el.setAttribute('class', 'show');
			} else {
				el.setAttribute('class', 'hide');
			}
		}
		

	</script>

<!-- 	<span class="label">Sign in with:</span>
	<div id="customBtn" class="customGPlusSignIn">
		<span class="icon"></span> <span class="buttonText">Google</span>
	</div>
 -->
	<%--KaKaoTalk 로그인 연동 --%>
	<%--<script>

	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('43db8bb867ac7774c3f016deb2f529aa');

	Kakao.Auth.createLoginButton({
	    container: '#kakao-login-btn',
	    success: function(authObj) {
	      // 로그인 성공시, API를 호출합니다.
	      Kakao.API.request({
	        url: '/v1/user/me',
	        success: function(res) {
	          alert(JSON.stringify(res));
	        },
	        fail: function(error) {
	          alert(JSON.stringify(error))
	        }
	      });
	    },
	    fail: function(err) {
	      alert(JSON.stringify(err))
	    }
	  });
</script>
 --%>
</body>
</html>