<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>잊지마! 있지마켓</title>
	
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/product.css" />
		<link rel="preload" href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff" as="font" type="font/woff" crossorigin>
		<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
		
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!-- <link rel="preload" href="/resources/images/${info.product_pic.split(',')[0]}" as="image"> -->
		
		
		<style>
			#sidebar.force-inactive{
				margin-left: -26em;
			}
		</style>
		<script type="text/javascript">
			function imgerr(img){
				img.onerror = null;
				img.src = '/resources/images/default_product.jpg';
				img.alt = "사진이 없습니다";
			}
			function imgerrP(img){
				img.onerror = null;
				img.src = '/resources/images/default_my_profile.png';
				img.alt = "사진이 없습니다";
			}
			
			function changeMainImage(thumbnail) {
				const mainImage = document.getElementById('main-image');
				  
				mainImage.src = thumbnail.src.replace('/product/thumb','/product/download');
			}
		</script>
						<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="../include/header.jsp"/>
							<!-- Banner -->
								<!-- <section id="banner">
									<div class="content">
										<header>
											<h1>있지마켓<br />
											제품 상세 페이지</h1>
										</header>
									</div>
			
								</section> -->		
	<section>
		<div class="prodInfo">
		<div class="image-gallery">
		  <div class="main-image">
		    
		    <img id="main-image" src="/product/download?fileName=${info.product_pic.split(',')[0]}" onerror="imgerr(this)">
		  </div>
		  <div class="thumbnail-container">
		    <ul class="thumbnails">
		      <c:forEach var="i" begin="0" end="2">
		        <c:if test="${not empty info.product_pic.split(',')[i]}">
		          <li>
		            
		            <img class="thumbnail" src="/product/thumb?fileName=${info.product_pic.split(',')[i]}" onerror="imgerr(this)" onclick="changeMainImage(this)">
		          </li>
		        </c:if>
		      </c:forEach>
		    </ul>
		  </div>
		</div>

		<hr style="margin: 1em 0;">
			
		<a href="/chatroom-select?product_num=${info.product_num}&seller=${info.product_seller}" class="a-section">
		<section class="member">
			<div class="space-between">
				<div>
					<div class="div-img" style="width:200px;">
						<img src="/resources/images/${info.member_pic }" onerror="imgerrP(this)">
					</div>
						<div class="profile">
							${info.member_nickname }
						</div>
							<div class="address">
								${info.member_address }
							</div>
						
				</div>
				
				
				 
				<div class="div-member">
					<div class="div-img" id="score">
						<c:choose>
							<c:when test="${score > 3.75 }">
								<img src="/resources/images/score_verygood.png">
							</c:when>
							<c:when test="${score > 2.5 }">
								<img src="/resources/images/score_good.png">
							</c:when>
							<c:when test="${score > 1.25 }">
								<img src="/resources/images/score_bad.png">
							</c:when>
							<c:otherwise>
								<img src="/resources/images/score_verybad.png">
							</c:otherwise>
						</c:choose>
						</div>
						
						<div class="score">
					평판 : <fmt:formatNumber value="${score }" pattern="#.##" />
					</div>
	
				</div>
			</div>
		</section>			
		</a>

