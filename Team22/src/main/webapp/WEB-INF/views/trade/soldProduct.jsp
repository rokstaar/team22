<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Page</title>
<style type="text/css">
.sold-out {
  filter: brightness(35%);
  opacity: 0.5;
}

.image-container {
  position: relative;
  display: inline-block;
}

.sold-out-text {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: rgba(0, 0, 0, 0.8);
  color: #fff;
  text-align: center;
  font-size: 18px;
  font-weight: bold;
  padding: 32px 0;
  pointer-events: none;
}

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
				<a href="/trade/mySaleProduct" class="item">판매중</a> 
				<a href="/trade/soldProduct" class="item">판매완료</a>
			</div>
			
			<div class="info">
				<button class="button" 
						onclick="location.href='/trade/soldProduct'">일반</button>
				<button class="button" 
						onclick="location.href='/trade/soldAuction'">경매</button>
				<button class="button" 
						onclick="location.href='/trade/soldRandom'">응모</button>
			</div>			  
									
			<div class="posts">
				<c:forEach var="vo" items="${soldProdList }">
				<article>
					<div class="product-section" 
					onclick="location.href='/product/prodInfo?product_num=${vo.prod_num }&seller=${vo.sell_mem_id}'">
					<div class="img-wrapper">
						<div class="image-container">
							<img class="sold-out" src="/resources/images/${vo.product_pic.split(',')[0] } " width="511px" height="306px" 
							onerror="this.src='/resources/images/default_product.jpg'">
						</div>
						<div class="sold-out-text">판매 완료</div>
					</div>
								
					<div>구매자 : ${vo.buy_mem_id }</div>
					
					<div style="float:left;">
					<div>상품명 : ${vo.product_title }</div>
						 가격 : <fmt:formatNumber value="${vo.product_price }" pattern="#,###" />원
					</div>
				</div>	
									
			<button type="button" class="sold-prod-delete" style="float: right; opacity: 1;">
					                <i class="fas fa-cog my-info-edit__icon"></i>
					                <span class="my-info-edit__text">상품 삭제</span>
					              </button>
		
			<form role="form" method="post">
					<input type="hidden" name="prod_num" value="${vo.prod_num }">
								
				</form>	
			
			</article>
				
			</c:forEach>
		</div>
	</div>
	</div>
	
<%@ include file="../include/sidebar.jsp" %>
</div>

<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/skel.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>
<script type="text/javascript">


	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".sold-prod-delete").click(function(){
		// 폼태그 이동 주소 설정 /boards/modify
		formObj.attr("action","/trade/soldProdRemove")
		// 폼태그 정보 저장해서 페이지이동
		formObj.submit();	
	});
	
	var result = "${result}";
	
	if(result == "delOK"){
		alert("판매완료 상품 삭제 !");		
	}	

</script>

	</body>
</html>