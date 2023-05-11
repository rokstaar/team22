<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<link rel="stylesheet" href="resources/assets/css/mainPage.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<style>
			#sidebar.force-inactive{
				margin-left: -26em;
			}
		</style>
		<script type="text/javascript">
			function imgerr(img){
				img.onerror = null;
				img.src = '/resources/images/default_product.jpg';
				img.alt = "사진이 없습니다";
			}
		</script>
	</head>
	<body>

<!-- 추천 -->
<c:if test="${id ne null }">
<div class="rec-view">
        <div class="rec-title">
            <article>
                ${id }님! 이런 제품은 어떠세요?
                <c:if test="${reclist.token eq 0 }">
                	[찜 목록 기반 추천]
                </c:if>
                <c:if test="${reclist.token eq 1 }">
                	[사람들이 좋아하는 상품]
                </c:if>
                <c:if test="${reclist.token eq 2 }">
                	[최근 관심 급등 상품]
                </c:if>
            </article>
            <div id="close-btn">
                <?xml version="1.0" ?><svg height="48" viewBox="0 0 48 48" width="48" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M38 12.83l-2.83-2.83-11.17 11.17-11.17-11.17-2.83 2.83 11.17 11.17-11.17 11.17 2.83 2.83 11.17-11.17 11.17 11.17 2.83-2.83-11.17-11.17z" />
                    <path d="M0 0h48v48h-48z" fill="none" />
                </svg>
            </div>
        </div>
        <div id="left-btn">
            <?xml version="1.0" ?><svg style="enable-background:new 0 0 32 32;" version="1.1" viewBox="0 0 32 32"
                xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <style type="text/css">
                    .st0 {
                        display: none;
                    }
            
                    .st1 {
                        display: inline;
                    }
            
                    .st2 {
                        fill: #0097E2;
                    }
            
                    .st3 {
                        fill: #3A3A3A;
                    }
                </style>
                <g class="st0" id="grid" />
                <g id="icon">
                    <g>
                        <g>
                            <path class="st2"
                                d="M15,22c-0.26,0-0.51-0.1-0.71-0.29l-5-5c-0.39-0.39-0.39-1.02,0-1.41l5-5c0.39-0.39,1.02-0.39,1.41,0     s0.39,1.02,0,1.41L11.41,16l4.29,4.29c0.39,0.39,0.39,1.02,0,1.41C15.51,21.9,15.26,22,15,22z" />
                        </g>
                    </g>
                    <g>
                        <g>
                            <path class="st2"
                                d="M21,22c-0.26,0-0.51-0.1-0.71-0.29l-5-5c-0.39-0.39-0.39-1.02,0-1.41l5-5c0.39-0.39,1.02-0.39,1.41,0     s0.39,1.02,0,1.41L17.41,16l4.29,4.29c0.39,0.39,0.39,1.02,0,1.41C21.51,21.9,21.26,22,21,22z" />
                        </g>
                    </g>
                </g>
            </svg>
        </div>
        <div class="rec-container">
            <div class="rec-wrapper">
                <c:forEach var="prod" items="${reclist.list }">
                <a href="/product/prodInfo?product_num=${prod.product_num }&seller=${prod.product_seller}">
                <div class="rec-product">
                    <div class="prod-pic">
                        <img id="main-image" src="/product/thumb?fileName=${prod.product_pic.split(',')[0]}" onerror="imgerr(this)">
                    </div>
                    <div id="prod-content">
                        ${prod.product_title }
                    </div>
                </div>
                </a>
                </c:forEach>
            </div>
        </div>
        <div id="right-btn">
            <?xml version="1.0" ?><svg style="enable-background:new 0 0 32 32;" version="1.1" viewBox="0 0 32 32"
                xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <style type="text/css">
                    .st0 {
                        display: none;
                    }
            
                    .st1 {
                        display: inline;
                    }
            
                    .st2 {
                        fill: #0097E2;
                    }
            
                    .st3 {
                        fill: #3A3A3A;
                    }
                </style>
                <g class="st0" id="grid" />
                <g id="icon">
                    <g>
                        <g>
                            <path class="st2"
                                d="M17,22c-0.26,0-0.51-0.1-0.71-0.29c-0.39-0.39-0.39-1.02,0-1.41L20.59,16l-4.29-4.29     c-0.39-0.39-0.39-1.02,0-1.41s1.02-0.39,1.41,0l5,5c0.39,0.39,0.39,1.02,0,1.41l-5,5C17.51,21.9,17.26,22,17,22z" />
                        </g>
                    </g>
                    <g>
                        <g>
                            <path class="st2"
                                d="M11,22c-0.26,0-0.51-0.1-0.71-0.29c-0.39-0.39-0.39-1.02,0-1.41L14.59,16l-4.29-4.29     c-0.39-0.39-0.39-1.02,0-1.41s1.02-0.39,1.41,0l5,5c0.39,0.39,0.39,1.02,0,1.41l-5,5C11.51,21.9,11.26,22,11,22z" />
                        </g>
                    </g>
                </g>
            </svg>
        </div>
    </div>
