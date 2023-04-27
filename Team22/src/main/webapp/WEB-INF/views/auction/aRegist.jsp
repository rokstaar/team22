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

							<%@ include file="../include/header.jsp" %>

							<!-- Banner -->
								<section id="banner">
									<form method="post" enctype="multipart/form-data">
														<div class="row gtr-uniform">
															<div class="col-6 col-12-xsmall">
																<input type="text" name="au_title" id="au_title" value="" placeholder="제목">
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="text" name="au_startPrice" id="au_startPrice" value="" placeholder="시작가격">
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="datetime-local" name="au_endTime" id="au_endTime" value="" placeholder="종료시간">
															</div>
															<!-- Break -->
															<div class="col-12">
																<select name="au_category" id="au_category">
																	<option value="">- 카테고리 -</option>
																	<option value="디지털기기">디지털기기</option>
																	<option value="가구/인테리어</">가구/인테리어</option>
																	<option value="스포츠/레저">스포츠/레저</option>
																	<option value="도서">도서</option>
																</select>
															</div>
															<div class="col-6 col-12-xsmall">
																<input type="file" name="file" id="au_pic" value="" placeholder="사진등록">
															</div>
															<!-- Break -->
															<br>
															<!-- Break -->
															<div class="col-12">
																<textarea name="au_content" id="au_content" placeholder="경매 상품 설명" rows="6" style="width:1000px"></textarea>
															</div>
															<!-- Break -->
															<div class="col-12">
																<ul class="actions">
																	<li><input type="submit" value="경매 등록" class="primary"></li>
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