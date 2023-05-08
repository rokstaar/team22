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
			
			
		</script>
		
		<style>
			#subSpan{
				position: relative;
				  width: 250px;
				  height: 180px;
				  overflow: hidden;
				  margin: 50px;
			}
		
			#subPic{
				width:100%; 
				height:100%; 
				
			}
		
		</style>
		
		
		
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<%@ include file="../include/header.jsp" %>

							
							<!-- Section -->
								<section style="padding-top:20px">
								
									<header class="major">
										<h2 style="margin-bottom:10px">${id }님의 응모결과</h2>
										<a href='/random/rRegist'>응모 등록하기</a>
										<a href='/random/rList' style="float:right">응모 목록으로</a>
									</header>
									
									<a href="/random/myRan" class="button" style="display: inline-block; float: left; margin-right:10px">당첨 결과 확인</a>
									<a href="/auction/list" class="button" style="display: inline-block; float: left; margin-right:10px">응모금 </a>
									
									<div class="features">
									
										<c:if test="${not empty rList and rList != '[null]' }">
										
											<c:forEach items="${rList }" var="rList">
											<c:if test="${id ne rList.ran_sellerId }">
												<article style="text-align: center; border: solid 3px #769fcd; margin:20px;">
													<span id="subSpan"><img id="subPic" src="/random/download?fileName=${rList.ran_pic.replace('[','').replace(']','').split(',')[0]}" /></span>
													<div class="content">
														<h3>${rList.ran_title }</h3>
														<p>
														판매자 : ${rList.ran_sellerId }<br>
														<c:if test="${rList.ran_buyerId eq id }">
															<p class="button">당첨되셨습니다</p>
														</c:if>
														<c:if test="${rList.ran_buyerId ne id }">
															<p class="button">당첨되지 못하셨습니다</p>
														</c:if>
														
														</div>
												</article>
											</c:if>
											</c:forEach>
										</c:if>
									
									</div>
									
									<ul class="pagination" style="text-align: center;">
										<c:if test="${pageDTO.prev == true }">
											<li><a href="/auction/list?page=${pageDTO.cri.page - 1}" class="button">Prev</a></li>
										</c:if>
										<c:if test="${pageDTO.prev == false }">
											<li><a href="/auction/list?page=${pageDTO.cri.page - 1}" class="button disabled ">Prev</a></li>
										</c:if>
										<c:forEach begin="${pageDTO.startPage }" end="${pageDTO.endPage }" var="i">
										
											<c:if test="${pageDTO.cri.page == i}">
												<li><a href="/auction/list?page=${i }" class="page active">${i }</a></li>
											</c:if>
											<c:if test="${pageDTO.cri.page != i}">
												<li class="page"><a href="/auction/list?page=${i }">${i }</a></li>
											</c:if>
											
										</c:forEach>
			
										<c:if test="${pageDTO.next == true }">
											<li><a href="/auction/list?page=${pageDTO.cri.page + 1 }" class="button">Next</a></li>
										</c:if>
										<c:if test="${pageDTO.next == false }">
											<li><a href="/auction/list?page=${pageDTO.cri.page + 1 }" class="button disabled">Next</a></li>
										</c:if>
									</ul>
								</section>
						</div>
					</div>

				<%@ include file="../include/sidebar.jsp" %>

			</div>


	</body>
</html>