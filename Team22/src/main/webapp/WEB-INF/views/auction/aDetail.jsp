<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				function ubid(){
					$.ajax({
						url:"/auction/uBid",
						data:{
							au_num:'${vo.au_num}'
						},
						dataType:"JSON",
						success:function(data){
							$('#uBid').attr("value", data.bid);
							$('#nowBid').html('현재 입찰금 : ' + data.bid.toLocaleString("ko-KR"));
							$('#myPay').attr("value", data.pay);
							$('#rPay').html('${id }' + '님의 보유금액 : '+data.pay.toLocaleString("ko-KR"));
							$('#lastBuyer').attr("value", data.buyer);
							
						}
					});
				}
				//setInterval(ubid,1000);
				
				var timer; 
				
				function setTimer(){
					var now = new Date();
					var endDate = new Date($('#endDate').val());
					var distance = endDate - now.getTime();
					
					var second = 1000;
				    var minute = second * 60;
				    var hour = minute * 60;
				    var day = hour * 24;
				    
				    var days = Math.floor(distance / day);
			        var hours = Math.floor((distance % day) / hour);
			        var minutes = Math.floor((distance % hour) / minute);
			        var seconds = Math.floor((distance % minute) / second);
			        
			        $("#time").html("남은 시간 : " + days + "일 " + hours +":" + minutes + ":"+seconds);
			        
			        if (distance < 0){
						alert('종료된 경매');
						clearInterval(timer);
						$.ajax({
							url:'/auction/endDate',
							type:'GET',
							data:{
								num : '${vo.au_num}'
							}
						});
						$("#time").html("경매 종료");
						/* location.href='/auction/list'; */
					}
			    }
				timer = setInterval(setTimer, 1000);
				
				$('#bid').click(function(){
					
					if(${id == null}){
						if(confirm('로그인 필요. 로그인 페이지로 가시겠습니까?')){
							location.href='/members/login';
							return false;
						}else{
							return false;
						}
					}
					if($('#lastBuyer').val() == '${id}'){
						alert('상회입찰중 입니다.');
						return false;
					}
					
					if(${vo.au_sellerId.equals(id) }){
						alert('나의 경매에 참여할수 없습니다.');
						return false;
					}
					if($("#au_bidPrice").val() == ""){
						alert('입찰할 금액을 입력하세요');
						return false;
					}
					if($("#au_bidPrice").val() < $("#uBid").val()){
						alert('현재 입찰가보다 작은 금액을 입력했습니다.');
						return false;
					}
					if(parseInt($("#au_bidPrice").val()) > parseInt($("#myPay").val())){
						if(confirm('페이가 부족합니다. 충천하시겠습니까?')){
							alert('페이충전페이지로');
							return false;
						}else{
							return false;
						}
					}
					
					if(confirm($('#au_bidPrice').val() + '원 입찰하시겠습니까?')){
						$.ajax({
							url:'/auction/bid',
							data:{
								au_num:'${vo.au_num}',
								au_startPrice:'${vo.au_startPrice}',
								au_sellerId:'${vo.au_sellerId}',
								bidPrice:$("#au_bidPrice").val(),
								au_endPrice:'${vo.au_endPrice}',
								au_endTime:'${vo.au_endTime}',
								au_pic:'${vo.au_pic}',
								au_title:'${vo.au_title}',
								au_content:'${vo.au_content}',
								au_category:'${vo.au_category}',
								lastBuyer:$("#lastBuyer").val(),
								lastBid:$("#ubid").val()
							},
							success:function(data){
								console.log(data);
								$('#nowBid').html('현재 입찰금 : ' + data[0].toLocaleString("ko-KR"));
								$('#myPay').html('${id }' + '님의 보유금액 : '+data[1].toLocaleString("ko-KR"));
							}
							
						});
					}else{
						alert('취소하셨습니다.');
						return false;
					}
				});
				
			});
			
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
									<a href="index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
									<ul class="icons">
										<c:if test="${id == null }">
											<li><a href="/members/login"><span class="label">로그인</span></a></li>
										</c:if>
										<c:if test="${id != null }">
											<li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
										</c:if>
										<li><a href="#" class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon fa-medium"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
										<f:parseDate value="${vo.au_endTime}" var="format" pattern="yyyy-MM-dd HH:mm:ss"/>
										<f:formatDate var="endTime" value="${format}" pattern="yyyy-MM-dd HH:mm:ss"/>
										<input type="hidden" value="${endTime }" id="endDate">
										<f:formatNumber value="${pay }" pattern="#,###" var="myPay"/>
										<f:formatNumber value="${vo.au_startPrice }" pattern="#,###" var="startPrice"/>
										<f:formatNumber value="${vo.au_endPrice }" pattern="#,###" var="endPrice"/>
										<f:formatNumber value="${vo.au_bidPrice }" pattern="#,###" var="bidPrice"/>
											<h1>${vo.au_title }<br/></h1>
											<p>
											판매자 : ${vo.au_sellerId }<br>
											시작가 : ${startPrice }<br>
											즉시 구매가 : ${endPrice }<br>
											</p> 
											<p class="button" id="time"></p>
											<p class="button" id="nowBid">현재 입찰금 : ${bidPrice }</p><br>
											<input type="hidden" id="uBid" value="${vo.au_bidPrice != null? vo.au_bidPrice : 0 }">
											<input type="hidden" id="lastBuyer" value="${vo.au_buyerId != null? vo.au_buyerId : '' }">
											<input type="hidden" id="myPay" value="${pay }">
											
											
											
										</header>
										<form action="">
											<ul class="actions">
											<c:if test="${id != null }">
												<li><p class="button" id="rPay">${id }님의 보유금액 : ${myPay }</p></li>
											</c:if>
												<hr>
												<li><input type="text" id="au_bidPrice" placeholder="입찰할 금액 입력"></li>
												<li><a class="button" id="bid">입찰하기</a></li>
												<li><a class="button" id="nowBuy">즉시구매하기</a></li>
											</ul>
										</form>
									</div>
									<span class="image object">
										<img src="/resources/images/${vo.au_pic.split(',')[1] }" style="width:644.7px; height:438.4px" />
									</span>
								</section>

							<!-- Section -->
								<section>
									<div class="col-12">
										<textarea name="au_content" id="au_content" rows="6" style="width:100%" readonly="readonly">${vo.au_content }</textarea>
									</div>
								</section>

							<!-- Section -->
								<!-- <section>
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
								</section> -->

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
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
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="index.html">Homepage</a></li>
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
											<a href="#" class="image"><img src="resources/images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="resources/images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="resources/images/pic09.jpg" alt="" /></a>
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
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>