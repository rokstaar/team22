<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Page</title>
<style type="text/css">
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
				<c:forEach var="vo" items="${myProdList }">
					<article>
					<div class="product-section" 
						 onclick="location.href='/product/prodInfo?product_num=${vo.product_num}&seller=${vo.product_seller}'">
						<div class="img-wrapper">
							<img src="/resources/images/${vo.product_pic.split(',')[0] } " width="511px" height="306px" 
							onerror="this.src='/resources/images/default_product.jpg'">
						</div>

						<div style="float:left;">
						<div>판매자 : ${vo.product_seller }</div>
							<div>상품명 : ${vo.product_title }</div>
								 가격 : <fmt:formatNumber value="${vo.product_price }" pattern="#,###" />원
						</div>
					</div>	

					<c:if test="${not empty id}">
						<div style="float:right;" class="div-likeit" data-product-num="${vo.product_num}" data-seller="${vo.product_seller}" data-svg-visible="false">
	
						<?xml version="1.0" ?><svg class="svg-1" style="display:none;" height="22" version="1.1" width="22" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><g transform="translate(0 -1028.4)"><path d="m7 1031.4c-1.5355 0-3.0784 0.5-4.25 1.7-2.3431 2.4-2.2788 6.1 0 8.5l9.25 9.8 9.25-9.8c2.279-2.4 2.343-6.1 0-8.5-2.343-2.3-6.157-2.3-8.5 0l-0.75 0.8-0.75-0.8c-1.172-1.2-2.7145-1.7-4.25-1.7z" fill="#c0392b"/></g></svg>
	
						<?xml version="1.0" ?><!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'><svg class="svg-2" style="display:block;" enable-background="new 0 0 48 48" height="22px" id="Layer_1" version="1.1" viewBox="0 0 48 48" width="22px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path clip-rule="evenodd" d="M24.804,43.648L24,44l-0.804-0.352C12.862,37.313,2,22.893,2,14.884  C2.035,8.326,7.404,3.002,14,3.002c4.169,0,7.849,2.128,10,5.349c2.151-3.221,5.831-5.349,10-5.349c6.596,0,11.965,5.324,12,11.882  C46,22.893,35.138,37.313,24.804,43.648z M34,4.993c-3.354,0-6.469,1.667-8.335,4.46L24,11.946l-1.665-2.494  C20.469,6.66,17.354,4.993,14,4.993c-5.484,0-9.971,4.442-10,9.891c0,7.064,10.234,20.808,20,26.917  c9.766-6.109,20-19.852,20-26.907C43.971,9.435,39.484,4.993,34,4.993z" fill-rule="evenodd"/></svg>

						</div>
					</c:if> 

					<div style="float: right; margin-top: 12px;  clear: right;">
					<button class="sold-prod-delete">
					               <!--  <i class="fas fa-cog my-info-edit__icon"></i> -->
					 	상품삭제
					</button></div>
		
					</article>
				</c:forEach>
			</div>
								
		<form role="form" method="post">
			<input type="hidden" name="product_num" value="${vo.product_num }">
		</form>	
		
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

	var formObj = $("form[role='form']");
	console.log(formObj);
	
	$(".sold-prod-delete").click(function(){
		// 폼태그 이동 주소 설정 /boards/modify
		formObj.attr("action","/trade/soldProdRemove");
		// 폼태그 정보 저장해서 페이지이동
		formObj.submit();	
	});
	
	var result = "${result}";
	
	if(result == "delOK"){
		alert("상품 삭제 완료!");		
	}



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