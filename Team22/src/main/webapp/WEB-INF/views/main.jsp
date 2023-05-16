<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->


	

<html>
	<head>
		<title>잊지 마! 있지마켓</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<link rel="stylesheet" href="resources/assets/css/mainPage.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
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
		</script>
		
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				
				var i = 0;
				
				$('#nextP').click(function(){
					if(i == 6){
						$('#p0').css('display','block');
						$('#p1').css('display','block');
						$('#p2').css('display','block');
						$('#p6').css('display','none');
						$('#p7').css('display','none');
						$('#p8').css('display','none');
						i=0;
					}else{
						$('#p'+i).css('display','none');
						$('#p'+(i+3)).css('display','block');
						i++;
					}
				});
				
				var j = 0;
				
				$('#nextA').click(function(){
					if(j == 6){
						$('#a0').css('display','block');
						$('#a1').css('display','block');
						$('#a2').css('display','block');
						$('#a6').css('display','none');
						$('#a7').css('display','none');
						$('#a8').css('display','none');
						j=0;
					}else{
						$('#a'+j).css('display','none');
						$('#a'+(j+3)).css('display','block');
						j++;
					}
				});
				
				var k = 0;
				
				$('#nextR').click(function(){
					if(k == 6){
						$('#r0').css('display','block');
						$('#r1').css('display','block');
						$('#r2').css('display','block');
						$('#r6').css('display','none');
						$('#r7').css('display','none');
						$('#r8').css('display','none');
						k=0;
					}else{
						$('#r'+k).css('display','none');
						$('#r'+(k+3)).css('display','block');
						k++;
					}
				});
				
			});
		
		</script>
		
	</head>
	<body>