<div class="modal_back" id="updataForm">
<div class="modal">
<section style="display:flex; justify-content:center;">
	<form id="updateProd" action="/product/updateProd" method="post" onsubmit="return false;">
		<div style="float:right;">
		<?xml version="1.0" ?><svg class="feather feather-x" id="btn-close" fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><line x1="18" x2="6" y1="6" y2="18"/><line x1="6" x2="18" y1="6" y2="18"/></svg>
		</div>
		<h2>상품 수정</h2>
		<input type="hidden" name="product_seller" value="${info.product_seller }">
		<div class="regProd">
		<div id="regTitle">
			제목 <input type="text" name="product_title" 
			 onchange="validateForm()" value="${info.product_title }">
			<span id="inputAlert1" style="color: red;"></span>
		</div>
		<div id="regCategory" class="select-container">
			<select name="product_cate" disabled>
				<option value="" hidden>분류</option>
				<option value="의류"
				<c:if test="${info.product_cate eq '의류'}">
				selected="selected"
				</c:if>
				>의류</option>
				<option value="가전제품"
				<c:if test="${info.product_cate eq '가전제품' }">
				selected="selected"
				</c:if>
				>가전제품</option>
				<option value="식기,가구"
				<c:if test="${info.product_cate eq '식기,가구' }">
				selected="selected"
				</c:if>
				>식기,가구</option>
				<option value="디지털,전자기기"
				<c:if test="${info.product_cate eq '디지털,전자기기' }">
				selected="selected"
				</c:if>
				>디지털,전자기기</option>
				<option value="식품,생필품"
				<c:if test="${info.product_cate eq '식품,생필품' }">
				selected="selected"
				</c:if>
				>식품,생필품</option>
				<option value="스포츠,건강"
				<c:if test="${info.product_cate eq '스포츠,건강' }">
				selected="selected"
				</c:if>
				>스포츠,건강</option>
				<option value="기기,공구"
				<c:if test="${info.product_cate eq '기기,공구' }">
				selected="selected"
				</c:if>
				>기기,공구</option>
				<option value="도서,쿠폰"
				<c:if test="${info.product_cate eq '도서,쿠폰' }">
				selected="selected"
				</c:if>
				>도서,쿠폰</option>
				<option value="유아"
				<c:if test="${info.product_cate eq '유아' }">
				selected="selected"
				</c:if>
				>유아</option>
				<option value="애완동물"
				<c:if test="${info.product_cate eq '애완동물' }">
				selected="selected"
				</c:if>
				>애완동물</option>
				<option value="기타"
				<c:if test="${info.product_cate eq '기타' }">
				selected="selected"
				</c:if>
				>기타</option>
			</select>
			
		</div>
		</div>
		
		내용
		<textarea rows="5" cols="" name="product_content" 
		 onchange="validateForm()">${info.product_content }</textarea>
		<span id="inputAlert2" style="color: red;"></span>
		<div class="regProd">
		<div id="regPrice">
			가격 <input type="number" name="product_price" min='0' max='100000000' step='10' value="${info.product_price }" onchange="validateForm()">
			<span id="priceAlert" style="color: red;"></span>
		</div>
		<div id="regGrade" class="select-container">
			<select name="product_grade" onchange="validateForm()">
				<option value="" hidden>상품상태</option>
				<option value="상"
				<c:if test="${info.product_grade eq '상' }">
				selected="selected"
				</c:if>
				>상</option>
				<option value="중"
				<c:if test="${info.product_grade eq '중' }">
				selected="selected"
				</c:if>
				>중</option>
				<option value="하"
				<c:if test="${info.product_grade eq '하' }">
				selected="selected"
				</c:if>
				>하</option>
			</select>
		</div>
		</div>
		
		<div class="thumbnail-container">
		    <ul class="thumbnails">
		      <c:forEach var="i" begin="0" end="2">
		        <c:if test="${not empty info.product_pic.split(',')[i]}">
		          <li>
		            
		            <img class="thumbnail" src="/product/thumb?fileName=${info.product_pic.split(',')[i]}" onerror="imgerr(this)">
		          </li>
		        </c:if>
		      </c:forEach>
		    </ul>
		  </div>
		
		<input id="submitButton" type="submit" value="수정하기">
	</form>
	</section>
	</div>
</div>
		<!-- 게시물 부가탭 -->
		<div class="div-subpost">
			<c:if test="${id eq info.member_id }">
				<a id="a-modify">
					<i class="fas fa-eraser fa-2x"></i>
				</a>
				<a id="a-delete" onclick="chkDelete();">
					<i class="fas fa-trash-alt fa-2x"></i>
				</a>
			</c:if>
			<a id="el" onclick="clipBoard();">
				<i class="fas fa-ellipsis-h fa-2x"></i>
			</a>
			<a id="flag" onclick="report(this);">
				<i class="fas fa-flag fa-2x"></i>
			</a>
		</div>
		
		
		<hr>
		<div id="subinfo">
			<div>
				등록일자 <fmt:formatDate value="${info.product_date }" pattern="yyyy-MM-dd" />
			</div>
			<div style="float:right;">
				조회수 ${info.product_readcount }
			</div>
		</div>
		<div id="title">
			<h2>${info.product_title }</h2>
		</div>
		
		<div id="category">
			${info.product_cate }
		</div>
		가격 : <fmt:formatNumber value="${info.product_price }" pattern="#,###"/>원
		<div id="content">
		<p>${info.product_content }</p>
		</div>
	
