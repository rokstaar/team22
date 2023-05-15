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

.card-body{
	text-align: center;

}

.box-radio-input{
	font-family: "Noto Sans KR", sans-serif;
	font-size: 1em;
}

.charge-info{
	font-family: "Noto Sans KR", sans-serif;
	font-size: 1.2em;
	font-weight: bold;
	margin: 25px 0;
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

		
	</div>
	</div>
		<%@ include file="../include/sidebar.jsp" %>
</div>
 
 <script type="text/javascript">
 
 $('.my-pay-charge').on('click', function() {
	  window.location.href = '/members/payCharge';
	});
	
$('.my-pay-withdraw').on('click', function() {
	  window.location.href = '/members/payWithdraw';
	}); 
 </script>
 
 <!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/screen.css"/>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:400,300italic,300,400italic,700,700italic|Playfair+Display:400,700,400italic,700italic"/>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"
    	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
    	crossorigin="anonymous"></script>

</body>
</html>