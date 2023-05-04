<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/myPage.css" />
		<link rel="stylesheet" href="/resources/assets/css/styles.css" />
		<link href="/resources/assets/css/notice.css" rel="stylesheet"/>			
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
								<div class="shippingStatusContainer">


																	
   <div class="container managergrounp" id="container" name="container" >
            <h2> 공지 사항 </h2>
            <hr>         		
         
   <br><br>
     
 <div style="margin-right: 1em; display: none;">
    <select name="searchType" style="width: 200px;">
      <option value="all" <c:if test="${ndto.searchType eq 'all'}">selected</c:if>>전체</option>
    </select>
  </div> 
 
   <div style="float:left; margin-right: 0.1em; margin-left: 24em;" >
      <input type="text" name="keyword" value="${ndto.keyword}" style="width: 600px;" placeholder="궁금한 것을 검색해보세요."/>
   </div>  
   <div style="float: left;" >
      <button style="border-radius: 2em" type="button" id="searchBtn" >검색</button>
   </div>  

   <br><br><br><br>


<script type="text/javascript">
    document.getElementById("searchBtn").onclick = function() {
    	  let searchType = document.getElementsByName("searchType")[0].value; 
    	  let keyword =  document.getElementsByName("keyword")[0].value;
    	  
    	  console.log(searchType)
    	  console.log(keyword)
    	  
    	  location.href = "/admin/notice?num=1" +  "&searchType=" + searchType + "&keyword=" + keyword;
    };
</script>

            <table class="bbsList">
                <thead class="head">
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>   
                        <th>등록일</th>
                        <th>조회수</th>     
                    </tr>    
                </thead>
                <tbody class="body">
                  <c:forEach var="nlist" items="${noticeList}">	 
                    <tr>
                        <td class="">${nlist.noti_num }</td>
                        <td class="">
                          <a href="/admin/notiread?noti_num=${nlist.noti_num}">
                            ${nlist.noti_title }
                          </a>
                         </td>
                        <td class="">${nlist.noti_date }</td>    
                        <td class="">${nlist.noti_readcount }</td>                                                                 
                    </tr> 
                </c:forEach>	                   
                </tbody>
            </table>
           
       <div style="text-align: center; font-size: large;">	
				
				<c:if test="${ndto.prev}">
					<span>[ <a href="/admin/notice?num=${ndto.startPageNum - 1}${ndto.searchTypeKeyword}">이전</a> ]  </span>
				</c:if>

				<c:forEach begin="${ndto.startPageNum}" end="${ndto.endPageNum}" var="num">
					<span> 
						<c:if test="${select != num}">
						    <a href="/admin/notice?num=${num}${ndto.searchTypeKeyword}">${num}</a>
						</c:if> 
					    <c:if test="${select == num}">
							<b>${num}</b>
						</c:if>
						
                      </span>
				</c:forEach>

				<c:if test="${ndto.next}">
						<span>[ <a href="/admin/notice?num=${ndto.endPageNum + 1}${ndto.searchTypeKeyword}">다음</a> ]</span>
				</c:if>
		</div>	
    </div>	
    
    <br><br><br><br><br><br>    				
		 
		 <div style="text-align:right; font-size: larger;">
			<c:if test="${id != null && id ==('admin')}">	
					<a href="/admin/noticewrite">공지사항 등록</a>
			</c:if>		
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
			
			