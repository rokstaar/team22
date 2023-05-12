<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Page</title>
<style type="text/css">
.my-page {
  width: 35vw;
  min-width: 600px;
  margin:  auto;
  margin-bottom: 0;
}

.my-page__title {
  font-weight: 700;
  font-size: 38px;
  margin-bottom: 83px;
  text-align: center;
}

.my-page__profile {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  text-align: center;
}

.my-page-profile__image {
  width: 130px;
  height: 130px;
  border-radius: 50%;
  margin-bottom: 25px;
}

.my-page-profile__nickname {
  display: block;
  font-weight: 700;
  font-size: 25px;
  font-family: "Noto Sans KR", sans-serif;
  margin-bottom: 10px;
}

.my-transaction-info {
  margin-top: 24px;
  margin-right: 12px;
  width: 23vw;
}

.my-transaction-info__list {
  display: flex;
  justify-content: space-between;
  align-items: center;
  text-align: center;
  min-width: 260px;
  list-style: none;
}

.my-transaction-info__title {
  font-weight: 400;
  font-size: 22px;
  display: block;
  margin-bottom: 24px;
}

.my-transaction-info__content {
  font-weight: 700;
  font-size: 26px;
  font-family: "Noto Sans KR", sans-serif;
}

.my-page__introduction {
  margin-top: 26px;
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

/* .my-info-edit
 {
  font-weight: 700;
  font-size: 19px;
  height: 57px;
  border-radius: 5px;
  cursor: pointer;
} */

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

		<section>
			<article class="my-page">
			
			<div class="my-page__profile">
				<div class="my-page-profile">
                	<img
                  	src="/resources/images/default_my_profile.png"
                 	 alt="프로필 사진"
                  	class="my-page-profile__image"
               		/>
                	<span class="my-page-profile__nickname">${memberInfo.member_nickname }님</span>
                	<div class="my-info-edit">회원정보수정</div>
                </div>


             	 <div class="my-transaction-info">
              	  <ul class="my-transaction-info__list">
                 	 <li class="my-transaction-info__item">
                    	<span class="my-transaction-info__title">거래건수</span>
                    	<span class="my-transaction-info__content">${count }</span>
                 	 </li>

                  	<li class="my-transaction-info-item">
                    	<span class="my-transaction-info__title">페이</span>
                    	<span class="my-transaction-info__content">${memberInfo.member_pay }원</span>
                  	</li>

                  	<li class="my-transaction-info-item">
                    	<span class="my-transaction-info__title">평점</span>
                    	<c:if test="${not empty score}">
                    		<span class="my-transaction-info__content">${score}</span>
        				</c:if>
        				<c:if test="${empty score}">
                    		<span class="my-transaction-info__content">-</span>
        				</c:if>
                  	</li>
               	   </ul>
               	   
               	  </div>
               	  
              </div>
			
			<div class="my-page__introduction">
			안녕하세요. ${memberInfo.member_nickname } 입니다!
            </div>

				<div class="my-page__edit-buttons">
					<button type="button" class="my-pay-charge">페이 충전</button>
					<button type="button" class="my-cs">
					                내 문의사항
					              </button>
	              	<!-- <button type="button" class="my-info-edit">회원 정보 수정</button> -->
	                <button type="button" class="my-info-delete">회원 탈퇴</button>
	            </div>

			</div>
			</article>
		</section>
	</div>
		<%@ include file="../include/sidebar.jsp" %>
	</div>
</div>

<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/skel.min.js"></script>
<script src="/resources/assets/js/util.js"></script>		
<script src="/resources/assets/js/main.js"></script>

<script type="text/javascript">
$('.my-info-edit').on('click', function() {
	  window.location.href = '/members/updatePwCk';
	});

$('.my-info-delete').on('click', function() {
	  window.location.href = '/members/deletePwCk';
	});
	
$('.my-pay-charge').on('click', function() {
	  window.location.href = '/members/payCharge';
	});
	
$('.my-cs').on('click', function() {
	  window.location.href = '/members/myCs?num=1';
	}); 


</script>

</body>
</html>