<!-- 추천 -->
<c:if test="${id ne null }">
<div class="rec-view">
        <div class="rec-title">
            <article>
                ${id }님! 이런 제품은 어떠세요?
                <c:if test="${reclist.token eq 0 }">
                	[찜 목록 기반 추천]
                </c:if>
                <c:if test="${reclist.token eq 1 }">
                	[사람들이 좋아하는 상품]
                </c:if>
                <c:if test="${reclist.token eq 2 }">
                	[최근 관심 급등 상품]
                </c:if>
            </article>
            <div id="close-btn">
                <?xml version="1.0" ?><svg height="48" viewBox="0 0 48 48" width="48" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M38 12.83l-2.83-2.83-11.17 11.17-11.17-11.17-2.83 2.83 11.17 11.17-11.17 11.17 2.83 2.83 11.17-11.17 11.17 11.17 2.83-2.83-11.17-11.17z" />
                    <path d="M0 0h48v48h-48z" fill="none" />
                </svg>
            </div>
        </div>
        <c:if test="${reclist.list.size() > 4 }">
        <div id="left-btn">
            <?xml version="1.0" ?><svg style="enable-background:new 0 0 32 32;" version="1.1" viewBox="0 0 32 32"
                xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <style type="text/css">
                    .st0 {
                        display: none;
                    }
            
                    .st1 {
                        display: inline;
                    }
            
                    .st2 {
                        fill: #0097E2;
                    }
            
                    .st3 {
                        fill: #3A3A3A;
                    }
                </style>
                <g class="st0" id="grid" />
                <g id="icon">
                    <g>
                        <g>
                            <path class="st2"
                                d="M15,22c-0.26,0-0.51-0.1-0.71-0.29l-5-5c-0.39-0.39-0.39-1.02,0-1.41l5-5c0.39-0.39,1.02-0.39,1.41,0     s0.39,1.02,0,1.41L11.41,16l4.29,4.29c0.39,0.39,0.39,1.02,0,1.41C15.51,21.9,15.26,22,15,22z" />
                        </g>
                    </g>
                    <g>
                        <g>
                            <path class="st2"
                                d="M21,22c-0.26,0-0.51-0.1-0.71-0.29l-5-5c-0.39-0.39-0.39-1.02,0-1.41l5-5c0.39-0.39,1.02-0.39,1.41,0     s0.39,1.02,0,1.41L17.41,16l4.29,4.29c0.39,0.39,0.39,1.02,0,1.41C21.51,21.9,21.26,22,21,22z" />
                        </g>
                    </g>
                </g>
            </svg>
        </div>
        </c:if>
        <div class="rec-container">
            <div class="rec-wrapper">
                <c:forEach var="prod" items="${reclist.list }">
                <a href="/product/prodInfo?product_num=${prod.product_num }&seller=${prod.product_seller}">
                <div class="rec-product">
                    <div class="prod-pic">
                        <img id="main-image" src="/product/thumb?fileName=${prod.product_pic.split(',')[0]}" onerror="imgerr(this)">
                    </div>
                    <div id="prod-content">
                        ${prod.product_title }
                    </div>
                </div>
                </a>
                </c:forEach>
            </div>
        </div>
        <c:if test="${reclist.list.size() > 4 }">
        <div id="right-btn">
            <?xml version="1.0" ?><svg style="enable-background:new 0 0 32 32;" version="1.1" viewBox="0 0 32 32"
                xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <style type="text/css">
                    .st0 {
                        display: none;
                    }
            
                    .st1 {
                        display: inline;
                    }
            
                    .st2 {
                        fill: #0097E2;
                    }
            
                    .st3 {
                        fill: #3A3A3A;
                    }
                </style>
                <g class="st0" id="grid" />
                <g id="icon">
                    <g>
                        <g>
                            <path class="st2"
                                d="M17,22c-0.26,0-0.51-0.1-0.71-0.29c-0.39-0.39-0.39-1.02,0-1.41L20.59,16l-4.29-4.29     c-0.39-0.39-0.39-1.02,0-1.41s1.02-0.39,1.41,0l5,5c0.39,0.39,0.39,1.02,0,1.41l-5,5C17.51,21.9,17.26,22,17,22z" />
                        </g>
                    </g>
                    <g>
                        <g>
                            <path class="st2"
                                d="M11,22c-0.26,0-0.51-0.1-0.71-0.29c-0.39-0.39-0.39-1.02,0-1.41L14.59,16l-4.29-4.29     c-0.39-0.39-0.39-1.02,0-1.41s1.02-0.39,1.41,0l5,5c0.39,0.39,0.39,1.02,0,1.41l-5,5C11.51,21.9,11.26,22,11,22z" />
                        </g>
                    </g>
                </g>
            </svg>
        </div>
	    </c:if>
    </div>