<c:if test="${not empty id}">
<div class="div-likeit" data-product-num="${info.product_num}" data-seller="${info.product_seller}" data-svg-visible="false" style="float:right;">
	
	<?xml version="1.0" ?><svg class="svg-1" style="display:none;" height="24" version="1.1" width="24" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><g transform="translate(0 -1028.4)"><path d="m7 1031.4c-1.5355 0-3.0784 0.5-4.25 1.7-2.3431 2.4-2.2788 6.1 0 8.5l9.25 9.8 9.25-9.8c2.279-2.4 2.343-6.1 0-8.5-2.343-2.3-6.157-2.3-8.5 0l-0.75 0.8-0.75-0.8c-1.172-1.2-2.7145-1.7-4.25-1.7z" fill="#c0392b"/></g></svg>
	
	<?xml version="1.0" ?><!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'><svg class="svg-2" style="display:block;" enable-background="new 0 0 48 48" height="22px" id="Layer_1" version="1.1" viewBox="0 0 48 48" width="22px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path clip-rule="evenodd" d="M24.804,43.648L24,44l-0.804-0.352C12.862,37.313,2,22.893,2,14.884  C2.035,8.326,7.404,3.002,14,3.002c4.169,0,7.849,2.128,10,5.349c2.151-3.221,5.831-5.349,10-5.349c6.596,0,11.965,5.324,12,11.882  C46,22.893,35.138,37.313,24.804,43.648z M34,4.993c-3.354,0-6.469,1.667-8.335,4.46L24,11.946l-1.665-2.494  C20.469,6.66,17.354,4.993,14,4.993c-5.484,0-9.971,4.442-10,9.891c0,7.064,10.234,20.808,20,26.917  c9.766-6.109,20-19.852,20-26.907C43.971,9.435,39.484,4.993,34,4.993z" fill-rule="evenodd"/></svg>

