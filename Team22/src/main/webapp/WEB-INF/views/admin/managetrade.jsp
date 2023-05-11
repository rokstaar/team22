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
body{
  padding: 0;
  margin: 0;
}
div{
  box-sizing: border-box;
}

/* alert badge */
.circle{
  display: inline-block;
  width: 5px;
  height: 5px;
  border-radius: 2.5px;
  background-color: #ff0000;
  position: absolute;
  top: -5px;
  left: 110%;
}

/* 파랑색 테스트 */
.rightBlue{
  color: #3F72AF;
}

.wrap{
  background-color: #F8F8F8;  
}
/* 녹색배경 */
.greenContainer{  
  height: 132px;
  background-color: #24855b;    
  
  display: flex;
  align-items: flex-end;
  padding: 16px;
}

.greenContainer .name{
   font-size: 20px;
  font-weight: bold;
  color: #ffffff;
} 
.greenContainer .modify{
  margin-left: auto;
}

/* 단골상점 , 상품후기 , 적립금 박스 */
.summaryContainer{
  background-color: white;  
  display: flex;  
  padding: 21px 16px;  
  height: 90px;
  margin-bottom: 10px;
}
/* 단골상점 , 상품후기 , 적립금 */
.summaryContainer .item{
  flex-grow: 1
}
/* 파란 숫자 */
.summaryContainer .rightBlue{
  font-size: 19px;
  font-weight: bold;
  color: #3F72AF;
}
/* 텍스트 */
.summaryContainer .item > div:nth-child(2){
  font-size: 13px;
}

/* ================== 주문/배송조회 박스 시작 ==================== */
.shippingStatusContainer{
  padding: 21px 16px;
  background-color: white;
  margin-bottom: 10px;
}

/* 주문/배송조회 타이틀 */
.shippingStatusContainer .title{
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.shippingStatusContainer .status{
  display: flex;
  justify-content: space-between;
  margin-bottom: 21px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.shippingStatusContainer .item{
  display: flex;
}

.shippingStatusContainer .number{
  font-size: 31px;
  font-weight: 500;
  text-align: center;
}
.shippingStatusContainer .text{
  font-size: 14px;
  font-weight: normal;
  color: black;
  font-weight : bold;
  text-align: center;
}
.shippingStatusContainer .memberUpdate{
  font-size: 14px;
  font-weight: normal;
  color: #769fcd;
  font-weight : bold;
  text-align: center;
}
.shippingStatusContainer .icon{
  display: flex;
  align-items: center;
  padding: 20px;
  width: 16px;
  height: 16px;
}


/*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
.listContainer{  
  padding: 0;
  background-color: #ffffff;
  margin-bottom: 10px;
}
.listContainer .item{  
  display: flex;
  align-items: center;
  padding: 16px;
  color: black;
  text-decoration: none;  
  height: 56px;
  box-sizing: border-box;
}
.listContainer .icon{  
  margin-right: 14px;
}
.listContainer .text{
  font-size: 16px;
  position: relative;
}
.listContainer .right{
  margin-left: auto;
}


/*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
.listContainer .smallLight{
  font-size: 14px;
  color: #c2c2c2;  
}
.listContainer .smallLight > span{
  margin-left: 10px;
}

.listContainer .right .blct{
  font-size: 14px;
  font-weight: bold;
  margin-right: 5px;
}



/* 공지사항 이용안내 고객센터 */
.infoContainer{
  background-color: white; 
  display: flex;
  height: 100px;
  margin-bottom: 10px;    
}

/* .infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 13px;
  text-decoration: none;
  color: black;
} */
.infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 23px;
  text-decoration: none;
  color: 769fcd;
  font-weight: bold;
}
.infoContainer .item > div:first-child{
  margin-bottom: 2px;
}



/*  */
.listContainer .item:hover{
/*   background-color: #f8f8f8; */
}
.infoContainer .item:hover{
/*   background-color: #f8f8f8; */
}

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
.tab_menu li.on{background:#333}
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
            <li data-tab="tab-1" class="on">구매내역</li>
            <li data-tab="tab-2">판매내역</li>
        </ul>
       
       
  <ul class="tab_content" style="width: 100%;">    
     <li id="tab-1" class="on">
       <table>
           <tr>
             <th>구매자</th>
             <th>카테고리</th>
             <th>상품이름</th>       
             <th>가격</th>       
             <th>판매자</th>       
           </tr>
       
    <%--  <c:forEach var="bplist" items="${buyprodList }">   
           <tr>
             <td>${bplist.buy_mem_id }</td>
             <td>${bplist.product_cate }</td>
             <td>${bplist.product_title }</td>
             <td>${bplist.product_price }</td>
             <td>${bplist.sell_mem_id }</td>
           </tr>
     </c:forEach>   --%>
       </table>
       </li>
  </ul>
        
        
    <ul class="tab_content" style="width: 100%;">    
      <li id="tab-2">
         <table>
            <tr>
              <th>판매자</th>
              <th>카테고리</th>
              <th>상품이름</th>
              <th>가격</th>
              <th>구매자</th>
            </tr>
       
       <%--  <c:forEach var="splist" items="${sellprodList }">   
            <tr>
              <td>${splist.sell_mem_id }</td>
              <td>${splist.product_cate }</td>
              <td>${splist.product_title }</td>
              <td>${splist.product_price }</td>
              <td>${splist.buy_mem_id }</td>
            </tr>
       </c:forEach>   --%>
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