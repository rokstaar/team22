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
<title>문의사항 등록</title>
		
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

			 <!-- 	Main -->
					<div id="main">
						<div class="inner">  

	<!-- Header -->
       <%@ include file="../include/header.jsp" %>		
																
							<!-- Banner -->
							<section id="banner">
								 <div class="content"> 
								  <div class="wrap">
								   <div class="shippingStatusContainer"> 
		
	<h2>문의사항 등록</h2>

<!-- 
파일 첨부 시 form 태그의  필요 속성
1. 반드시 method가 post
2. enctype을 지정 ▶ enctype='multipart/form-data'
 -->
<form method="post"> <!-- enctype="multipart/form-data" -->
   <input type="hidden" name="mem_id" value="${id }"> 
	<table>
	    <tr>
		<th class="w-px160" style="font-size:large;">상담분류</th>
			<td>
			  <select name="cs_category" id="cs_category" style="width: 185px;" required>
					<option value="" >상담유형선택 ▽</option>
					<option value="회원정보" >회원정보</option>
					<option value="중고거래" >중고거래</option>
					<option value="있지페이">있지페이</option>
					<option value="다른 문제가 있어요">다른 문제가 있어요</option>
			</select>
		</td>
	</tr>
		<tr>
			<th class="w-px160" style="font-size:large;">제목</th>
			<td><input type="text" name="cs_sub" class="need" placeholder="제목을 입력하세요." required/></td>
		</tr>
		
		<tr>
			<th style="font-size:large;">내용</th>
			<td><textarea name="cs_content" class="need" rows="7" placeholder="내용을 입력하세요." required></textarea></td>
		</tr>
		
		<!-- <tr>
			<th style="font-size:large;">파일 첨부</th>
			<td class="left">
                <input type="file" name="cs_file0 " name="cs_file0" multiple="multiple"/>
 			</td>		
		</tr> -->
		
	</table>

	
	<div style="text-align: center;">
	   <input type="checkbox" name="cs_secret" id="cs_secret" >
	   <label class="form-check-label" for="cs_secret">비밀글 설정</label>
	</div>

   
   <div class="btn_wrap">
         <button type="submit" class="button primary"> 등록하기 </button>
   </div>
</form>	

<!-- <script type="text/javascript" src="js/file_attach.js"></script> -->
       
        
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