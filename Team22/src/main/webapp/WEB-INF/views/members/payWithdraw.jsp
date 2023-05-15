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
		
		
		<!-- <div class="my-page__edit-buttons">
					<button type="button" class="my-pay-charge">페이 충전</button>
					<button type="button" class="my-pay-withdraw">페이 출금  </button>
					            
					              
            </div> -->
		<div class="infoContainer">
				<a href ="/members/payWithdraw"class="item">페이 출금</a> 
				<a href = "/members/drawDetails"class="item">출금 내역</a> 
		</div>

			  <div class="sign-in">
    
      <form id="myForm" role="form" method="POST">
        
      
        <h2 class="sign-in__title">페이 출금</h2>

        <div class="id-form__wrap">
          <label for="id">${memberInfo.member_nickname }님의 페이 금액은 ${memberInfo.member_pay }원 입니다.</label>
          <br />
        </div>
      
	        <label for="bank">은행:</label>
			<select name="bank" id="bank-select" class="select_filter">
			  <option value="" hidden>은행 선택</option>
			  <option value="부산은행">부산은행</option>
			  <option value="신한은행">신한은행</option>
			  <option value="우리은행">우리은행</option>
			  <option value="국민은행">국민은행</option>
			  <option value="카카오뱅크">카카오뱅크</option>
			  <option value="농협">농협</option>
			</select>
			<br>
			
			<label for="account_number">계좌 번호: 
			  <input type="text" name="account_number" style="background-color: #e2e2e2;" 
			    oninput="validateInput(this, 'error_message_account')">
			  <br>
			  <span id="error_message_account" style="color: red; display: none;">숫자를 입력해주세요.</span>
			</label>
			
			<br>
			
			<label for="withdraw_amount">출금 금액 : 
			  <input type="text" name="withdraw_amount" style="background-color: #e2e2e2;" 
			    oninput="validateInput(this, 'error_message_withdraw')">
			  <br>
			  <span id="error_message_withdraw" style="color: red; display: none;">숫자를 입력해주세요.</span>
			</label>
			
			<br>
			
	<input type="hidden" name="member_id" value="${memberInfo.member_id }">			
	<input type="hidden" name="member_nickname" value="${memberInfo.member_nickname }">			
			 <div class="my-page__edit-buttons">
		                <input type="button" class="pay_withdraw_amount" value="출금" onclick="validateForm()">

					            </div>
       </form>

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
	
function validateInput(input, errorId) {
	    var sanitizedValue = input.value.replace(/[^0-9]/g, '');
	    if (input.value !== sanitizedValue) {
	      document.getElementById(errorId).style.display = 'inline';
	    } else {
	      document.getElementById(errorId).style.display = 'none';
	    }
	    input.value = sanitizedValue;
	  }
	  
	  function validateForm() {
	    var bankSelect = document.getElementById('bank-select');
	    var accountNumberInput = document.getElementsByName('account_number')[0];
	    var withdrawAmountInput = document.getElementsByName('withdraw_amount')[0];
	    
	    if (bankSelect.value === '' || accountNumberInput.value === '' || withdrawAmountInput.value === '') {
	      alert('은행과 계좌 번호, 출금 금액을 입력해주세요.');
	    } else if (parseInt(withdrawAmountInput.value) > parseInt("${memberInfo.member_pay}")) {
	        alert('출금 금액이 현재 페이 금액보다 큽니다.');
	    } else {
	    	document.getElementById('myForm').submit();
	    }
	  }
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