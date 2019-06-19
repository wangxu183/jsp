<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
	<script  src="./js/jquery-3.2.1.js"></script>
	<script src="./js/jquery.cookie.js"></script>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">
<style>
	.doo{
		margin:0;
		padding:0;
	}
	h14{
		width:380px;
		margin:0 auto;
		color:#000;
		font-size:38px;
		font-weight:normal;
		text-shadow:0px 0px 26px #000;
		animation:color 7s infinite linear;
	}
	@keyframes color{
		0%{
			color:#FFDAB9;
			text-shadow:0px 0px 26px #AEEEEE;
		}
		14%{
			color:#ff9900;
			text-shadow:0px 0px 26px #ff9900;
		}
		28%{
			color:#ffff00;
			text-shadow:0px 0px 26px #ffff00;
		}
		42%{
			color:#00ff00;
			text-shadow:0px 0px 26px #0f0;
		}
		56%{
			color:#3366ff;
			text-shadow:0px 0px 26px #3366ff;
		}
		70%{
			color:#33ffff;
			text-shadow:0px 0px 26px #3ff;
		}
		84%{
			color:#90c;
			text-shadow:0px 0px 26px #90c;
		}
		100%{
			color:#ff6600;
			text-shadow:0px 0px 26px #ff6600;
		}
	}
</style>
</head>
<body>

<div class="main">

	<header class="header d-flex flex-row">
		<div class="header_content d-flex flex-row align-items-center">
			<div class="logo_container">
				<div class="logo">
					<img src="images/logo.png" alt="">
					<span>Book</span>
				</div>
			</div>
			<nav class="main_nav_container">
			    <div class="doo">
	               <h14>眼睛到不了的地方 文字可以</h14>
				</div>
			</nav>
		</div>
	</header>
	

	


	<div class="home">
		<div class="hero_slider_container">
			<div class="hero_slider owl-carousel">
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(images/1.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Get your <span>Education</span> today!</h1>
						</div>
					</div>
				</div>
				

				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(images/1.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Get your <span>Education</span> today!</h1>
						</div>
					</div>
				</div>

				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(images/1.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Get your <span>Education</span> today!</h1>
						</div>
					</div>
				</div>
			</div>
			<div class="hero_slider_left hero_slider_nav trans_200"><span class="trans_200"><<</span></div>
			<div class="hero_slider_right hero_slider_nav trans_200"><span class="trans_200">>></span></div>
		</div>
	</div>

	<div class="hero_boxes">
		<div class="hero_boxes_inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 hero_box_col">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<a href="detail.jsp">
								<img src="images/ear.svg" class="svg" alt="">
							</a>
							 <div class="hero_box_content">
								 <a href="bookadd.jsp">
								  <h2 class="hero_box_title">图书管理</h2>
								  <p class="hero_box_link"  >LIARBRY</p>
								 </a>
							</div>
						</div>
					</div>


					<div class="col-lg-4 hero_box_col">
						<div class="hero_box
						d-flex flex-row
						align-items-center
						justify-content-start">
							<a href="bookquery.jsp">
							  <img src="images/books.svg" class="svg" alt="">
							</a>
							<div class="hero_box_content">
								<a href="bookquery.jsp">
								  <h2 class="hero_box_title">个人中心</h2>
								  <p class="hero_box_link">LIARBRY </p>
								</a>
							</div>
						</div>
					</div>

					<div class="col-lg-4 hero_box_col">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<a href="index.jsp">
							<img src="images/professor.svg" class="svg" alt="">
							</a>
							<div class="hero_box_content">
								<a href="index.jsp">
								<h2 class="hero_box_title">退出系统</h2>
								<p class="hero_box_link">LIARBRY</p>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="popular page_section">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h1>Popular liarbry</h1>
					</div>
				</div>
			</div>

			<div class="row course_boxes">
				<div class="col-lg-4 course_box">
					<div class="card">
						<img class="card-img-top" src="images/k6.jpg" alt="https://unsplash.com/@kellybrito">
						<div class="card-body text-center">
							<p  class="card-title">你现在的气质里，藏着你走过的路，一直以来读过的书              </p>
						</div>
					</div>
				</div>


				<div class="col-lg-4 course_box">
					<div class="card">
						<img class="card-img-top" src="images/k2.jpg" alt="https://unsplash.com/@cikstefan">
						<div class="card-body text-center">
							<p class="card-title">要么读书、要么旅行，身体和灵魂总有一个在路上      </p>

						</div>
					</div>
				</div>


				<div class="col-lg-4 course_box">
					<div class="card">
						<img class="card-img-top" src="images/k3.jpg" alt="https://unsplash.com/@dsmacinnes">
						<div class="card-body text-center">
							<p class="card-title">生活不应只有油盐酱醋茶，还应有琴棋书画诗酒花，而这些读书可以给你</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row course_boxes">
				<div class="col-lg-4 course_box">
					<div class="card">
						<img class="card-img-top" src="images/k1.jpg" alt="https://unsplash.com/@kellybrito">
						<div class="card-body text-center">
							<p class="card-title">读书不是文凭高薪，是为了成为一个有温度、有情趣、会思考的人</p>
						</div>
					</div>
				</div>

				<div class="col-lg-4 course_box">
					<div class="card">
						<img class="card-img-top" src="images/k5.jpg" alt="https://unsplash.com/@cikstefan">
						<div class="card-body text-center">
							<p class="card-title">拓宽灵魂的广度和宽度，能在跌宕其起伏的生活中拥有处变不惊的内心</p>

						</div>
					</div>
				</div>

				<div class="col-lg-4 course_box">
					<div class="card">
						<img class="card-img-top" src="images/k4.jpg" alt="https://unsplash.com/@dsmacinnes">
						<div class="card-body text-center">
							<p class="card-title">有人说，我读书是为了不遇到自己不想遇到的人                   </p>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>

	<!-- Register -->
</div>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/custom.js"></script>

</body>
</html>
<script language="JavaScript">
	function get() {
		window.location="main.jsp";
	}
</script>