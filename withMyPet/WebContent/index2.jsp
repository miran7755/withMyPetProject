<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- /.website title -->
<title>index</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

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

<c:if test="${!empty msg}">alert('${msg}')</c:if>

	window.fbAsyncInit = function() {
		FB.init({
			appId : '697333240402235',
			xfbml : true,
			cookie : true,
			
			version : 'v2.4'
		});

		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				FB.api('/me', function(user) {
					if (user) {
						var image = document.getElementById('image');
						image.src = 'http://graph.facebook.com/' + user.id
								+ '/picture';
						var name = document.getElementById('name');
						name.innerHTML = user.name
						var id = document.getElementById('id');
						console.log(user.id);
						id.innerHTML = user.id
					}
				});

			} else if (response.status === 'not_authorized') {

			} else {

			}
		});

		FB.Event.subscribe('auth.login', function(response) {
			document.location.reload();
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
		    document.getElementById('signinButton').setAttribute('style', 'display: none');
		  } else if (authResult['error']) {
		    // 오류가 발생했습니다.
		    // 가능한 오류 코드:
		    //   "access_denied" - 사용자가 앱에 대한 액세스 거부
		    //   "immediate_failed" - 사용자가 자동으로 로그인할 수 없음
		    // console.log('오류 발생: ' + authResult['error']);
		  }
		}
	
	(function(d){
        var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement('script'); js.id = id; js.async = true;
        js.src = "//connect.facebook.net/ko_KR/all.js";
        ref.parentNode.insertBefore(js, ref);
      }(document));
	
	
	function showUserInfo(id) {
        FB.api({
          method: 'fql.query',
          query: 'SELECT name, pic_square FROM user WHERE uid='+id
        },function(response) {
          document.getElementById('userInfo').innerHTML += (
            '<img src="' + response[0].pic_square + '"> ' + response[0].name
          );
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
		style="background-image: url('images/bg.jpg');" data-img-width="2000"
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
							<div id="name"></div>
						</div>

					</div>

					<!-- /.signup form -->
					<div class="col-md-5">

						<div class="signup-header wow fadeInUp">
							<h3 class="form-title text-center"></h3>
							<form class="form-header"
								action="login.do"
								role="form" method="POST" id="login">
								<div class="form-group">
									<input class="form-control input-lg" name="em" id="email"
										type="email" placeholder="Your Email address" required>
								</div>
								<div class="form-group">
									<input class="form-control input-lg" name="pw"
										id="password" type="password" placeholder="Password" required>
								</div>
								<div class="form-group last">
									<input type="submit" class="btn btn-warning btn-block btn-lg"
										value="Login">
								</div>
								<div class="fb-login-button" data-max-rows="1" data-size="large"
									data-show-faces="false" data-auto-logout-link="true"></div>
								<div>
									<span id="signinButton"> <span class="g-signin"
										data-callback="signinCallback" data-clientid="536877613212-vlu39lhu8sp87lvd83npe0ejm3df7kah.apps.googleusercontent.com"
										data-cookiepolicy="single_host_origin"
										data-requestvisibleactions="http://schemas.google.com/AddActivity"
										data-scope="https://www.googleapis.com/auth/plus.login">
									</span>
									</span>
								</div>
								<p class="privacy text-center"></p>
							</form>
						</div>
						<div class="signup-header wow fadeInUp">
							<h3 class="form-title text-center"> 간편 가입하기 </h3>
							<form class="form-header" action="signup.do" role="form"
								method="POST" id="signup">
								<div class="form-group">
									<input class="form-control input-lg" name="n_email" id="email"
										type="email" placeholder="Your Email address" required>
								</div>
								<div class="form-group">
									<input class="form-control input-lg" name="n_nickname" id="nickname"
										type="text" placeholder="Your nickname" required>
								</div>
								<div class="form-group">
									<input class="form-control input-lg" name="n_pwd"
										id="password" type="password" placeholder="Password" required>
								</div>
								<div class="form-group last">
									<input type="submit" class="btn btn-warning btn-block btn-lg"
										value="가입하기">
								</div>
								<p class="privacy text-center">
									We will not share your email. Read our <a href="privacy.html">privacy
										policy</a>.
								</p>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>




	<!--  /.contact section -->
	<!--  <div id="contact">
	<div class="contact fullscreen parallax" style="background-image:url('images/bg.jpg');" data-img-width="2000" data-img-height="1334" data-diff="100">
		<div class="overlay">
			<div class="container">
				<div class="row contact-row">
				
					/.address and contact
					<div class="col-sm-5 contact-left wow fadeInUp">
						<h2><span class="highlight">Get</span> in touch</h2>
							<ul class="ul-address">
							<li><i class="pe-7s-map-marker"></i>1600 Amphitheatre Parkway, Mountain View</br>
							California 55000
							</li>
							<li><i class="pe-7s-phone"></i>+1 (123) 456-7890</br>
							+2 (123) 456-7890
							</li>
							<li><i class="pe-7s-mail"></i><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
							<li><i class="pe-7s-look"></i><a href="#">www.yoursite.com</a></li>
							</ul>	
								
					</div>
					
					/.contact form
					<div class="col-sm-7 contact-right">
						<form method="POST" id="contact-form" class="form-horizontal" action="contactengine.php" onSubmit="alert('Thank you for your feedback!');">
							<div class="form-group">
							<input type="text" name="Name" id="Name" class="form-control wow fadeInUp" placeholder="Name" required/>
							</div>
							<div class="form-group">
							<input type="text" name="Email" id="Email" class="form-control wow fadeInUp" placeholder="Email" required/>
							</div>					
							<div class="form-group">
							<textarea name="Message" rows="20" cols="20" id="Message" class="form-control input-message wow fadeInUp"  placeholder="Message" required></textarea>
							</div>
							<div class="form-group">
							<input type="submit" name="submit" value="Submit" class="btn btn-success wow fadeInUp" />
							</div>
						</form>		
					</div>
				</div>
			</div>
		</div>
	</div>
</div> -->

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
	<script>
		new WOW().init();
	</script>
	<!-- 구글 연동  -->
	<!-- 이 비동기 자바스크립트를 </body> 태그 앞에 배치 -->
  <script type="text/javascript">
  (function() {
    var po = document.createElement('script');
    po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/client:plusone.js?onload=render';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(po, s);
  })();

  function render() {
    gapi.signin.render('customBtn', {
      //'callback': 'signinCallback',
      'clientid': '841077041629.apps.googleusercontent.com',
      'cookiepolicy': 'single_host_origin',
      'requestvisibleactions': 'http://schemas.google.com/AddActivity',
      'scope': 'https://www.googleapis.com/auth/plus.login'
    });
  }
  </script>
  <style type="text/css">
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
      background: url('/+/images/branding/btn_red_32.png') transparent 10px 50% no-repeat;
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
  <span class="label">Sign in with:</span>
  <div id="customBtn" class="customGPlusSignIn">
    <span class="icon"></span>
    <span class="buttonText">Google</span>
  </div>
</body>
</html>