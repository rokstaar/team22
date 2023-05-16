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
<title>My Page</title>
	
<style type="text/css">

#sidebar.force-inactive{
	margin-left: -26em;
}

body{
  padding: 0;
  margin: 0;
}

div{
  box-sizing: border-box;
}

/* alert badge */
.circle{
  display: inline-block;
  width: 5px;
  height: 5px;
  border-radius: 2.5px;
  background-color: #ff0000;
  position: absolute;
  top: -5px;
  left: 110%;
}

/* 파랑색 테스트 */
.rightBlue{
  color: #3F72AF;
}

.wrap{
  background-color: #F8F8F8;  
}
/* 녹색배경 */
.greenContainer{  
  height: 132px;
  background-color: #24855b;    
  
  display: flex;
  align-items: flex-end;
  padding: 16px;
}

.greenContainer .name{
   font-size: 20px;
  font-weight: bold;
  color: #ffffff;
} 
.greenContainer .modify{
  margin-left: auto;
}

/* 단골상점 , 상품후기 , 적립금 박스 */
.summaryContainer{
  background-color: white;  
  display: flex;  
  padding: 21px 16px;  
  height: 90px;
  margin-bottom: 10px;
}
/* 단골상점 , 상품후기 , 적립금 */
.summaryContainer .item{
  flex-grow: 1
}
/* 파란 숫자 */
.summaryContainer .rightBlue{
  font-size: 19px;
  font-weight: bold;
  color: #3F72AF;
}
/* 텍스트 */
.summaryContainer .item > div:nth-child(2){
  font-size: 13px;
}

/* ================== 주문/배송조회 박스 시작 ==================== */
.shippingStatusContainer{
  padding: 21px 16px;
  background-color: white;
  margin-bottom: 10px;
}

/* 주문/배송조회 타이틀 */
.shippingStatusContainer .title{
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.shippingStatusContainer .status{
  display: flex;
  justify-content: space-between;
  margin-bottom: 21px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.shippingStatusContainer .item{
  display: flex;
}

.shippingStatusContainer .number{
  font-size: 31px;
  font-weight: 500;
  text-align: center;
}
/* .shippingStatusContainer .text{
  font-size: 14px;
  font-weight: normal;
  color: black;
  font-weight : bold;
  text-align: center;
} */
.shippingStatusContainer .memberUpdate{
  font-size: 14px;
  font-weight: normal;
  color: #769fcd;
  font-weight : bold;
  text-align: center;
}
.shippingStatusContainer .icon{
  display: flex;
  align-items: center;
  padding: 20px;
  width: 16px;
  height: 16px;
}


/*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
.listContainer{  
  padding: 0;
  background-color: #ffffff;
  margin-bottom: 10px;
}
.listContainer .item{  
  display: flex;
  align-items: center;
  padding: 16px;
  color: black;
  text-decoration: none;  
  height: 56px;
  box-sizing: border-box;
}
.listContainer .icon{  
  margin-right: 14px;
}
.listContainer .text{
  font-size: 16px;
  position: relative;
}
.listContainer .right{
  margin-left: auto;
}


/*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
.listContainer .smallLight{
  font-size: 14px;
  color: #c2c2c2;  
}
.listContainer .smallLight > span{
  margin-left: 10px;
}

.listContainer .right .blct{
  font-size: 14px;
  font-weight: bold;
  margin-right: 5px;
}



/* 공지사항 이용안내 고객센터 */
.infoContainer{
  background-color: white; 
  display: flex;
  height: 100px;
  margin-bottom: 10px;    
}

/* .infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 13px;
  text-decoration: none;
  color: black;
} */
.infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 23px;
  text-decoration: none;
  color: 769fcd;
  font-weight: bold;
}
.infoContainer .item > div:first-child{
  margin-bottom: 2px;
}



/*  */
.listContainer .item:hover{
/*   background-color: #f8f8f8; */
}
.infoContainer .item:hover{
/*   background-color: #f8f8f8; */
}
		
</style>

	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="/resources/assets/css/main.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>

	<body>
		<!-- Wrapper -->
				<!-- Sidebar -->
					<div id="sidebar" class="inactive force-inactive">
						<div class="inner">

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="/product/prodList?category=의류">의류</a></li>
										<li><a href="/product/prodList?category=가전제품">가전제품</a></li>
										<li><a href="/product/prodList?category=식기,가구">식기,가구</a></li>
										<li><a href="/product/prodList?category=디지털,전자기기">디지털,전자기기</a></li>
										<li><a href="/product/prodList?category=식품,생필품">식품,생필품</a></li>
										<li><a href="/product/prodList?category=스포츠,건강">스포츠,건강</a></li>
										<li><a href="/product/prodList?category=기기,공구">기기,공구</a></li>
										<li><a href="/product/prodList?category=도서,쿠폰">도서,쿠폰</a></li>
										<li><a href="/product/prodList?category=유아">유아</a></li>
										<li><a href="/product/prodList?category=애완동물">애완동물</a></li>
										<li><a href="/product/prodList?category=기타">기타</a></li>
									</ul>
								</nav>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>게시판</h2>
									</header>
									<div class="mini-posts">								
								      <article>
									     <a href="/cs/cslist?num=1"> <p style="color: #3d4449;">고객센터</p> </a>
									   </article>
									   
									   <article>
										   <a href="/admin/notice?num=1"> <p style="color: #3d4449;">공지사항</p> </a>
									   </article>
									</div>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>있지마켓</h2>
									</header>
									<h4>있지마켓은 
									<br>이웃간의 합리적인 중고거래를 지원합니다.</h4><br>
									<ul class="contact">
										<li class="fa-envelope-o"><a href="#">market02@itwill.com</a></li>
										<li class="fa-phone">(051) 803 - 0909</li>
										<li class="fa-home">부산광역시 부산진구 부전동 동천로 109 <br>
										삼한골든게이트 아이티윌 7층</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

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