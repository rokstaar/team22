<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>잊지마! 있지마켓</title>
	
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/product.css" />

		
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<link rel="preload" href="/resources/images/${info.product_pic.split(',')[0]}" as="image">
		
		
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
			
			function changeMainImage(thumbnail) {
				const mainImage = document.getElementById('main-image');
				  
				mainImage.src = thumbnail.src;
			}
		</script>
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
                                            <li><a href="/chatroom" ><span class="label">내채팅</span></a></li>
										  <!--  <li><a href="/chat" class="icon fa-instagram"> 내채팅<span class="label"></span></a></li> -->
                                        </c:if>

                                        <c:if test="${id != null && id ==('admin')}">
                                            <li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
                                            <li><a href="/admin/adminPage" ><span class="label">관리자</span></a></li>
                                        </c:if>
										

									</ul>
								</header>
							<!-- Banner -->
								<!-- <section id="banner">
									<div class="content">
										<header>
											<h1>있지마켓<br />
											제품 상세 페이지</h1>
										</header>
									</div>
			
								</section> -->		
	<section>
		<div class="prodInfo">
		<div class="image-gallery">
		  <div class="main-image">
		    <%-- <img id="main-image" src="/resources/images/${info.product_pic.split(',')[0]}" onerror="imgerr(this)"> --%>
		    <img id="main-image" src="/product/download?fileName=${info.product_pic.split(',')[0]}" onerror="imgerr(this)">
		  </div>
		  <div class="thumbnail-container">
		    <ul class="thumbnails">
		      <c:forEach var="i" begin="0" end="2">
		        <c:if test="${not empty info.product_pic.split(',')[i]}">
		          <li>
		            <%-- <img class="thumbnail" src="/resources/images/${info.product_pic.split(',')[i]}" onerror="imgerr(this)" onclick="changeMainImage(this)"> --%>
		            <img class="thumbnail" src="/product/thumb?fileName=${info.product_pic.split(',')[i]}" onerror="imgerr(this)" onclick="changeMainImage(this)">
		          </li>
		        </c:if>
		      </c:forEach>
		    </ul>
		  </div>
		</div>

		<hr style="margin: 1em 0;">
			
		<a class="a-section">
		<section class="member">
			<div class="space-between">
				<div>
					<div class="div-img" style="width:200px;">
						<img src="/resources/images/${info.member_pic }" onerror="imgerr(this)">
						<!-- <img src="/product/download?fileName=${info.member_pic }" onerror="imgerr(this)"> -->
					</div>
						<div class="profile">
							${info.member_nickname }
						</div>
							<div class="address">
								${info.member_address }
							</div>
						
				</div>
				
				
				 
				<div class="div-member">
					<div class="div-img" id="score">
						<c:choose>
							<c:when test="${score > 3.75 }">
								<img src="/resources/images/score_verygood.png">
							</c:when>
							<c:when test="${score > 2.5 }">
								<img src="/resources/images/score_good.png">
							</c:when>
							<c:when test="${score > 1.25 }">
								<img src="/resources/images/score_bad.png">
							</c:when>
							<c:otherwise>
								<img src="/resources/images/score_verybad.png">
							</c:otherwise>
						</c:choose>
						</div>
						
						<div class="score">
					평판 : <fmt:formatNumber value="${score }" pattern="#.##" />
					</div>
	
				</div>
			</div>
		</section>			
		</a>		
		
		<!-- 게시물 부가탭 -->
		<div class="div-subpost">
			<img class="subpost-img" src="/resources/images/ellipsis-solid.svg">
			<img class="subpost-img" src="/resources/images/flag-solid.svg">
		</div>
			
		<hr>
		<div id="subinfo">
			<div>
				등록일자 <fmt:formatDate value="${info.product_date }" pattern="yyyy-MM-dd" />
			</div>
			<div style="float:right;">
				조회수 ${info.product_readcount }
			</div>
		</div>
		<div id="title">
			<h2>${info.product_title }</h2>
		</div>
		
		<div id="category">
			${info.product_cate }
		</div>
		가격 : <fmt:formatNumber value="${info.product_price }" pattern="#,###"/>원
		<div id="content">
		<p>${info.product_content }</p>
		</div>
	
