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
				<a href="/members/memberInfo?mem_id=${userInfo[0].product_seller }" class="item"> ${userInfo[0].member_nickname }님 판매상품</a> 
				<a href="/members/review?mem_id=${userInfo[0].product_seller }" class="item">${userInfo[0].member_nickname }님 거래후기</a>
			</div>
			
			
			<section>
				<c:forEach var = "vo" items="${memReview }">
				<article>
					<div class="shippingStatusContainer">
						<table class="bbsList">
							<thead class="head">
									<tr>
										<th>상품</th>
										<th>상품명</th>
										<th>리뷰내용</th>
										<th>구매자</th>
									</tr>
								</thead>
								
								<tbody class="body">
									<c:forEach var = "vo" items="${memReview }">
										<td>
											<img src="/resources/images/${vo.product_pic.split(',')[0] }" 
							       			onerror="this.src='/resources/images/default_product.jpg'" width="80px" height="60px">
										</td>
										<td>
											${vo.product_title}
										</td>
										<td>
											<span onclick="window.location.href='/product/prodInfo?product_num=${vo.product_num }&seller=${vo.reviewee}'">
											${vo.rv_content}
											</span>
										</td>
										<td>
											<span onclick="window.location.href='/members/memberInfo?mem_id=${vo.reviewer}'">
											${vo.reviewer}
											</span>
										</td>
									</c:forEach>
								</tbody>
							</table>
						</div>
				</article>
				</c:forEach>
			</section>
	</div>
	</div>
		<%@ include file="../include/sidebar.jsp" %>
</div>
</body>
</html>