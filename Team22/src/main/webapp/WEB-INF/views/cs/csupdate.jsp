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
<title>문의사항 수정</title>
		
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
		
<h2>문의사항 수정</h2>


<form method="post" enctype="multipart/form-data">
   <input type="hidden" name="mem_id" value="${id }"> 
   <input type="hidden" name="cs_num" value="${cvo.cs_num }"> 
	<table>
	   
	   <tr>
		<th class="w-px160" style="font-size:large;">상담분류</th>
			<td>
			 <select name="cs_category" id="cs_category" class="readonly" style="width: 185px;"
			         onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
					<option ${cvo.cs_category eq '회원정보'? 'selected' : '' }>회원정보</option>
					<option ${cvo.cs_category eq '중고거래'? 'selected' : '' }>중고거래</option>
					<option ${cvo.cs_category eq '있지페이'? 'selected' : '' }>있지페이</option>
					<option ${cvo.cs_category eq '다른 문제가 있어요'? 'selected' : '' }>다른 문제가 있어요</option>
					<option ${cvo.cs_category eq '회원정보'? 'selected' : '' }>회원정보</option>
			</select>
		</td>
	</tr>
		
		<tr>
			<th class="w-px160" style="font-size:large;">제목</th>
			<td><input type="text" name="cs_sub" class="need" placeholder="제목을 입력하세요." required value="${cvo.cs_sub}"/></td>
		</tr>
		
		<tr>
			<th style="font-size:large;">내용</th>
			<td><textarea name="cs_content" class="need" rows="6" placeholder="내용을 입력하세요." required >${cvo.cs_content}</textarea></td>
		</tr>
		
		 <tr>
			<th style="font-size:large;">파일 첨부</th>
			<td class="left">
                <input type="file" name="file" id="image" value="${cvo.cs_file0 }">
                <img alt="" src="${cvo.cs_file0 }"> <br>
           
                <input type="file" name="file2" id="image1" value="${cvo.cs_file1 }">
				<img alt="" src="${cvo.cs_file1 }"><br>
			
				<input type="file" name="file3" id="image2" value="${cvo.cs_file2 }">
				<img alt="" src="${cvo.cs_file2 }"> <br>
 			</td>		
		</tr> 
		
	</table>

	
	<div style="text-align: center;">
	   <input type="checkbox" name="cs_secret" id="cs_secret" value="${cvo.cs_secret}" >
	   <label class="form-check-label" for="cs_secret">비밀글 설정</label>
	</div>

   
   <div class="btn_wrap">
         <button type="submit" class="button primary"> 수정하기 </button>
         <button type="submit" class="button primary" 
                 onclick="location.href='/cs/cslist?num=1';"> 취소하기 </button>
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