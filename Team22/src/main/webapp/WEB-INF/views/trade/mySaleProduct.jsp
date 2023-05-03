<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  font-size: 25px;
  font-weight: normal;
  color: black;
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
								<%@ include file="../include/mypageProdList.jsp" %>
								
										<div class="shippingStatusContainer">
										<section>
										
									<header class="major">
									
									</header>
									<div class="posts">
									
										<c:forEach var="vo" items="${myProdList }">
							<article>
								
								<a class="product-section" href="/product/prodInfo?product_num=${vo.product_num }&seller=${vo.product_seller}">
									<img src="/resources/images/${vo.product_pic.split(',')[0] } " width="511px" height="306px" 
									onerror="this.src='/resources/images/default_product.jpg'">
									
									
									
								<div style="float:right;">
									조회수 ${vo.product_readcount }
								</div>
								<div>${vo.product_title }</div>
								
								
								<div>${vo.product_seller }</div>
								<div style="float:left;">
									<fmt:formatNumber value="${vo.product_price }" pattern="#,###" />원
								</div>
								</a>
								<c:if test="${not empty id}">
<div style="float:right;" class="div-likeit" data-product-num="${vo.product_num}" data-seller="${vo.product_seller}" data-svg-visible="false">
	
	<?xml version="1.0" ?><svg class="svg-1" style="display:none;" height="24" version="1.1" width="24" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><g transform="translate(0 -1028.4)"><path d="m7 1031.4c-1.5355 0-3.0784 0.5-4.25 1.7-2.3431 2.4-2.2788 6.1 0 8.5l9.25 9.8 9.25-9.8c2.279-2.4 2.343-6.1 0-8.5-2.343-2.3-6.157-2.3-8.5 0l-0.75 0.8-0.75-0.8c-1.172-1.2-2.7145-1.7-4.25-1.7z" fill="#c0392b"/></g></svg>
	
	<?xml version="1.0" ?><!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'><svg class="svg-2" style="display:block;" enable-background="new 0 0 48 48" height="22px" id="Layer_1" version="1.1" viewBox="0 0 48 48" width="22px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path clip-rule="evenodd" d="M24.804,43.648L24,44l-0.804-0.352C12.862,37.313,2,22.893,2,14.884  C2.035,8.326,7.404,3.002,14,3.002c4.169,0,7.849,2.128,10,5.349c2.151-3.221,5.831-5.349,10-5.349c6.596,0,11.965,5.324,12,11.882  C46,22.893,35.138,37.313,24.804,43.648z M34,4.993c-3.354,0-6.469,1.667-8.335,4.46L24,11.946l-1.665-2.494  C20.469,6.66,17.354,4.993,14,4.993c-5.484,0-9.971,4.442-10,9.891c0,7.064,10.234,20.808,20,26.917  c9.766-6.109,20-19.852,20-26.907C43.971,9.435,39.484,4.993,34,4.993z" fill-rule="evenodd"/></svg>

</div>
			</c:if>
				</article>
			</c:forEach>
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

$(document).ready(function() {

    
    function heartChange($svg1, $svg2, pnum, seller) {
        $svg1.on('click', function(event) {
            $.ajax({
                type: 'GET',
                url: '/product/likeProdCancel',
                data: {product_num: pnum, seller: seller},
                success: function() {
                    console.log('success Del');
                    $svg1.hide();
                    $svg2.show();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log('Failed to cancel like');
                    console.log(jqXHR.responseText);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            });
        });

        $svg2.on('click', function(event) {
            $.ajax({
                type: 'GET',
                url: '/product/likeProd',
                data: {product_num: pnum, seller: seller},
                success: function() {
                	console.log('success Reg');
                	$svg2.hide();
                    $svg1.show();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Save Failed");
                    console.log(jqXHR.responseText);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            });
        });
    }
    
    $(".div-likeit").each(function() {
    	
    	var $div = $(this);
        var pnum = $div.data('product-num');
        var seller = "${id}";
        var $svg1 = $div.find('.svg-1');
        var $svg2 = $div.find('.svg-2');

        $.ajax({
        	type: 'GET',
        	url: '/product/memlikeCheck',
        	data: {product_num: pnum, seller: seller},
        	success: function(response){
        		if(response){
        			$svg2.hide();
        			$svg1.show();
        		}else{
        			$svg1.hide();
        			$svg2.show();
        		}
        		heartChange($svg1, $svg2, pnum, seller)
    		},
    		error: function(response){
    			console.log(pnum + '번 상품 찜 확인 실패');
        	}
        });
    });
});

</script>

	</body>
</html>