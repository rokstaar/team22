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
				setInterval(ubid,1000);
				
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
						// 경매시간 만료시 최종 입찰자한테 알림 보내기
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
					if(parseInt($("#au_bidPrice").val()) <= parseInt($("#uBid").val())){
						alert('현재 입찰가보다 큰 금액을 입력하셔야 합니다.');
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
								lastBid:$("#uBid").val()
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
						<%@ include file="../include/header.jsp" %>

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
											<input type="hidden" id="uBid" value="${vo.au_bidPrice }">
											<input type="hidden" id="lastBuyer" value="${vo.au_buyerId }">
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

			<%@ include file="../include/sidebar.jsp" %>
			</div>


	</body>
</html>