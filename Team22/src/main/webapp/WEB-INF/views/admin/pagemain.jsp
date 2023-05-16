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
		<title>admin Page</title>
		
<style type="text/css">
   .my-page {
  width: 35vw;
  min-width: 600px;
  margin:  auto;
  margin-bottom: 0;
  text-align: center;
}

.my-page__title {
  font-weight: 700;
  font-size: 38px;
  margin-bottom: 83px;
  text-align: center;
}

.my-transaction-info {
  /* margin-top: 24px;
  margin-right: 12px;
  width: 23vw; */
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  font-family: "Noto Sans KR", sans-serif;
}

.my-transaction-info__list {
/*    display: flex;
  flex-direction: row;
  justify-content: center;
  gap: 10px;
  list-style: none;
  min-width: 260px; */
  
  display: inline-block;
  justify-content: center;
  align-items: center;
  gap: 10px;
  font-family: "Noto Sans KR", sans-serif;
 
  }

.my-transaction-info__title {
  font-weight: 700;
  font-size: 23px;
  display: inline-block;
  margin-bottom: 24px;
  font-variant: normal;
  font-family: "Noto Sans KR", sans-serif;
  
}

.my-transaction-info__content {
  font-weight: 700;
  font-size: 30px;
  font-family: "Noto Sans KR", sans-serif;
}

.my-page__introduction {
  margin-top: 10px;
  margin-bottom: 24px;
  font-size: 20px;
  min-height: 72px;
  max-height: 170px;
  text-align: center;
  font-family: "Noto Sans KR", sans-serif;
  border-bottom: 2px solid lightgray;
}

.my-page__edit-buttons {
  margin-bottom: 85px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}


.my-profile-edit:active,
.my-info-edit:active {
  opacity: 0.7;
}

.my-profile-edit {
  width: 27vw;
  border: 2px solid #4751FD;
  background-color: white;
  color: #4751FD;
  min-width: 310px;
}

.my-info-edit {
font-family: "Noto Sans KR", sans-serif;
  border: none;
  background-color: #EFEFEF;
  cursor: pointer;
  border-radius: 4px;

}

.transaction-history {
  width: 100%;
  border: 2px solid #000;
  display: flex;
  border-radius: 5px;
}

.transaction-history__sale,
.transaction-history__purchase {
  width: 50%;
  font-weight: 700;
  font-size: 22px;
  height: 71px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}

.transaction-history__sale:active,
.transaction-history__purchase:active {
  opacity: 0.7;
}

.transaction-history__sale {
  border-right: 2px solid #000;





</style>		
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/myPage.css" />
		<link rel="stylesheet" href="/resources/assets/css/styles.css" />
		
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
								 <div class="wrap">
									  <div class="shippingStatusContainer">
									     
									      <%@ include file="../include/adminmypage.jsp" %>

						 <hr>
		 <article class="my-page">	
		  <div class="my-page__profile" style="text-align: center;">			 
     
             	<div class="my-transaction-info" style="text-align: center;">
              	 
              	 
              	  <ul class="my-transaction-info__list" style="text-align: center;">
                 	 <li class="my-transaction-info__item">
                    	<span class="my-transaction-info__title">현재회원 수 : </span> 
                    	<span class="my-transaction-info__content">${memcount}명</span>
                 	 </li>
                 	 

                  	<li class="my-transaction-info-item">
                    	<span class="my-transaction-info__title">거래완료 수 : </span>
                    	<span class="my-transaction-info__content">${trcount }개</span>
                  	</li>
                  	
                  	<li class="my-transaction-info-item">
                    	<span class="my-transaction-info__title">현재 판매 중인 상품 : </span>
                    	<span class="my-transaction-info__content">${productList.size()+randomList.size()+aucionList.size()}개</span>
                  	</li>
                  		                 	
                  	<li class="my-transaction-info-item">
                    	<span class="my-transaction-info__title">문의사항 수 : </span>
                    	<span class="my-transaction-info__content">${cscount }개</span>
                  	</li>
                  	
                  	<li class="my-transaction-info-item">
                    	<span class="my-transaction-info__title">공지사항 수 : </span>
                    	<span class="my-transaction-info__content">${noticount }개</span>
                  	</li>
               	   </ul>
               	 </div>
              </div>
			
			<div class="my-page__introduction">
			   안녕하세요. '관리자' 입니다!
            </div>

			
				</div>	   
           </div>
		</div>
	 	</article>	
	</section>
                   							         
                   
                   </div>
			    <%@ include file="../include/sidebar.jsp" %>		
			
			 </div>
	

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>