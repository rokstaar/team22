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
				<c:forEach begin="0" var="i" end="${buyAuctionList.size() }">
				<article>
				<div class="product-section" 
					 onclick="location.href='/auction/aDetail?au_num=${buyAuctionList[i].au_num }'">
					<div class="img-wrapper">
						<img src="/resources/images/${buyAuctionList[i].au_pic.split(',')[0] } " width="511px" height="306px" 
						onerror="this.src='/resources/images/default_product.jpg'">
					</div>
					<div>${buyAuctionList[i].au_title }</div>
										
					<div style="float:left;">
						최고 금액 : <fmt:formatNumber value="${getAList[i].au_bidPrice }" pattern="#,###" />원
					</div><br>
										
					<div style="float:left;">
						입찰 금액 : <fmt:formatNumber value="${buyAuctionList[i].au_bidPrice }" pattern="#,###" />원
					</div><br>
											
					<div style="float:left;">
						<div>경매 종료시간</div>
						${buyAuctionList[i].au_endTime }
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