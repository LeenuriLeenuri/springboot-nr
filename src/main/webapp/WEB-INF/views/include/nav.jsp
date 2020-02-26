<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- Button CSS -->
<meta name="author" content="www.twitter.com/cheeriottis" />
<link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/css/css/button.css" />
<!-- Button CSS -->

<!-- Title -->
<title>ANIMAL</title>

<!-- Favicon -->
<link rel="icon" href="/img/core-img/favicon.ico" />

<!-- Stylesheet -->
<link rel="stylesheet" href="/css/style.css" />
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div>
			<div class="spinner">
				<div class="double-bounce1"></div>
				<div class="double-bounce2"></div>
			</div>
			<span>Wait, please...</span>
		</div>
	</div>
	<!-- /Preloader -->

	<!-- Top Search Area Start -->
	<div class="top-search-area">
		<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<!-- Close Button -->
						<button type="button" class="btn close-btn" data-dismiss="modal">
							<i class="fa fa-times"></i>
						</button>
						<!-- Form -->
						<form action="home.html" method="post">
							<input type="search" name="top-search-bar" class="form-control" placeholder="Type keywords and hit enter..." />
							<button type="submit">Search</button>
						</form>
						<!-- Search Button -->
						<div class="search-btn">
							<i class="icon_search"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Search Area End -->

	<!-- Social Share Area Start -->
	<div class="razo-social-share-area">
		<a href="#" class="facebook"><i class="fa fa-facebook"></i></a> <a href="#" class="twitter"><i class="fa fa-twitter"></i></a> <a href="#" class="pinterest"><i class="fa fa-pinterest"></i></a> <a
			href="#" class="instagram"><i class="fa fa-instagram"></i></a> <a href="#" class="youtube"><i class="fa fa-youtube-play"></i></a> <a href="#" class="ss-close-btn"><i class="arrow_right"></i></a>
	</div>
	<!-- Social Share Area End -->

	<!-- Header Area Start -->
	<header class="header-area">
		<!-- Main Header Start -->
		<div class="main-header-area">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Classy Menu -->
					<nav class="classy-navbar justify-content-between" id="razoNav">
						<!-- Logo -->
						<a class="nav-brand" href="/"><img src="/img/core-img/logo.png" alt="" /></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- Menu -->
						<div class="classy-menu">
							<!-- Menu Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Nav Start -->
							<div class="classynav">
								<ul id="nav">
									<li><a href="#">About</a>
										<ul class="dropdown">
											<li><a class="nav-link" href="/about/aboutUs">- About Us</a></li>
											<li><a class="nav-link" href="/news/news">- NEWS</a></li>
											<c:if test="${sessionScope.principal.username eq 'admin'}">
												<li><a class="nav-link" href="/news/newsPost">- NEWS POST</a></li>
											</c:if>
										</ul></li>
									<li><a href="/animal/animal">ANIMAL</a> <c:if test="${sessionScope.principal.username eq 'admin'}">
											<ul class="dropdown">
												<li><a class="nav-link" href="/animal/animal">- ANIMAL</a></li>
												<li><a class="nav-link" href="/animal/animalPost">- ANIMAL POST</a></li>
											</ul>
										</c:if></li>
									<li><a href="#">Support</a>
										<ul class="dropdown">
											<li><a class="nav-link" href="/donation/donation">- DONATION</a></li>
											<c:if test="${sessionScope.principal.username eq 'admin'}">
												<li><a class="nav-link" href="/donation/donationPost">- DONATION POST</a></li>
											</c:if>
											<li><a class="nav-link" href="/volunteer/volunteer">- VOLUNTEER</a></li>
											<c:if test="${sessionScope.principal.username eq 'admin'}">
												<li><a class="nav-link" href="/volunteer/volunteerPost">- VOLUNTEER POST</a></li>
											</c:if>
										</ul></li>
									<li><a class="nav-link" href="/clientservice/clientservice">CLIENT SERVICE</a></li>
								</ul>

								<!-- Share Icon -->
								<div class="social-share-icon">
									<i class="social_share"></i>
								</div>

								<!-- Search Icon -->
								<div class="search-icon" data-toggle="modal" data-target="#searchModal">
									<i class="icon_search"></i>
								</div>
								<c:choose>
									<c:when test="${empty sessionScope.principal}">
										<a href="/user/join" type="button" class="btn btn-outline-light text-light ml-30"> JOIN </a>
										<a href="/user/login" type="button" class="btn btn-outline-light text-light ml-1"> LOGIN </a>
									</c:when>

									<c:otherwise>
										<a href="/user/profile/${sessionScope.principal.id}" type="button" class="btn btn-outline-light text-light ml-30"> PROFILE </a>
										<a href="/user/logout" type="button" class="btn btn-outline-light text-light ml-1"> LOGOUT </a>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- Nav End -->
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- Header Area End -->