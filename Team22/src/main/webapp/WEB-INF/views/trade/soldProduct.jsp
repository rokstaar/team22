<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Page</title>
<style type="text/css">
.sold-out {
  filter: brightness(35%);
  opacity: 0.5;
}

.image-container {
  position: relative;
  display: inline-block;
}

.sold-out-text {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: rgba(0, 0, 0, 0.8);
  color: #fff;
  text-align: center;
  font-size: 18px;
  font-weight: bold;
  padding: 32px 0;
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
				<a href="/trade/mySaleProduct" class="item">판매중</a> 
				<a href="/trade/soldProduct" class="item">판매완료</a>
			</div>
			
			<div class="info">
				<button class="button" 
						onclick="location.href='/trade/mySaleProduct?product'">일반</button>
				<button class="button" 
						onclick="location.href='/trade/mySaleAuction'">경매</button>
				<button class="button" 
						onclick="location.href='/trade/mySaleRandom'">응모</button>
			</div>			  
									
			<div class="posts">
				<c:forEach var="vo" items="${soldProdList }">
				<article>
					<div class="product-section" 
					onclick="location.href='/product/prodInfo?product_num=${vo.prod_num }&seller=${vo.sell_mem_id}'">
					<div class="img-wrapper">
						<div class="image-container">
							<img class="sold-out" src="/resources/images/${vo.product_pic.split(',')[0] } " width="511px" height="306px" 
							onerror="this.src='/resources/images/default_product.jpg'">
						</div>
						<div class="sold-out-text">판매 완료</div>
					</div>
								
					<div>구매자 : ${vo.buy_mem_id }</div>
					
					<div style="float:left;">
					<div>상품명 : ${vo.product_title }</div>
						 가격 : <fmt:formatNumber value="${vo.product_price }" pattern="#,###" />원
					</div>
				</div>	
									
			<a href="/trade/removeProduct?product_num=${vo.product_num }" style="float:right;">
			상품삭제
			</a> 
			
			</article>
				
			</c:forEach>
		</div>
	</div>
	</div>
	
<%@ include file="../include/sidebar.jsp" %>
</div>

<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/skel.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
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