</c:if>
<!-- 추천 -->


		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
				<header id="header">
					<a href="/main" class="logo">
						<!-- 로고 이미지 넣을거임 -->
						<strong>있지마켓</strong>
					</a>
					<ul class="icons" style="width: 117px;
											  height: 40px;
											  display: inline-block;
											  list-style: none; /* 기본 목록 마커를 제거합니다. */
											  padding: 0;
											  margin: 0;">
							
						<li><div class="select-container" >
																  
							<select name="type" id="category-select" class="select_filter" style="background: #f8f9fa!important;">
								<option value="product_title">일반상품</option>
								<option value="au_title">경매상품</option>
								<option value="ran_title">응모상품</option>
							</select>
						</div>
						</li>
						
						<li>
						
						<section id="search" class="alt">
									<form method="get" action="#">
										<input type="text" name="search" placeholder="검색할 단어입력" style="background: #f8f9fa!important;"/>
									</form>
						</section></li>	
						
						<c:if test="${id == null }">
							<li><a href="/members/login"><span class="label">로그인</span></a></li>
							<li><a href="/members/insert"><span class="label">회원가입</span></a></li>
						</c:if>
			
						<c:if test="${id != null && id !=('admin')}">
							<!-- id에 "N_"을 포함하는 경우에는 naverLogout() 함수 호출하여 로그아웃 -->
							<c:if test="${id.indexOf('N_') != -1}">
								<li><a onclick="naverLogout()" target="_parent" class="btn_logout" data-clk="nmy.logout">로그아웃</a></li>
							</c:if>
							<!-- 일반 로그아웃 -->
							<c:if test="${id.indexOf('N_') == -1}">
								<li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
							</c:if>
							<li><a href="/members/myPage"><span class="label">마이페이지</span></a></li>
							<li><a href="/chatroom"><span class="label">내채팅</span></a></li>
							
						</c:if>
						
						<c:if test="${id != null && id ==('admin')}">
							<li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
							<li><a href="/admin/pagemain"><span class="label">관리자</span></a></li>
						</c:if>
			
					</ul>
				</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>Hi, I’m Editorial<br />
											by HTML5 UP</h1>
											<p>A free and fully responsive site template</p>
										</header>
										<p>Ut magna finibus nisi nec lacinia. Nam maximus erat id euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor sit nullam.</p>
										<ul class="actions">
											<li><a href="/product/prodList" class="button big">상품 리스트가기</a></li>
										</ul>
									</div>
									<span class="image object">
										<img src="/resources/images/chat.png" alt="" />
									</span>
			
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2><a href="/product/prodList">Product</a></h2>
									</header>
									<input id="nextP" type="image" src="../resources/images/arrow-gd458d23cd_640.png" style="margin-right:10px; float:right; width:30px; heigth:30px">
									<div class="posts">
										
										<c:forEach begin="0" end="${pList.size()-1 }" var="i">
										
										<c:if test="${i < 3 }">
											<article style="text-align: center;" id="p${i }">
												<a href="#" class="image"><img style="width:300px; height: 300px; margin:auto;" src="resources/images/pic01.jpg" alt="" /></a>
												<h3>${pList[i].product_title }</h3>
												<ul class="actions">
													<li><a href="#" class="button">상세정보</a></li>
												</ul>
											</article>
										</c:if>
										
										<c:if test="${i >= 3 }">
											<article style="text-align: center; display: none" id="p${i }" >
												<a href="#" class="image"><img style="width:300px; height: 300px; margin:auto;" src="resources/images/pic01.jpg" alt="" /></a>
												<h3>${pList[i].product_title }</h3>
												<ul class="actions">
													<li><a href="#" class="button">상세정보</a></li>
												</ul>
											</article>
										</c:if>
										
										</c:forEach>
										
									</div>
								</section>
								<section>
									<header class="major">
										<h2><a href="/auction/list">Auction</a></h2>
									</header>
									
									
									<input id="nextA" type="image" src="../resources/images/arrow-gd458d23cd_640.png" style="margin-right:10px; float:right; width:30px; heigth:30px">
									
									
									<div class="posts">
										<c:forEach begin="0" end="${aList.size()-1 }" var="j">
										<c:if test="${j < 3 }">
											<article style="text-align: center;" id="a${j }">
												<a href="#" class="image"><img style="width:300px; height: 300px; margin:auto;" src="/auction/download?fileName=${aList[j].au_pic.replace('[','').replace(']','').split(',')[0]}" /></a>
												<h3>${aList[j].au_title }</h3>
												<ul class="actions">
													<li><a href="/auction/aDetail?au_num=${aList[j].au_num }" class="button">상세정보</a></li>
												</ul>
											</article>
										</c:if>
										<c:if test="${j >= 3 }">
											<article style="display:none; text-align: center;" id="a${j }">
												<a href="#" class="image"><img style="width:300px; height: 300px; margin:auto;" src="/auction/download?fileName=${aList[j].au_pic.replace('[','').replace(']','').split(',')[0]}" /></a>
												<h3>${aList[j].au_title }</h3>
												<ul class="actions">
													<li><a href="/auction/aDetail?au_num=${aList[j].au_num }" class="button">상세정보</a></li>
												</ul>
											</article>
										</c:if>
										</c:forEach>
									</div>
								</section>
								<section>
									<header class="major">
										<h2><a href="/random/rList">Random</a></h2>
									</header>
									<input id="nextR" type="image" src="../resources/images/arrow-gd458d23cd_640.png" style="margin-right:10px; float:right; width:30px; heigth:30px">
									<div class="posts">
										<c:forEach begin="0" end="${rList.size()-1 }" var="k">
										<c:if test="${k < 3 }">
											<article style="text-align: center;" id="r${k }">
												<a href="#" class="image"><img style="width:300px; height: 300px; margin:auto;" src="/random/download?fileName=${rList[k].ran_pic.replace('[','').replace(']','').split(',')[0]}" /></a>
												<h3>${rList[k].ran_title }</h3>
												<ul class="actions">
													<li><a href="/random/rDetail?ran_num=${rList[k].ran_num }" class="button">상세정보</a></li>
												</ul>
											</article>
										</c:if>
										<c:if test="${k >= 3 }">
											<article style="display:none; text-align: center;" id="r${k }">
												<a href="#" class="image"><img style="width:300px; height: 300px; margin:auto;" src="/random/download?fileName=${rList[k].ran_pic.replace('[','').replace(']','').split(',')[0]}" /></a>
												<h3>${rList[k].ran_title }</h3>
												<ul class="actions">
													<li><a href="/random/rDetail?ran_num=${rList[k].ran_num }" class="button">상세정보</a></li>
												</ul>
											</article>
										</c:if>
										</c:forEach>
										
									</div>
								</section>
			
						</div>
					</div>
					<c:if test="${not empty viewlist }">
					<div class="right-bar">
					<div class="bar-title">
						<h3>최근 본 글 목록</h3>
					</div>
					<div>
					<c:forEach var="list" items="${viewlist }">
						<a href="/product/prodInfo?product_num=${list.product_num }&seller=${list.product_seller}">
							${list.product_title }
						</a>
					</c:forEach>
					</div>
			</div>
			</c:if>
				<%@ include file="include/sidebar.jsp" %>
			
			</div>
