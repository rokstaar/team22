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
		<title>admin Page</title>
		
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
						 
					        <div class="table-member">
									<table>
										<tr>
										    <th>판매자</th>										
											<th>카테고리</th>
											<th>제품명</th>
											<th>시작가격</th>
											<th>현재가격</th>
											<th>상세보기</th>
										</tr>

										<c:forEach var="alist" items="${aucionList}">
											<tr>											
												<td>${alist.au_sellerId}</td>
												<td>${alist.au_category}</td>
												<td>
												  <a href="/auction/aDetail?au_num=${alist.au_num}">${alist.au_title}</a>
												</td>
												<td>${alist.au_startPrice}</td>
												<td>${alist.au_bidPrice}</td>
												<td>
												  <a href="/admin/audetail?au_num=${alist.au_num}">경매자 목록보기</a>
												</td>
											</tr>
										</c:forEach>	
									</table>
						       </div> 
						       
<%-- <div style="text-align: center; font-size: large;">	
				<c:if test="${mdto.prev}">
					<span>[ <a href="/admin/adminpage?num=${mdto.startPageNum - 1}${mdto.searchTypeKeyword}">이전</a> ]  </span>
				</c:if>

				<c:forEach begin="${mdto.startPageNum}" end="${mdto.endPageNum}" var="num">
						<span> <c:if test="${select != num}">
								<a href="/admin/adminpage?num=${num}${mdto.searchTypeKeyword}">${num}</a>
						</c:if> 
					<c:if test="${select == num}">
								<b>${num}</b>
						</c:if>
                      </span>
				</c:forEach>

				<c:if test="${mdto.next}">
						<span>[ <a href="/admin/adminpage?num=${mdto.endPageNum + 1}${mdto.searchTypeKeyword}">다음</a> ]</span>
				</c:if>
</div>		 --%>

<br><br>


<div style="margin-left: 30em;"> 
  <div style="float: left; margin-right: 0.3em;">
    <select name="searchType" style="width: 120px;">
      <option value="id" <c:if test="${mdto.searchType eq 'id'}">selected</c:if>>아이디</option>
      <option value="email" <c:if test="${mdto.searchType eq 'email'}">selected</c:if>>이메일</option>
    </select>
  </div> 
 
   <div  style="float: left; margin-right: 0.1em;">
      <input type="text" name="keyword" value="${mdto.keyword}" style="width: 350px;" placeholder="검색어 입력"/>
   </div>  
   <div style="float: left; margin-left: 0.03em;" >
      <button style="border-radius: 2em" type="button" id="searchBtn" >검색</button>
   </div> 
</div>				       
						       
<script type="text/javascript">
    document.getElementById("searchBtn").onclick = function() {
    	  let searchType = document.getElementsByName("searchType")[0].value;
    	  let keyword =  document.getElementsByName("keyword")[0].value;
    	  
    	  console.log(searchType)
    	  console.log(keyword)
    	  
    	  location.href = "/admin/adminpage?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
    };
</script>								       
						       
								
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