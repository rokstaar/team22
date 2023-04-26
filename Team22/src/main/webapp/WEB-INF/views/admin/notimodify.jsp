<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>공지사항 수정</title>
		

		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/myPage.css" />
		<link rel="stylesheet" href="/resources/assets/css/styles.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
		      integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
			<link href="/resources/assets/css/notice.css" rel="stylesheet"/>      
<style>

body {
  padding-top: 70px;
  padding-bottom: 30px;
}

</style>

</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

	<!-- Header -->
       <%@ include file="../include/header.jsp" %>		
																
							<!-- Banner -->
							<section id="banner">
								 <div class="content">
								 <div class="wrap">
								  <div class="shippingStatusContainer"> </div>    
								  					   
	 <article>
		<div class="container" role="main">
			<h2>공지사항 수정</h2> 
			    <hr>
			
			<form name="form" id="form" role="form" method="post">
			        <input type="hidden" name="noti_num" value="${vo.noti_num }"> 
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="noti_title" id="title" value="${vo.noti_title}">
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="noti_content" id="content">${vo.noti_content}</textarea>
				</div>
			
               <div class="btn_wrap">
                    <button type="submit" class="button primary"> 수정 </button>
                    <button type="button" class="button primary" 
                             id="btnList" onclick="location.href='/admin/notice';">목록</button>
               </div>                   
         </form>  
        </div>
	</article> 
									  
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