<script src="https://code.jquery.com/jquery-3.6.4.js" 
integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var result = "${result}";
	
	if(result == "delete"){
		alert("회원탈퇴가 되었습니다.");		
	}
	
	
	
	
	$(document).ready(function(){
		
	});
	
	   /* var useLocation = confirm("현재 위치 정보를 사용하시겠습니까?"); 

	    if (useLocation) { */
	        // 위치 정보 사용에 동의한 경우, 위치 정보를 가져와서 사용하는 코드를 작성합니다.
	        if (navigator.geolocation) {
	            navigator.geolocation.getCurrentPosition(function(position) {
	                // 위치 정보를 가져왔을 때의 동작을 처리합니다.
	                var latitude = position.coords.latitude;
	                var longitude = position.coords.longitude;

	                // 가져온 위치 정보를 서버로 전송하거나 다른 작업을 수행할 수 있습니다.
					
	                
	                // 예시로 가져온 위치 정보를 화면에 출력합니다.
	                var locationText = "현재 위치: " + latitude + ", " + longitude;
	                document.getElementById("location").innerText = locationText;
	            });
	        } else {
	            alert("브라우저가 위치 정보를 지원하지 않습니다.");
	        }
	    /* } */
	
	    
	    function naverLogout(){
	var popup = window.open('https://nid.naver.com/nidlogin.logout?returl=https%3A%2F%2Fwww.naver.com','title','height=10,width=10');
	setTimeout(function(){
		popup.close();
		location.href="/members/logout";
	},150);
}	
	    
	    // 메인에서 검색
	$(function() {
  $('#search form').on('submit', function(e) {
    e.preventDefault();

    var selectedOption = $('#category-select').val();
    var searchKeyword = $('#search input[name="search"]').val();

    if (searchKeyword !== '') {
      var url = '';

      if (selectedOption === 'product_title') {
        url = '/product/prodList?sort=&grade=&category=&minPrice=&maxPrice=&title=' + encodeURIComponent(searchKeyword);
      } else if (selectedOption === 'au_title') {
        url = '/auction/list?type=au_title&search=' + encodeURIComponent(searchKeyword);
      } else if (selectedOption === 'ran_title') {
        url = '/random/searchList?type=ran_title&search=' + encodeURIComponent(searchKeyword);
      }

      if (url !== '') {
        window.location.href = url;
      }
    }
  });
});



</script>

	
<script type="text/javascript" src="resources/assets/js/mainPage.js"></script>
	</body>
</html>