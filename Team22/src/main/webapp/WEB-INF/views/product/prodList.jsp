<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>잊지마! 있지마켓</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/product.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		
		<style>
			#sidebar.force-inactive{
				margin-left: -24em;
			}
			
			.custom-button {
		    background: none;
		    border: none;
		    color: inherit;
		    cursor: pointer;
		    font-size: inherit;
		    font-family: inherit;
		  }
		
		  .custom-button:focus {
		    outline: none;
		  }
		  
		  a.product-section {
			    text-decoration: none;
			    color: inherit;
			    outline: none;
			    cursor: pointer;
			}
			
			a.product-section:hover,
			a.product-section:focus {
			    text-decoration: none;
			    color: inherit;
			}
					  
		  
		</style>
	</head>
	<body>
	
	
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="/main" class="logo"><strong>있지마켓</strong></a>
									<ul class="icons">
										<c:if test="${id == null }">
											<li><a href="/members/login"><span class="label">로그인</span></a></li>
											<li><a href="#"><span class="label">회원가입</span></a></li>
										</c:if>
                                        
                                        <c:if test="${id != null && id !=('admin')}">
                                           <li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
                                           <li><a href="/members/myPage" ><span class="label">마이페이지</span></a></li>
                                            <li><a href="/chat" ><span class="label">내채팅</span></a></li>
										  <!--  <li><a href="/chat" class="icon fa-instagram"> 내채팅<span class="label"></span></a></li> -->
                                        </c:if>

                                        <c:if test="${id != null && id ==('admin')}">
                                            <li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
                                            <li><a href="/admin/adminPage" ><span class="label">관리자</span></a></li>
                                        </c:if>
										

									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>잊지마켓<br />
											상품목록</h1>
										</header>
										
			
			
			
								</section>

							<!-- Section -->
									
									
									<section>
	<form id="filter-form">
		<div class="select-container">
			<select name="sort" id="sort-select" class="select_filter">
				<option value="" hidden>===정렬===</option>
				<option value="">전체</option>
				<option value="price_asc">가격 낮은 순</option>
				<option value="price_desc">가격 높은 순</option>
				<option value="date_desc">최근일자 순</option>
				<option value="date_asc">예전일자 순</option>
			</select>
		</div>
		<div class="select-container">
			<select name="grade" id="grade-select" class="select_filter">
				<option value="" hidden>==상품상태==</option>
				<option value="">전체</option>
				<option value="상">상</option>
				<option value="중">중</option>
				<option value="하">하</option>
			</select>
		</div>
		<div class="select-container">
			<select name="category" id="category-select" class="select_filter">
				<option value="" hidden>====분류====</option>
				<option value="">전체</option>
				<option value="의류">의류</option>
				<option value="가전제품">가전제품</option>
				<option value="식기,가구">식기,가구</option>
				<option value="디지털,전자기기">디지털,전자기기</option>
				<option value="식품,생필품">식품,생필품</option>
				<option value="스포츠,건강">스포츠,건강</option>
				<option value="기기,공구">기기,공구</option>
				<option value="도서,쿠폰">도서,쿠폰</option>
				<option value="유아">유아</option>
				<option value="애완동물">애완동물</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<div class="div-search">		
			<input type="text" name="title" class="search-input">
			<div id="div-filter-submit">
				<i class="fas fa-search"></i>
			</div>
		</div>
	</form>
	
	<section>
		<header class="major">
			<h2>${param.title } 조회 결과</h2>
		</header>
		<div class="posts">
			<c:forEach var="list" items="${prodList }">
				<article>
			
			<a class="product-section" href="/product/prodInfo?product_num=${list.product_num }&seller=${list.product_seller}">
				<img src="/resources/images/${list.product_pic.split(',')[0] }" 
				onerror="this.src='/resources/images/default_product.jpg'">
			<div style="float:right;">
				${list.product_readcount }
				<div class="smalldiv" id="${list.product_num }">${list.product_favorite }</div>
			</div>
			<div>${list.product_title }</div>
			
			
			<div>${list.product_seller }</div>
			<div style="float:left;">${list.product_price }</div>
			
			</a>
			
				</article>
			</c:forEach>
		</div>
	</section>
	
	
	
		<form id="prodRegForm" action="/product/prodReg" method="POST">
			<input type="hidden" name="product_num" value="1">
			<input type="hidden" name="id" value="itwill">
			<button type="button" class="custom-button" id="register">1번 유저로 상품 등록 페이지 가기</button>
		</form>
	

	<br>
	
	
	
	<button type="button" onclick="likeit(1);">누르면 찜</button>
	<button type="button" onclick="likecancel(1);">찜 취소하기</button>
	
	<a href="/product/prodInfo?product_num=1&seller=itwill">상세 페이지 가기</a>
	</section>



		</div>
		</div>
		

							<!-- Sidebar -->
					<div id="sidebar" class="inactive force-inactive">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>카테고리</h2>
									</header>
									<ul>
										<li><a href="index.html">여성의류</a></li>
										<li><a href="generic.html">Generic</a></li>
										<li><a href="elements.html">Elements</a></li>
										<li>
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul>
								</nav>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="/resources/images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/images/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
										<li class="fa-phone">(000) 000-0000</li>
										<li class="fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>
						</div>
					</div>
			
			</div>

		<!-- Scripts -->
		<script src="https://code.jquery.com/jquery-3.6.4.js" 
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<script>
	

	
	$('#div-filter-submit').on('click', function(){
		$('#filter-form').submit();
	})
	
	$('#register').on('click', function() {
		$('#prodRegForm').submit();
	});

	
	$(document).ready(function() {
	    const urlParams = new URLSearchParams(window.location.search);
	    const sortValue = urlParams.get('sort');
	    const gradeValue = urlParams.get('grade');
	    const categoryValue = urlParams.get('category');

	    if (sortValue) {
	    	$('#sort-select').val(sortValue);
	    }
	    if (gradeValue) {
	    	$('#grade-select').val(gradeValue);
	    }
	    if (categoryValue) {
	    	$('#category-select').val(categoryValue);
	    }
	});

	
	
	
	// 찜하기,취소 나중에 click 익명 함수로
	function likeit(pnum){
		$.ajax({
			type: "GET",
			url: "/product/likeProd",
			dataType: "text",
			data: {product_num : pnum},
			success: function(response){
				console.log("찜 목록");
			},
			error: function(req, stat, error){
				var obj = $('#'+pnum);
				obj.html(Number(obj.html())+1);
			}
		});
	}
	
	function likecancel(pnum){
		$.ajax({
			type: "GET",
			url: "/product/likeProdCancel",
			dataType: "text",
			data: {product_num : pnum},
			success: function(response){
				console.log("찜 목록");
			},
			error: function(req, stat, error){
				var obj = $('#'+pnum);
				obj.html(Number(obj.html())-1);
			}
		});
	}
	</script>
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>