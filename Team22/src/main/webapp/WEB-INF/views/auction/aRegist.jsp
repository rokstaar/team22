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
		<title>Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
			var dropFile = function(event) {
				alert('dd');
			    event.preventDefault();
			}
		
			$(document).ready(function(){
				$('#submit').click(function(){
					if($('#au_title').val() == ""){
						alert('제목을 입력하세요');
						return false;
					}
					if($('#au_startPrice').val() == ""){
						alert('시작금액을 입력하세요');
						return false;
					}
					if($('#au_endTime').val() == ""){
						alert('경매종료 시간을 입력하세요');
						return false;
					}
					// 파일 유효성검사 추가
					if($('#au_content').val() == ""){
						alert('상품 설명을 입력하세요');
						return false;
					}
				});
			});
		
		</script>
		
		
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<%@ include file="../include/header.jsp" %>
							<header class="major">
								<h2 style="margin-top:20px">경매 등록</h2>
							</header>

							<!-- Banner -->
								<section id="banner">
									<form method="post" enctype="multipart/form-data">
														<div class="row gtr-uniform" style="text-align: center">
															<div class="col-6 col-12-xsmall" style="margin:20px; width:100%">
																<input type="text" name="au_title" id="au_title" value="" placeholder="제목">
															</div>
															
															<br>
															
															<div class="col-6 col-12-xsmall" style="margin:20px">
																<input type="text" name="au_startPrice" id="au_startPrice" value="" placeholder="시작가격">
															</div>
															
															<!-- Break -->
															
															<div class="col-6 col-12-xsmall" style="margin:20px">
																<!-- <input type="button" id="au_pic" class="button" value="" > -->
																<input type="file" name="file1" value="" placeholder="사진등록">
													 			<input type="file" name="file2" value="" placeholder="사진등록">
																<input type="file" name="file3" value="" placeholder="사진등록">
																<!-- <div onchange="dropfile();">Drap and Drop here.</div> -->
															</div>
															
															<div class="col-6 col-12-xsmall" style="margin:20px">
																마감 시간 : <input type="date" name="au_endTime" id="au_endTime">
															</div>
															
															<!-- Break -->
															<br>
															<!-- Break -->
															<div class="col-12" style="margin:20px; width:100%">
																<textarea name="au_content" id="au_content" placeholder="경매 상품 설명" rows="6"></textarea>
															</div>
															<!-- Break -->
															<div class="col-6 col-12-xsmall" style="margin:20px; float:right">
																<ul class="actions">
																	<li><input id="submit" type="submit" value="경매 등록" class="primary"></li>
																	<li><input type="reset" value="초기화"></li>
																</ul>
															</div>
														</div>
													</form>
								</section>

							<!-- Section -->
								<section>
									
								</section>

						</div>
					</div>

				<%@ include file="../include/sidebar.jsp" %>

			</div>


	</body>
</html>