<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Page</title>
<style type="text/css">

.review{
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	font-weight: bold;
	font-size: 2em;
}
 h1{ 
         font-family: 'Oswald', sans-serif; 
         font-size: 30px; 
         color: #216182; 
     } 
     label { 
         display: block; 
         margin-top: 20px; 
         letter-spacing: 2px; 
     } 

input, textarea { 
         width: 439px; 
         height: 27px; 
         background-color: #efefef; 
         border-radius: 6px; 
         border: 1px solid #dedede; 
         padding: 10px; 
         margin-top: 3px; 
         font-size: 0.9em; 
         color: #3a3a3a; 
     }

input:focus, textarea:focus{ 
             border: 1px solid #97d6eb; 
         } 
         
textarea{ 
         height: 60px; 
         background-color: #efefef; 
     } 
#submit{ 
         width: 127px; 
         height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
#cancel { 
         width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     
.modal { 
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
.close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         background-color: lightgray; 
} 

.modal-content { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
         width: 500px; 
         height: 300px; 
         border-radius: 0.5rem; 
     } 
.close-button:hover { 
       background-color: darkgray; 
       font-weight: bold;
} 
.show-modal { 

         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
}
.script{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  text-decoration: none;
  color: 769fcd;
  font-weight: bold;
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
			<a href ="/members/pay"class="item">페이</a> 
		</div>
		
		<div class="info">
			<button class="button" 
					onclick="location.href='/members/payCharge'">충전</button>
			<button class="button" 
					onclick="location.href='/members/payWithdraw'">출금</button>
			<button class="button" 
					onclick="location.href='/members/drawDetails'">충전내역</button>
		</div> 
			
		<section>
		<div class="review">
		    <c:if test="${empty drawDetails && empty chargingDetails}">
		        충전 및 출금 내역이 없습니다.
		    </c:if>
		</div>

		<c:if test="${not empty drawDetails || not empty chargingDetails}">
			<article>
				<div class="shippingStatusContainer">
					<table class="bbsList">
						<thead class="head">
							<tr>
								<th>거래</th>
								<th>일시</th>
								<th>상품명</th>	
								<th>충전·출금 금액</th>
								<th>닉네임</th>
							</tr>
						</thead>
						
						<tbody class="body">
							<c:forEach var="vo" items="${drawDetails}">
								<tr>
									<td>출금</td>
									<td><span>${vo.charge_date_time}</span></td>
									<td><span>있지페이</span></td>
									<td><span><fmt:formatNumber value="${vo.withdraw_amount}" pattern="#,###" />원</span></td>
									<%-- <td><span>${vo.withdraw_amount}원</span></td> --%>
									<td><span>${vo.member_nickname}</span></td>
								</tr>
							</c:forEach>
							<c:forEach var="vo" items="${chargingDetails}">
								<tr>
									<td>충전</td>
									<td><span>${vo.charge_date_time}</span></td>
									<td><span>있지페이</span></td>
									<td><span><fmt:formatNumber value="${vo.charge_amount}" pattern="#,###" />원</span></td>
									<td><span>${vo.member_nickname}</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</article>
		</c:if>
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