<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.shippingStatusContainer .text{
  font-size: 31px;
  font-weight: normal;
  color: #769fcd;
  font-weight : bold;
  text-align: center;
}
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
  text-decoration: none;
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
  border-bottom: solid 5px #769fcd;
} 

/* .infoContainer .item > div:first-child{
  margin-bottom: 2px;
} */



/*  */
.listContainer .item:hover{
/*   background-color: #f8f8f8; */
}
.infoContainer .item:hover{
/*   background-color: #f8f8f8; */
}
.my-page-profile__image {
    width: 250px;
    height: 150px;
    border-radius: 50%;
    margin-bottom: 45px;
    float: right;
}
.my-page__edit-buttons{
	margin-top: 10px;
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
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<%@ include file="../include/header.jsp" %>
								<%@ include file="../include/myPage.jsp" %>
								
									 	<div class="shippingStatusContainer">
										<section>
									<header class="major">
									
									</header>
									<div class="posts">
							
							<article>
								
									
          
									
								<div class="image-container">
									<div class="my-page-profile">
								<img  src="${memberInfo.member_pic } " class="my-page-profile__image"
									alt = "프로필 사진 " onerror="this.src='/resources/images/default_my_profile.png'">
							   		 </div>   
							     
							     </div>
							
								</article>
								
								
								
								<article>
								<div style="margin-left: 10px;">	
									
					          <div style="font-size: 27px; color : #769fcd;">${memberInfo.member_nickname } 님 
					          	 <span style="font-size: 27px;">${score}</span> 
				          	  </div>
						       	   <div style="font-size: 27px; color : #769fcd;">페이 : ${memberInfo.member_pay }원</div>
						    			
						    
						         <div class="my-page__edit-buttons">
					              <button type="button" class="my-info-edit">
					                <i class="fas fa-cog my-info-edit__icon"></i>
					                <span class="my-info-edit__text">회원 정보 변경</span>
					              </button>
					            </div>
						        
						        <div class="my-page__edit-buttons">
					              <button type="button" class="my-info-delete">
					                <i class="fas fa-cog my-info-edit__icon"></i>
					                <span class="my-info-edit__text">회원 탈퇴</span>
					              </button>
					            </div>
						       
						        </div>	         
								</article>
									
									      
									      
									</div>
								</section>
									</div>
									
	
						</div>
					</div>

					<%@ include file="../include/sidebar.jsp" %>
			</div>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">
$('.my-info-edit').on('click', function() {
	  window.location.href = '/members/updatePwCk';
	});

$('.my-info-delete').on('click', function() {
	  window.location.href = '/members/deletePwCk';
	});



</script>


	</body>
</html>