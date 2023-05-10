<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
		
		 var IMP = window.IMP;   // 생략 가능
		IMP.init("imp55844548"); // 예: imp00000000  
		
		 $('#charge').click(function () {
		        // getter
		        /* var IMP = window.IMP;
		        IMP.init('imp55844548'); */
		        var money = $('input[name="cp_item"]:checked').val();
		        console.log(money);

		        IMP.request_pay({
		            pg: 'html5_inicis.INIpayTest',
		            pay_method : 'card',
		            merchant_uid: 'merchant_' + new Date().getTime(),

		            name: '${memberInfo.member_nickname}님의 있지페이충전',
		            amount: money,
		            buyer_email: '${memberInfo.member_email}',
		            buyer_name: '${memberInfo.member_name}',
		            buyer_tel: '${memberInfo.member_phone}',
		            buyer_addr: '${memberInfo.member_address2}',
		            buyer_postcode: '${memberInfo.member_address}'
		        }, function (rsp) {
		            console.log(rsp);
		            if (rsp.success) {
		                var msg = '결제가 완료되었습니다.';
		                msg += '고유ID : ' + rsp.imp_uid;
		                msg += '상점 거래ID : ' + rsp.merchant_uid;
		                msg += '결제 금액 : ' + rsp.paid_amount;
		                msg += '카드 승인번호 : ' + rsp.apply_num;
		                $.ajax({
		                    type: "GET", 
		                    url: "/members/myPage", //충전 금액값을 보낼 url 설정
		                    data: {
		                        "amount" : money
		                    },
		                    /* success: function () {
		                        alert(msg);
		                        document.location.href = "/members/myPage"; // 페이지 이동
		                    } */
		                });
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		            }
		          //alert창 확인 후 이동할 url 설정
		            /* alert(msg);
		            document.location.href="/members/myPage";  */
		        });
		    });
		
	});
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 	<div class="card-body bg-white mt-0 shadow">
            <p style="font-weight: bold">충전 </p>
            <label class="box-radio-input"><input type="radio" name="cp_item" value="100"><span>100원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" value="100000"><span>100,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" value="300000"><span>300,000원</span></label>
            <label class="box-radio-input"><input type="radio" name="cp_item" value="500000"><span>500,000원</span></label>
            <p  style="color: #ac2925; margin-top: 30px">최소 충전금액은 5,000원이며 <br/>최대 충전금액은 500,000원 입니다.</p>
            <button type="button" class="btn btn-lg btn-block  btn-custom" id="charge">충 전 하 기</button>
            
 		</div>
	<script type="text/javascript">
	
	
    </script>
</body>
</html>