<c:if test="${not empty id}">
<div class="div-likeit" data-product-num="${info.product_num}" data-seller="${info.product_seller}" data-svg-visible="false" style="float:right;">
	
	<?xml version="1.0" ?><svg class="svg-1" style="display:none;" height="24" version="1.1" width="24" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><g transform="translate(0 -1028.4)"><path d="m7 1031.4c-1.5355 0-3.0784 0.5-4.25 1.7-2.3431 2.4-2.2788 6.1 0 8.5l9.25 9.8 9.25-9.8c2.279-2.4 2.343-6.1 0-8.5-2.343-2.3-6.157-2.3-8.5 0l-0.75 0.8-0.75-0.8c-1.172-1.2-2.7145-1.7-4.25-1.7z" fill="#c0392b"/></g></svg>
	
	<?xml version="1.0" ?><!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'><svg class="svg-2" style="display:block;" enable-background="new 0 0 48 48" height="22px" id="Layer_1" version="1.1" viewBox="0 0 48 48" width="22px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path clip-rule="evenodd" d="M24.804,43.648L24,44l-0.804-0.352C12.862,37.313,2,22.893,2,14.884  C2.035,8.326,7.404,3.002,14,3.002c4.169,0,7.849,2.128,10,5.349c2.151-3.221,5.831-5.349,10-5.349c6.596,0,11.965,5.324,12,11.882  C46,22.893,35.138,37.313,24.804,43.648z M34,4.993c-3.354,0-6.469,1.667-8.335,4.46L24,11.946l-1.665-2.494  C20.469,6.66,17.354,4.993,14,4.993c-5.484,0-9.971,4.442-10,9.891c0,7.064,10.234,20.808,20,26.917  c9.766-6.109,20-19.852,20-26.907C43.971,9.435,39.484,4.993,34,4.993z" fill-rule="evenodd"/></svg>

