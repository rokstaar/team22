<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<head>
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
    <script>
$(document).ready(function(){
		
		var yDiscount = $('input:hidden[name=yDiscount]').val();
		var gDiscount = $('input:hidden[name=gDiscount]').val();
		var totalPrice = '${tPrice}' - (yDiscount - gDiscount);
		
		var IMP = window.IMP;   // 생략 가능
		IMP.init("imp55844548"); // 예: imp00000000 
		
		$('input:button[name=pay]').on('click', function(){
			IMP.request_pay({
	            pg : "html5_inicis.INIpayTest",
	            pay_method : 'card',
	            merchant_uid: "", 
	            name : '${memberInfo.member_nickname}님의 있지페이충전',
	            amount : 101,
	            buyer_email : '${memberInfo.member_email}',
	            buyer_name : '${memberInfo.member_id}',
	            buyer_tel : '${memberInfo.member_phone}',
	            buyer_addr : '부산',
	            buyer_postcode : '123-456'
	        }, function (rsp) { // callback
	            if (rsp.success) {
	                console.log(rsp);
	                $('form').submit();
	            } else {
	                console.log(rsp);
	            }
	        });
			
		});
		
	});
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
${id }
${memberInfo }
<form role="form" method="post">
	<input type="hidden" name="${memberInfo }" value="${memberInfo }">
	
	
	
</form>

<input type="button" class="payButton" value="결제" name="pay" >
</body>
</html>