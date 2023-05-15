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
				<a href="/members/memberInfo?mem_id=${memProdList[0].product_seller }" class="item"> ${userInfo[0].member_nickname }님 판매상품</a> 
				<a href="/members/review?mem_id=${memProdList[0].product_seller }" class="item">${userInfo[0].member_nickname }님 거래후기</a>
			</div>
			
			<section>
			<div class="posts">
				<c:forEach var="vo" items="${memProdList }">
					<article>
					
					<div class="product-section" 
					onclick="location.href='/product/prodInfo?product_num=${vo.product_num }&seller=${vo.product_seller}'">
					<div class="img-wrapper">
						<img src="/resources/images/${vo.product_pic.split(',')[0] } " width="511px" height="306px" 
							onerror="this.src='/resources/images/default_product.jpg'">
							</div>
						<div>상품명 : ${vo.product_title }</div>
						
						<div style="float:left;">
							가격 : <fmt:formatNumber value="${vo.product_price }" pattern="#,###" />원
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
</body>
</html>