</c:if>
<!-- 추천 -->


		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<%@ include file="include/header.jsp" %>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>Hi, I’m Editorial<br />
											by HTML5 UP</h1>
											<p>A free and fully responsive site template</p>
										</header>
										<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu. Proin aliquam facilisis ante interdum congue. Integer mollis, nisl amet convallis, porttitor magna ullamcorper, amet egestas mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor sit nullam.</p>
										<ul class="actions">
											<li><a href="/product/prodList" class="button big">상품 리스트가기</a></li>
										</ul>
									</div>
									<span class="image object">
										<img src="/resources/images/animation_smart.gif" alt="" />
									</span>
			
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>최근 본 글 제목들</h2>
										<c:forEach var="list" items="${viewlist }">
											${list.product_title }
										</c:forEach>
									</header>
									<div class="features">
										<article>
											<span class="icon fa-diamond"></span>
											<div class="content">
												<h3>Portitor ullamcorper</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-paper-plane"></span>
											<div class="content">
												<h3>Sapien veroeros</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-rocket"></span>
											<div class="content">
												<h3>Quam lorem ipsum</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-signal"></span>
											<div class="content">
												<h3>Sed magna finibus</h3>
												<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											</div>
										</article>
									</div>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ipsum sed dolor</h2>
									</header>
									<div class="posts">
										<article>
											<a href="#" class="image"><img src="resources/images/pic01.jpg" alt="" /></a>
											<h3>Interdum aenean</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="resources/images/pic02.jpg" alt="" /></a>
											<h3>Nulla amet dolore</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="resources/images/pic03.jpg" alt="" /></a>
											<h3>Tempus ullamcorper</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="resources/images/pic04.jpg" alt="" /></a>
											<h3>Sed etiam facilis</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="resources/images/pic05.jpg" alt="" /></a>
											<h3>Feugiat lorem aenean</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="resources/images/pic06.jpg" alt="" /></a>
											<h3>Amet varius aliquam</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
									</div>
								</section>

						</div>
					</div>
				<%@ include file="include/sidebar.jsp" %>
			
			</div>
<script src="https://code.jquery.com/jquery-3.6.4.js" 
integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var result = "${result}";
	
	if(result == "delete"){
		alert("회원탈퇴가 되었습니다.");		
	}
	
	
	
	
	$(document).ready(function(){
		
	});
	
	   /* var useLocation = confirm("현재 위치 정보를 사용하시겠습니까?"); 

	    if (useLocation) { */
	        // 위치 정보 사용에 동의한 경우, 위치 정보를 가져와서 사용하는 코드를 작성합니다.
	        if (navigator.geolocation) {
	            navigator.geolocation.getCurrentPosition(function(position) {
	                // 위치 정보를 가져왔을 때의 동작을 처리합니다.
	                var latitude = position.coords.latitude;
	                var longitude = position.coords.longitude;

	                // 가져온 위치 정보를 서버로 전송하거나 다른 작업을 수행할 수 있습니다.
					
	                
	                // 예시로 가져온 위치 정보를 화면에 출력합니다.
	                var locationText = "현재 위치: " + latitude + ", " + longitude;
	                document.getElementById("location").innerText = locationText;
	            });
	        } else {
	            alert("브라우저가 위치 정보를 지원하지 않습니다.");
	        }
	    /* } */
	
</script>
<script type="text/javascript" src="resources/assets/js/mainPage.js"></script>
	</body>
</html>