</div>
</c:if>

		</div>
		
	</section>
	<div class="fixed">
		<div class="div-chat">
		<?xml version="1.0" ?><svg id="goto-list" style="enable-background:new 0 0 100.4 100.4;" version="1.1" viewBox="0 0 100.4 100.4" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M79.1,10.1H63.2V3.3c0-0.8-0.7-1.5-1.5-1.5H38c-0.8,0-1.5,0.7-1.5,1.5v6.8H19.7c-3.5,0-6.3,2.8-6.3,6.3v75.4   c0,3.5,2.8,6.3,6.3,6.3h59.5c3.5,0,6.3-2.8,6.3-6.3V16.4C85.4,12.9,82.6,10.1,79.1,10.1z M38,29.5h23.7c0.8,0,1.5-0.7,1.5-1.5v-6.5   h10.5v64.7H25.1V21.6h11.4V28C36.5,28.9,37.2,29.5,38,29.5z M60.2,4.8V20c0,0,0,0,0,0s0,0,0,0v6.5H39.5v-6.5c0,0,0,0,0,0s0,0,0,0   v-8.5c0,0,0,0,0,0s0,0,0,0V4.8L60.2,4.8L60.2,4.8z M82.4,91.7c0,1.8-1.5,3.3-3.3,3.3H19.7c-1.8,0-3.3-1.5-3.3-3.3V16.4   c0-1.8,1.5-3.3,3.3-3.3h16.8v5.5H23.6c-0.8,0-1.5,0.7-1.5,1.5v67.7c0,0.8,0.7,1.5,1.5,1.5h51.6c0.8,0,1.5-0.7,1.5-1.5V20.1   c0-0.8-0.7-1.5-1.5-1.5h-12v-5.5h15.9c1.8,0,3.3,1.5,3.3,3.3V91.7z"/><path d="M28.8,46.4c0,0.8,0.7,1.5,1.5,1.5h38.5c0.8,0,1.5-0.7,1.5-1.5s-0.7-1.5-1.5-1.5H30.3C29.5,44.9,28.8,45.6,28.8,46.4z"/><path d="M68.8,55.4H30.3c-0.8,0-1.5,0.7-1.5,1.5s0.7,1.5,1.5,1.5h38.5c0.8,0,1.5-0.7,1.5-1.5S69.6,55.4,68.8,55.4z"/><path d="M68.8,66.4H30.3c-0.8,0-1.5,0.7-1.5,1.5c0,0.8,0.7,1.5,1.5,1.5h38.5c0.8,0,1.5-0.7,1.5-1.5C70.3,67.1,69.6,66.4,68.8,66.4z   "/></g></svg>
		목록으로
		</div>
		
		<!-- 채팅하기 -->
		<!-- 접속한 회원 정보와 판매자가 다를 경우만 활성화 -->
		<c:if test="${info.product_seller ne id }">
			<div class="div-chat">
			<?xml version="1.0" ?>
			<svg id="svg-chat" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:#101820;}</style></defs><title/><g data-name="Layer 25" id="Layer_25"><path class="cls-1" d="M24,22a1,1,0,0,1-.64-.23L18.84,18H17A8,8,0,0,1,17,2h6a8,8,0,0,1,2,15.74V21a1,1,0,0,1-.58.91A1,1,0,0,1,24,22ZM17,4a6,6,0,0,0,0,12h2.2a1,1,0,0,1,.64.23L23,18.86V16.92a1,1,0,0,1,.86-1A6,6,0,0,0,23,4Z"/><rect class="cls-1" height="2" width="2" x="19" y="9"/><rect class="cls-1" height="2" width="2" x="14" y="9"/><rect class="cls-1" height="2" width="2" x="24" y="9"/><path class="cls-1" d="M8,30a1,1,0,0,1-.42-.09A1,1,0,0,1,7,29V25.74a8,8,0,0,1-1.28-15,1,1,0,1,1,.82,1.82,6,6,0,0,0,1.6,11.4,1,1,0,0,1,.86,1v1.94l3.16-2.63A1,1,0,0,1,12.8,24H15a5.94,5.94,0,0,0,4.29-1.82,1,1,0,0,1,1.44,1.4A8,8,0,0,1,15,26H13.16L8.64,29.77A1,1,0,0,1,8,30Z"/></g></svg>
			판매자와 <br>채팅하기</div>
			<form id="chat-to-seller" action="/chatroom-select" method="GET">
				<input type="hidden" value="${info.product_num}" name="product_num" readonly >
				<input type="hidden" value="${info.product_seller}" name="seller" readonly >
			 </form>
		 </c:if>
		 <!-- 채팅하기 -->
		 
	</div>
	<div class="prodInfo">
	<hr>
	<h4> 이런 제품은 어떠세요? </h4>
	
	<div id="rec"></div>
	
	</div>
							<div id="toast" class="toast"></div>
							
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
	<script type="text/javascript">
	function showToast(message, duration = 3000) {
		const toastElement = document.getElementById('toast');
		toastElement.innerText = message;
		toastElement.classList.add('show');

		setTimeout(() => {
			toastElement.classList.remove('show');
		}, duration);
	}
	
	$(document).ready(function() {
        
        function heartChange($svg1, $svg2, pnum, seller) {
	        $svg1.on('click', function(event) {
	            $.ajax({
	                type: 'GET',
	                url: '/product/likeProdCancel',
	                data: {product_num: pnum, seller: seller},
	                success: function() {
	                    //console.log('success Del');
	                    $svg1.hide();
	                    $svg2.show();
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    console.log('Failed to cancel like');
	                    console.log(jqXHR.responseText);
	                    console.log(textStatus);
	                    console.log(errorThrown);
	                }
	            });
	        });

	        $svg2.on('click', function(event) {
	            $.ajax({
	                type: 'GET',
	                url: '/product/likeProd',
	                data: {product_num: pnum, seller: seller},
	                success: function() {
	                	//console.log('success Reg');
	                	showToast('찜 완료!', 3000);
	                	$svg2.hide();
	                    $svg1.show();
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    console.log("Save Failed");
	                    console.log(jqXHR.responseText);
	                    console.log(textStatus);
	                    console.log(errorThrown);
	                }
	            });
	        });
	    }
	    
	    $(".div-likeit").each(function() {
	    	
	    	var $div = $(this);
	        var pnum = $div.data('product-num');
	        var seller = "${id}";
	        var $svg1 = $div.find('.svg-1');
	        var $svg2 = $div.find('.svg-2');

	        $.ajax({
	        	type: 'GET',
	        	url: '/product/memlikeCheck',
	        	data: {product_num: pnum, seller: seller},
	        	success: function(response){
	        		if(response){
	        			$svg2.hide();
	        			$svg1.show();
	        		}else{
	        			$svg1.hide();
	        			$svg2.show();
	        		}
	        		heartChange($svg1, $svg2, pnum, seller)
        		},
        		error: function(response){
        			console.log(pnum + '번 상품 찜 확인 실패');
	        	}
	        });
	    });
	    
	    
	    
	    var category = "";
        $.ajax({
        	type: "POST",
        	url: "/product/recProd",
            dataType: "JSON",
            data: {
                category: "${info.product_cate}"
            },
            success: function (response) {
            	var productHtml = '<div class="grid-container">';
            	for (var i = 0; i < response.length && i < 8; i++) {
            	  if (response[i].product_num != ${info.product_num}) {
            	    productHtml += '<div class="grid-item">';
            	    productHtml += '<a class="product-section" href="/product/prodInfo?product_num=' + response[i].product_num + '&seller=' + response[i].product_seller + '">';
            	    //productHtml += '<img src="/resources/images/thumb/thumb_' + response[i].product_pic.split(',')[0] + '" onerror="this.src=\'/resources/images/default_product.jpg\'" />';
            	    productHtml += '<img src="/product/thumb?fileName=' + response[i].product_pic.split(',')[0] + '" onerror="this.src=\'/resources/images/default_product.jpg\'" />';
            	    productHtml += '<div>' + response[i].product_title + '</div>';
            	    productHtml += '<div class="product-content">' + response[i].product_content + '</div>';
            	    productHtml += '</a>';
            	    productHtml += '</div>';
            	  }
            	}
            	productHtml += '</div>';

            	$('#rec').html(productHtml);


            },
            error: function (req, stat, error) {
                console.log(req + " - 에러발생 - " + error);
            }
        });
    });
	
	$("#svg-chat").on('click', function(){
		$("#chat-to-seller").submit();
	});
	
	$("#goto-list").on('click', function(){
		location.href="/product/prodList";
	});
	


	</script>
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>