<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Page</title>
<style type="text/css">
</style>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/myPage.css" />
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">

	<!-- Main -->
	<div id="main">
		<div class="inner">

		<!-- Header -->
		<%@ include file="../include/header.jsp" %>
		<%@ include file="../include/myPage.jsp" %>			
										
			<div class="infoContainer">
				<a href="/trade/myAuctionList" class="item">경매</a> 
				<a href="/trade/myBuyRandomList" class="item">응모</a>
			</div>
		
			<section>
			<div class="posts">
				<c:forEach var="vo" items="${myBuyRandomList }">
				<article>
				<div class="product-section" 
					 onclick="location.href='//random/rDetail?ran_num=${vo.ran_num }'">
					<div class="img-wrapper">
						<img src="/resources/images/${vo.ran_pic.split(',')[0] } " width="511px" height="306px" 
						onerror="this.src='/resources/images/default_product.jpg'">
					</div>
					
					<div>상품명 : ${vo.ran_title }</div>
					<div style="float:left;">
						<div>판매자 : ${vo.ran_sellerId }</div>
							총 가격 : <fmt:formatNumber value="${vo.ran_price }" pattern="#,###" />원<br>
							내 가격 : <fmt:formatNumber value="${vo.ran_bidPrice }" pattern="#,###" />원
						</div>
					<div style="float:right;">
						<div>응모 인원 : ${vo.ran_maxPp }명</div>
					</div>
								
				</div>	
				</article>
				</c:forEach>
			</div>
			</section>
		</div>
	</div>
	
<%@ include file="../include/sidebar.jsp" %>
</div>


<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/skel.min.js"></script>
<script src="/resources/assets/js/util.js"></script>		
<script src="/resources/assets/js/main.js"></script>

</body>
</html>