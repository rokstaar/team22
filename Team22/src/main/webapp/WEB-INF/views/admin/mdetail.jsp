<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
		<title>admin Page</title>
		
<style type="text/css">

.card-text{
     font-family: "Noto Sans KR", sans-serif;
}

</style>

		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/myPage.css" />
		<link rel="stylesheet" href="/resources/assets/css/styles.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

								<%@ include file="../include/header.jsp" %>			
																
							<!-- Banner -->
							<section id="banner">
								 <div class="content">
								 <div class="wrap">
									  <div class="shippingStatusContainer">
									     
									      <%@ include file="../include/adminmypage.jsp" %>

						 <hr>
						 
	<div class="card">
		<div class="card-body">
			<div class="row p-2 mt-2">
				<div class="col-1">
			     <a href="/admin/adminpage?num=1">
					<img src="/resources/images/left.png" style="width: 60px; margin-top: 0.5em;" >
				</a>	
				</div>
				<div class="col-11">
					<h1>회원 상세정보</h1>
				</div>
			</div>
		</div>
	</div>
	
	<hr>
		
	<div class="card">
		<div class="card-body">
			<ul class="list-group list-group-flush">			
				 <li class="list-group-item">
					<h2 class="card-title">아이디</h2>
					<p class="card-text">${memvo.member_id }</p>
				</li> 
				
				<hr>
				
				<li class="list-group-item">
					<h2 class="card-title">이름</h2>
					<p class="card-text">${memvo.member_name }</p>
				</li>
				<hr>
				<li class="list-group-item">
					<h2 class="card-title">전화번호</h2>
					<p class="card-text">${memvo.member_phone }</p>
				</li>
				<hr>
				
				<li class="list-group-item">
					<h2 class="card-title">닉네임</h2>
					<p class="card-text">${memvo.member_nickname }</p>
				</li>
				<hr>
				
				<li class="list-group-item">
					<h2 class="card-title">이메일 주소</h2>
					<p class="card-text">${memvo.member_email }</p>
				</li>
				<hr>
				
				<li class="list-group-item">
					<h2 class="card-title">보유 포인트</h2>
					<p class="card-text">
						<fmt:formatNumber value="${memvo.member_pay}" pattern="#,###" /> Point
					</p>
				</li>
			</ul>
		</div>
	</div>
								
					</div>  
				</div>	   
           </div>
		</div>
	</section>
                   							         
                   
                   </div>
			    <%@ include file="../include/sidebar.jsp" %>		
			
			 </div>
		
		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>