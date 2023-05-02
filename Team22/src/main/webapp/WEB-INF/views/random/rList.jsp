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
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		 <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
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
			        
			        $('#time').html("남은 시간 : " + days + "일 " + hours +":" + minutes + ":"+seconds);
			        
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
						$('#time').html("경매 종료");

					}
			    }
				timer = setInterval(setTimer, 1000);
			});
			
		</script>
		
		<style>
			#subSpan{
				position: relative;
				  width: 250px;
				  height: 180px;
				  overflow: hidden;
				  margin: 50px;
			}
		
			#subPic{
				width:100%; 
				height:100%; 
				
			}
		
		</style>
		
		
		
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<%@ include file="../include/header.jsp" %>

							<!-- Banner -->
							<c:if test="${best != null }">
								<section id="banner">
									<div class="content">
										<header style="text-align: center;">
											<h1>HOT<br/>
											${best.au_title }</h1>
											<p>기간 : ${best.au_endTime }<br>
											시작가 : ${best.au_startPrice }<br>
											현재 입찰금 : ${best.au_bidPrice }<br>
											즉시 구매가 : ${best.au_endPrice }<br>
											판매자 : ${best.au_sellerId } </p>
											
											<ul class="actions" style="text-align: center;">
												<li class="button" id="time" style="text-align: center; width:230px"></li>
												<li><a href="/auction/aDetail?au_num=${best.au_num }" class="button">입찰하기</a></li>
											</ul>
											
											<input type="hidden" value="${best.au_endTime }" id="endDate">
											
										</header>
										
									</div>
									<span class="image object">
										<img src="/random/download?fileName=${best.au_pic.replace('[','').replace(']','').split(',')[0]} " style="width:644.7px; height:438.4px" />
									</span>
								</section>

							</c:if>
							<!-- Section -->
								<section style="padding-top:20px">
								
									<header class="major">
										<h2 style="margin-bottom:10px">경매 물품</h2>
										<a href='/auction/aRegist'>상품 등록하기</a>
									</header>
									<section id="search" class="alt" style="display: inline-block; float: right;">
										<form method="get" action="/auction/list" style="display: flex">
											<select name="type" class="button" style="margin-right: 10px">
												<option value="au_title">제목</option>
												<option value="au_sellerId">판매자</option>
											</select>
											<input type="text" name="search" placeholder="검색할 단어입력" style="width: 300px;"/>
										</form>
									</section>
									
									<a href="/auction/list?order=au_bidPrice&met=asc" class="button" style="display: inline-block; float: left; margin-right:10px">가격순</a>
									<a href="/auction/list?order=best" class="button" style="display: inline-block; float: left; margin-right:10px">인기순</a>
									<a href="/auction/list" class="button" style="display: inline-block; float: left; margin-right:10px">최신순</a>
									<a href="/auction/myList" class="button" style="display: inline-block; float: left; margin-right:10px">경매 결과 확인	</a>
									
									<div class="features">
									<c:forEach items="${rList }" var="rList">
										<article style="text-align: center; border: solid 3px #769fcd; margin:20px">
											<span id="subSpan"><img id="subPic" src="/random/download?fileName=${rList.ran_pic.replace('[','').replace(']','').split(',')[0]}" /></span>
											<div class="content">
												<h3>${rList.ran_title }</h3>
												<p>
												응모금액 : ${rList.ran_bidPrice }<br>
												응모가능 인원 : ${rList.ran_maxPp }<br>
												판매자 : ${rList.ran_sellerId }<br>
												종료시간 : ${rList.ran_endTime }<br>
												<a href="/random/rDetail?ran_num=${rList.ran_num }" class="button">응모하기</a></p>
											</div>
										</article>
									</c:forEach>
									</div>
									
									<ul class="pagination" style="text-align: center;">
										<c:if test="${pageDTO.prev == true }">
											<li><a href="/auction/list?page=${pageDTO.cri.page - 1}" class="button">Prev</a></li>
										</c:if>
										<c:if test="${pageDTO.prev == false }">
											<li><a href="/auction/list?page=${pageDTO.cri.page - 1}" class="button disabled ">Prev</a></li>
										</c:if>
										<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="i">
										
											<c:if test="${pageDTO.cri.page == i}">
												<li><a href="/auction/list?page=${i }" class="page active">${i }</a></li>
											</c:if>
											<c:if test="${pageDTO.cri.page != i}">
												<li class="page"><a href="/auction/list?page=${i }">${i }</a></li>
											</c:if>
											
										</c:forEach>
			
										<c:if test="${pageDTO.next == true }">
											<li><a href="/auction/list?page=${pageDTO.cri.page + 1 }" class="button">Next</a></li>
										</c:if>
										<c:if test="${pageDTO.next == false }">
											<li><a href="/auction/list?page=${pageDTO.cri.page + 1 }" class="button disabled">Next</a></li>
										</c:if>
									</ul>
								</section>
						</div>
					</div>

				<%@ include file="../include/sidebar.jsp" %>

			</div>


	</body>
</html>