</div>
</c:if>

		</div>
		
	</section>
	<div class="fixed">
		<div class="div-chat">
		<?xml version="1.0" ?><svg id="goto-list" style="enable-background:new 0 0 100.4 100.4;" version="1.1" viewBox="0 0 100.4 100.4" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g><path d="M79.1,10.1H63.2V3.3c0-0.8-0.7-1.5-1.5-1.5H38c-0.8,0-1.5,0.7-1.5,1.5v6.8H19.7c-3.5,0-6.3,2.8-6.3,6.3v75.4   c0,3.5,2.8,6.3,6.3,6.3h59.5c3.5,0,6.3-2.8,6.3-6.3V16.4C85.4,12.9,82.6,10.1,79.1,10.1z M38,29.5h23.7c0.8,0,1.5-0.7,1.5-1.5v-6.5   h10.5v64.7H25.1V21.6h11.4V28C36.5,28.9,37.2,29.5,38,29.5z M60.2,4.8V20c0,0,0,0,0,0s0,0,0,0v6.5H39.5v-6.5c0,0,0,0,0,0s0,0,0,0   v-8.5c0,0,0,0,0,0s0,0,0,0V4.8L60.2,4.8L60.2,4.8z M82.4,91.7c0,1.8-1.5,3.3-3.3,3.3H19.7c-1.8,0-3.3-1.5-3.3-3.3V16.4   c0-1.8,1.5-3.3,3.3-3.3h16.8v5.5H23.6c-0.8,0-1.5,0.7-1.5,1.5v67.7c0,0.8,0.7,1.5,1.5,1.5h51.6c0.8,0,1.5-0.7,1.5-1.5V20.1   c0-0.8-0.7-1.5-1.5-1.5h-12v-5.5h15.9c1.8,0,3.3,1.5,3.3,3.3V91.7z"/><path d="M28.8,46.4c0,0.8,0.7,1.5,1.5,1.5h38.5c0.8,0,1.5-0.7,1.5-1.5s-0.7-1.5-1.5-1.5H30.3C29.5,44.9,28.8,45.6,28.8,46.4z"/><path d="M68.8,55.4H30.3c-0.8,0-1.5,0.7-1.5,1.5s0.7,1.5,1.5,1.5h38.5c0.8,0,1.5-0.7,1.5-1.5S69.6,55.4,68.8,55.4z"/><path d="M68.8,66.4H30.3c-0.8,0-1.5,0.7-1.5,1.5c0,0.8,0.7,1.5,1.5,1.5h38.5c0.8,0,1.5-0.7,1.5-1.5C70.3,67.1,69.6,66.4,68.8,66.4z   "/></g></svg>
		목록으로
		</div>
		
		<!-- 채팅하기 -->
		<!-- 접속한 회원 정보와 판매자가 다를 경우만 활성화 -->
		<c:if test="${info.product_seller ne id }">
			<div class="div-chat">
			<?xml version="1.0" ?>
			<svg id="svg-chat" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:#101820;}</style></defs><title/><g data-name="Layer 25" id="Layer_25"><path class="cls-1" d="M24,22a1,1,0,0,1-.64-.23L18.84,18H17A8,8,0,0,1,17,2h6a8,8,0,0,1,2,15.74V21a1,1,0,0,1-.58.91A1,1,0,0,1,24,22ZM17,4a6,6,0,0,0,0,12h2.2a1,1,0,0,1,.64.23L23,18.86V16.92a1,1,0,0,1,.86-1A6,6,0,0,0,23,4Z"/><rect class="cls-1" height="2" width="2" x="19" y="9"/><rect class="cls-1" height="2" width="2" x="14" y="9"/><rect class="cls-1" height="2" width="2" x="24" y="9"/><path class="cls-1" d="M8,30a1,1,0,0,1-.42-.09A1,1,0,0,1,7,29V25.74a8,8,0,0,1-1.28-15,1,1,0,1,1,.82,1.82,6,6,0,0,0,1.6,11.4,1,1,0,0,1,.86,1v1.94l3.16-2.63A1,1,0,0,1,12.8,24H15a5.94,5.94,0,0,0,4.29-1.82,1,1,0,0,1,1.44,1.4A8,8,0,0,1,15,26H13.16L8.64,29.77A1,1,0,0,1,8,30Z"/></g></svg>
			판매자와 <br>채팅하기</div>
			<form id="chat-to-seller" action="/chatroom-select" method="GET">
				<input type="hidden" value="${info.product_num}" name="product_num" readonly >
				<input type="hidden" value="${info.product_seller}" name="seller" readonly >
			 </form>
		 </c:if>
		 <!-- 채팅하기 -->
		 
	</div>
	<div class="prodInfo">
	<hr>
	<h4> 이런 제품은 어떠세요? </h4>
	
	<div id="rec"></div>
	
	</div>
							<div id="toast" class="toast"></div>
							
							</div>
								</div>
				
				<!-- Sidebar -->
					<c:import url="../include/sidebar.jsp"/>
			
			</div>

		<!-- Scripts -->
		<script src="https://code.jquery.com/jquery-3.6.4.js" 
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	function showToast(message, duration = 3000) {
		const toastElement = document.getElementById('toast');
		toastElement.innerText = message;
		toastElement.classList.add('show');

		setTimeout(() => {
			toastElement.classList.remove('show');
		}, duration);
	}
	
	
	
	function sharePost(){
		document.getElementById('div-back').style.display = 'flex';
	}
	
	
	
	
	function chkDelete(){
		let RUS = confirm("게시글을 정말 삭제하시겠습니까?");
		let pnum = ${info.product_num};
		
		if(RUS){
			$.ajax({
				url: '/product/deleteProd',
				type: 'post',
				data: {pnum: pnum},
				success: function(){
					alert("삭제되었습니다");
					location.href='/product/prodList';
				},error: function(){
					alert("삭제 절차에 문제가 생겼습니다");
				}
			});
		}
	}
	
	
	
	$(document).ready(function() {
		
		function BR(str){
			return str.replace(/\n/g, '<br>');
		}
		
		
		$('#submitButton').on('click', function(){
			
			var productInfo = {
					product_num: ${info.product_num},
					title: $('input[name="product_title"]').val(),
					content: BR($('textarea[name="product_content"]').val()),
					price: $('input[name="product_price"]').val(),
					grade: $('select[name="product_grade"]').val()
			};
			
			
			$.ajax({
				url: '/product/updateProd',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(productInfo),
				success: function(data){
					location.reload();
				},error: function(data){
					console.log(data);
				}
			});
		});
		
		
		
        
        function heartChange($svg1, $svg2, pnum, seller) {
	        $svg1.on('click', function(event) {
	            $.ajax({
	                type: 'GET',
	                url: '/product/likeProdCancel',
	                data: {product_num: pnum, seller: seller},
	                success: function() {
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
	                	showToast('찜 완료!', 3000);
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
	    
	    
	    
	    var category = "";
        $.ajax({
        	type: "POST",
        	url: "/product/recProd",
            dataType: "JSON",
            data: {
                category: "${info.product_cate}"
            },
            success: function (response) {
            	var productHtml = '<div class="grid-container">';
            	for (var i = 0; i < response.length && i < 8; i++) {
            	  if (response[i].product_num != ${info.product_num}) {
            	    productHtml += '<div class="grid-item">';
            	    productHtml += '<a class="product-section" href="/product/prodInfo?product_num=' + response[i].product_num + '&seller=' + response[i].product_seller + '">';
            	    productHtml += '<img src="/product/thumb?fileName=' + response[i].product_pic.split(',')[0] + '" onerror="this.src=\'/resources/images/default_product.jpg\'" />';
            	    productHtml += '<div>' + response[i].product_title + '</div>';
            	    productHtml += '<div class="product-content">' + response[i].product_content + '</div>';
            	    productHtml += '</a>';
            	    productHtml += '</div>';
            	  }
            	}
            	productHtml += '</div>';

            	$('#rec').html(productHtml);


            },
            error: function (req, stat, error) {
                console.log(req + " - 에러발생 - " + error);
            }
        });
        
        
        function checkByte(inputElement, maxBytes, alertS) {
    		let text;
    		  
    		  if (inputElement.name == 'product_title') {
    		    text = inputElement.value;
    		  } else if (inputElement.name == 'product_content') {
    		    text = inputElement.textContent;
    		  } else {
    		    console.error('지원하지 않는 유형입니다');
    		    return;
    		  }
    		  
    		  let currentBytes = 0;

    		  for (let i = 0; i < text.length; i++) {
    		    const charCode = text.charCodeAt(i);
    		    if (charCode <= 0x7F) {
    		      currentBytes += 1;
    		    } else if (charCode <= 0x7FF) {
    		      currentBytes += 2;
    		    } else {
    		      currentBytes += 3;
    		    }

    		    if (currentBytes > maxBytes) {
    		      inputElement.value = text.substring(0, i);
    		      alertS.innerHTML = '글자 최대 바이트 수는 ' + maxBytes + '입니다';
    		      return false;
    		    }else{
    		    	alertS.innerHTML = '';
    		    }
    		  }
    		  return true;
    		}
        
        
        
        function formToggle(){
    		document.getElementById('updataForm').style = 'display:flex';
    		scroll_on();
    		document.querySelector('input[name="product_title"]').addEventListener('keyup', function() {
    		    return checkByte(this, 50, document.getElementById('inputAlert1'));
    		  });

    		  document.querySelector('textarea[name="product_content"]').addEventListener('keyup', function() {
    		    return checkByte(this, 1000, document.getElementById('inputAlert2'));
    		  });
    	}
        
        
        $('#a-modify').on('click', formToggle);
    });
	
	$("#svg-chat").on('click', function(){
		$("#chat-to-seller").submit();
	});
	
	$("#goto-list").on('click', function(){
		location.href="/product/prodList";
	});

	
	function report(element) {
		  let rep = element.getAttribute("data-reported") === "true";

		  if (rep) {
		    alert("이미 신고한 게시물입니다");
		  } else {
		    rep = confirm("게시물을 신고하시겠습니까?");
		    if (rep) {
		      element.setAttribute("data-reported", "true");
		      alert("신고가 완료되었습니다");
		    }
		  }
		}

	function clipBoard() {
		  const el = document.createElement("textarea");
		  el.value = window.location.href;
		  document.body.appendChild(el);
		  el.select();
		  document.execCommand("copy");
		  document.body.removeChild(el);
		  showToast("URL이 클립보드에 복사되었습니다.",3000);
	}

	
	
	function validateForm() {
	    const productTitle = document.getElementsByName("product_title")[0];
	    const productCate = document.getElementsByName("product_cate")[0];
	    const productContent = document.getElementsByName("product_content")[0];
	    const productPrice = document.getElementsByName("product_price")[0];
	    const productGrade = document.getElementsByName("product_grade")[0];
	    const productPics = document.getElementsByName("product_pics")[0];
	    const submitButton = document.getElementById("submitButton");

	    if (productTitle.value.trim() !== "" &&
	        productCate.value !== "" &&
	        productContent.value.trim() !== "" &&
	        productPrice.value.trim() !== "" &&
	        productGrade.value !== "") {
	        submitButton.disabled = false;
	    } else {
	        submitButton.disabled = true;
	    }
	}

	validateForm();
	
	
	

	
	$('.modal').on('click', function(event) {
	    event.stopPropagation();
	});
	
	$('.modal_back').on('click', function(){
		this.style.display = 'none';
		scroll_off();
	});
	
	$('#btn-close').on('click', function(){
		$('.modal_back').style.display = 'none';
		scroll_off();
	});
	
	
	function scroll_on() {
        $('#wrapper').on('scroll touchmove mousewheel', function(e) {
            e.preventDefault();
            e.stopPropagation();
            return false;
        });
    }

    function scroll_off() {
        $('#wrapper').off('scroll touchmove mousewheel');
    }
    
    
	
	</script>
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>