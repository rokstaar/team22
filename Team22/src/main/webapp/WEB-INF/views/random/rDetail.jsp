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
				
				/* function ubid(){
					$.ajax({
						url:"/auction/uBid",
						data:{
							au_num:'${vo.ran_num}'
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
				} */
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
						clearInterval(timer);
						$("#time").html("경매 종료");
					}
			    }
				timer = setInterval(setTimer, 1000);
				
				$('.subPic').hover(function(){
					$('.mainPic').attr("src", $(this).attr("src"));
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
						<%@ include file="../include/header.jsp" %>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
										<f:parseDate value="${vo.ran_endTime}" var="format" pattern="yyyy-MM-dd HH:mm:ss"/>
										<f:formatDate var="endTime" value="${format}" pattern="yyyy-MM-dd HH:mm:ss"/>
										<input type="hidden" value="${endTime }" id="endDate">
										<f:formatNumber value="${pay }" pattern="#,###" var="myPay"/>
										<f:formatNumber value="${vo.ran_price }" pattern="#,###" var="Price"/>
										<f:formatNumber value="${vo.ran_bidPrice }" pattern="#,###" var="bidPrice"/>
											<h1>${vo.ran_title }<br/></h1>
											<p>
											판매자 : ${vo.ran_sellerId }<br>
											시작가 : ${Price }<br>
											</p> 
											<p class="button" id="time"></p>
											<p class="button" id="nowBid">응모 금액 : ${bidPrice }</p><br>
											
											<input type="hidden" id="uBid" value="${vo.ran_bidPrice }">
											<input type="hidden" id="lastBuyer" value="${vo.ran_buyerId }">
											<input type="hidden" id="myPay" value="${pay }">
											
											
											
										</header>
										<form action="">
											<ul class="actions">
											<c:if test="${id != null }">
												<li><p class="button" id="rPay">${id }님의 보유금액 : ${myPay }</p></li>
											</c:if>
												<hr>
												<li><a class="button">응모현황 ${countP} / ${vo.ran_maxPp }</a></li>
												<li><a class="button" id="bid">응모하기</a></li>
											</ul>
										</form>
									</div>
									
									<c:set value="${vo.ran_pic.replace('[','').replace(']','').split(', ')}" var="down" />
									
									<span class="image object">
										<img class="mainPic" src="/random/download?fileName=${down[0]}" style="width:644.7px; height:438.4px; margin-bottom: 30px " />
										<c:forEach items="${down}" var="dList">
											<img class="subPic" src="/random/download?fileName=${dList}" style="width:70px; height:70px; float:left; margin-right: 10px " />
										</c:forEach>
									</span>
								</section>

							<!-- Section -->
								<section>
									<div class="col-12">
										<textarea name="au_content" id="au_content" rows="6" style="width:100%" readonly="readonly">${vo.ran_content }</textarea>
										<a style="margin-top: 20px; float:right;" class="button" href="/random/rList">목록</a>
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

			<%@ include file="../include/sidebar.jsp" %>
			</div>


	</body>
</html>