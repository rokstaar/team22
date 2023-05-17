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
		
			$(document).ready(function(){
				
				$('#submit').click(function(){
					if($('#ran_title').val() == ""){
						alert('제목을 입력하세요');
						return false;
					}
					if($('#ran_maxPp').val() == ""){
						alert('모집인원을 입력하세요');
						return false;
					}
					if($('#ran_startPrice').val() == ""){
						alert('금액을 입력하세요');
						return false;
					}
					if($('#ran_endTime').val() == ""){
						alert('응모종료 시간을 입력하세요');
						return false;
					}
					if($('#ran_content').val() == ""){
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
								<h2 style="margin-top:20px">응모 등록</h2>
							</header>
							<!-- Banner -->
								<section id="banner">
									<form method="post" enctype="multipart/form-data">
														<div class="row gtr-uniform">
															<div class="col-6 col-12-xsmall" style="margin:20px; width:100%">
																<input type="text" name="ran_title" id="ran_title" placeholder="제목">
															</div>
															<div class="col-6 col-12-xsmall" style="margin:20px">
																<input type="text" name="ran_price" id="ran_price" style="margin-bottom:5px" placeholder="가격">
																<input type="text" name="ran_maxPp" id="ran_maxPp" placeholder="모집 인원">
															</div>
															
															
															<!-- Break -->
															
															<div class="col-6 col-12-xsmall" style="margin:20px">
																<input id="file1" type="file" name="file1" style="margin-bottom:5px">
																<input type="file" name="file2"style="margin-bottom:5px">
																<input type="file" name="file3">
															</div>
															
															<div class="col-6 col-12-xsmall" style="margin:20px">
																마감시간 : <input type="date" name="ran_endTime" id="ran_endTime">
															</div>
															<!-- Break -->
															<br>
															<!-- Break -->
															<div class="col-12" style="margin:20px; width:100%">
																<textarea name="ran_content" id="ran_content" placeholder="응모 상품 설명" rows="6"></textarea>
															</div>
															<!-- Break -->
															<div class="col-12" style="margin:20px; float:right">
																<ul class="actions">
																	<li><input id="submit" type="submit" value="응모 등록" class="primary"></li>
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