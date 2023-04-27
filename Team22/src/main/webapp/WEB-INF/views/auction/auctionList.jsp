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
										</header>
										<ul class="actions" style="text-align: center;">
											<li><a href="/auction/aDetail?au_num=${best.au_num }" class="button">입찰하기</a></li>
										</ul>
									</div>
									<span class="image object">
										<img src="/auction/download?fileName=${best.au_pic.split(',')[1] }" style="width:644.7px; height:438.4px" />
									</span>
								</section>

							</c:if>
							<!-- Section -->
								<section>
								
									<header class="major">
										<h2>경매 등록 물품</h2>
									</header>
									<section id="search" class="alt" style="display: inline-block; float: right;">
										<form method="get" action="/auction/list">
											<input type="text" name="search" placeholder="검색할 단어입력" />
										</form>
									</section>
									
									<a href="/auction/list?order=au_bidPrice&met=asc" class="button" style="display: inline-block; float: right;">가격순</a>
									<a href="/auction/list?order=best" class="button" style="display: inline-block; float: right;">인기순</a>
									
									
									<div class="features">
									<c:forEach items="${aList }" var="aList">
										<article style="text-align: center;">
											<span><img src="/auction/download?fileName=${aList.au_pic.split(',')[1] }" style="width:173.3px; height:173.3; margin-left: 50px" /></span>
											<div class="content">
												<h3>${aList.au_title }</h3>
												<p>현재 입찰가 : ${aList.au_bidPrice }<br>
												판매자 : ${aList.au_sellerId }<br>
												종료시간 : ${aList.au_endTime }<br>
												<a href="/auction/aDetail?au_num=${aList.au_num }" class="button">입찰하기</a></p>
											</div>
										</article>
									</c:forEach>
									</div>
								</section>

						</div>
					</div>

				<%@ include file="../include/sidebar.jsp" %>

			</div>


	</body>
</html>