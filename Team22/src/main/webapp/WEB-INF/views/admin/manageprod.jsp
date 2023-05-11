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
		
<style type="text/css">

ul,li{list-style:none}

.container{margin-top:45px;
           text-align:center;}

/* 탭메뉴 공통 */
.tab_menu, .tab_content{width:800px;margin:30px auto 0}
/* .tab_menu li, .tab_content li{
border:1px solid #000
} */

/* 탭메뉴 버튼 */
.tab_menu {display:table;table-layout:fixed}
.tab_menu li{display:table-cell;padding:20px 0;cursor:pointer}
.tab_menu li img{vertical-align:middle}
.tab_menu li.on{background:#B9D7EA}
.tab_menu li+li{border-left:none}

/* 탭메뉴 컨텐츠 */
.tab_content li{display:none;min-height:300px}
.tab_content li.on{display:block}
	
		
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

			 				  
 <main class="container">
        <ul class="tab_menu" style="width: 100%;">
            <li data-tab="tab-1" class="on">판매</li>
            <li data-tab="tab-2">경매</li>
            <li data-tab="tab-3">랜덤(이벤트)</li>
        </ul>
       
       
  <ul class="tab_content" style="width: 100%;">    
     <li id="tab-1" class="on">
       <table>
           <tr>
             <th>판매자</th>
             <th>카테고리</th>
             <th>제목</th>       
             <th>가격</th>       
             <th>등록일</th>       
           </tr>
       
       <c:forEach var="plist" items="${productList }">  
           <tr>
             <td>${plist.product_seller }</td>
             <td>${plist.product_cate }</td>
             <td>
              <a href="/product/prodInfo?product_num=${plist.product_num}">${plist.product_title }</a>   
             </td>
             <td>${plist.product_price }</td>
             <td>${plist.product_date }</td>
           </tr>
       </c:forEach>   
      </table>
     </li>
  </ul>
        
        
    <ul class="tab_content" style="width: 100%;">    
      <li id="tab-2">
         <table>
            <tr>
              <th>경매자</th>
              <th>입찰자</th>
              <th>상품이름</th>
              <th>입찰가격</th>
              <th>종료시간</th>
            </tr>
       
      <c:forEach var="alist" items="${aucionList }">  
           <tr>
             <td>${alist.au_sellerId }</td>
             <td>${alist.au_buyerId }</td>
             <td>
               <a href="/auction/aDetail?au_num=${alist.au_num }">${alist.au_title }</a> 
             </td>
             <td>${alist.au_endPrice }</td>
             <td>${alist.au_endTime }</td>
           </tr>
       </c:forEach> 
     </table>
   </li>
 </ul>   
 
 
    <ul class="tab_content" style="width: 100%;">    
      <li id="tab-3">
         <table>
            <tr>
              <th>랜덤판매자</th>
              <th>당첨자</th>
              <th>상품이름</th>
              <th>당첨가격</th>
              <th>종료시간</th>
            </tr>
       
          <c:forEach var="rlist" items="${randomList }">  
           <tr>
             <td>${rlist.ran_sellerId }</td>
             <td>${rlist.ran_buyerId }</td>
             <td>
               <a href="/random/rDetail?ran_num=${rlist.ran_num }">${rlist.ran_title }</a>
             </td>
             <td>${rlist.ran_bidPrice }</td>
             <td>${rlist.ran_endTime }</td>
           </tr>
       </c:forEach>  
    </table>
   </li>
 </ul> 
</main>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="./tab.js"></script>									  
							  
	<script type="text/javascript">
	$(document).ready(function () {
	    $(".tab_menu li").click(function () {
	        var $this = $(this),
	            tabId = $this.data("tab"),
	            tabIndex = $this.index();

	        $(".tab_menu li, .tab_content li").removeClass("on");

	        $this.addClass("on");
	        $("#"+tabId).addClass("on");

	        $(".tab_menu li").each(function (content) {
	            $(this).find("img").attr("src", $(this).find("img").attr("src").replace("_off","_on"));
	            
	            if (tabIndex != content) {
	                $(this).find("img").attr("src", $(this).find("img").attr("src").replace("_on","_off"));
	            }
	        });
	    });
	})
		
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