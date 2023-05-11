<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>My Page</title>
<style type="text/css">
 h1{ 
         font-family: 'Oswald', sans-serif; 
         font-size: 30px; 
         color: #216182; 
     } 
     label { 
         display: block; 
         margin-top: 20px; 
         letter-spacing: 2px; 
     } 

input, textarea { 
         width: 439px; 
         height: 27px; 
         background-color: #efefef; 
         border-radius: 6px; 
         border: 1px solid #dedede; 
         padding: 10px; 
         margin-top: 3px; 
         font-size: 0.9em; 
         color: #3a3a3a; 
     }

input:focus, textarea:focus{ 
             border: 1px solid #97d6eb; 
         } 
         
textarea{ 
         height: 60px; 
         background-color: #efefef; 
     } 
#submit{ 
         width: 127px; 
         height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
#cancel { 
         width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     
.modal { 
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
.close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         background-color: lightgray; 
} 


.modal-content { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
         width: 500px; 
         height: 300px; 
         border-radius: 0.5rem; 
     } 
.close-button:hover { 
       background-color: darkgray; 
       font-weight: bold;
} 
.show-modal { 

         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
}
</style>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/myPage.css" />
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">

	<!-- Main -->
	<div id="main">
		<div class="inner">

		<!-- Header -->
		<%@ include file="../include/header.jsp" %>
		<%@ include file="../include/myPage.jsp" %>			
										
			<div class="infoContainer">
				<a href="/trade/buyList" class="item">구매내역</a> 
			</div>
			
			<div class="info">
				<button class="button" 
						onclick="location.href='/trade/buyList'">일반</button>
				<button class="button" 
						onclick="location.href='/trade/myBuyAuction'">경매</button>
				<button class="button" 
						onclick="location.href='/trade/myBuyRandom'">응모</button>
			</div>
								  
								  <section>
								<%-- <c:forEach var="vo" items="${buyList }"> --%>
								<c:forEach var="vo" items="${buyList }">
								<article>
								<div class="infoContainer">
								<c:if test="${vo.buy_mem_id eq sessionScope.id }">
										<div class="item">
									        <div>
									        <img src="/resources/images/${vo.product_pic.split(',')[0] }" 
									        onerror="this.src='/resources/images/default_product.jpg'" width="100px" height="80px">
									          <%-- <div>${vo.product_pic }</div> --%>
									        </div>
									        </div>
										<div class="item">
									        <div>
									          <div>${vo.product_cate }</div>
									        </div>
									        </div>
										<div class="item">
									        <div>
		        				<a href="/product/prodInfo?product_num=${vo.prod_num }&seller=${vo.sell_mem_id}">
									          <div>${vo.product_title }</div>
									          <fmt:formatNumber value="${vo.product_price }" pattern="#,###" />원</a>
									        </div>
									        </div>
										<div class="item">
									        <div>
							         	  <a href="/members/memberInfo?mem_id=${vo.sell_mem_id }"> 
							         	  <div>${vo.sell_mem_id }</div>
							         	   </a>
									        </div>
									        </div>
								<div class="script">
								<%-- 
								<c:choose>
			                        <c:when test="${not empty vo.prod_num}">
			                            <button class="trigger" disabled>이미 작성한 리뷰</button>
			                        </c:when>
			                        	<c:otherwise> --%>
						         <button class="trigger">구매후기 작성</button>      
								     <div class="modal"> 
								         <div class="modal-content"> 
								             <span class="close-button">&times;</span> 
								             <h1 class="title">구매후기</h1> 
								          
								             <form action="/trade/reviewInsert" method="POST">
								               
								               <label for="">${vo.member_nickname }님에게 구매후기 작성해주세요.</label> 
								               <label></label> 
								               <textarea name="rv_content" placeholder="Test Message" required="required"></textarea> 
								               <select name="rv_score" id="rv_score" style="width:100px;height:30px;">
													<option>평점</option>
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
													<option value="0">0</option>
												</select>
			
												<input type="hidden" name="reviewee" value="${vo.sell_mem_id}">
												<input type="hidden" name="reviewer" value="${vo.buy_mem_id}">
												<input type="hidden" name="prod_num" value="${vo.prod_num}">
												  <input type="hidden" name="buyListSize" value="${fn:length(buyList)}">
								               <input type="button" id="cancel" value="취소" onclick="location.href='/trade/buyList'" > 
								               <input type="submit" id="submit" value="작성"> 
				
								             </form> 	
								         </div> 
								     </div>
								   <%--   </c:otherwise>
								    </c:choose>  --%>
						        </div>
					        </c:if>
									</div>
									</article>
									</c:forEach>
									
										</section>
								</div>
									
	
						</div>
					<%@ include file="../include/sidebar.jsp" %>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

		<!-- <script type="text/javascript">
		$(".script").click(function(){
			  var screenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
		      var screenTop = window.screenTop != undefined ? window.screenTop : screen.top;
		 
			
			var pop_name = "WRITE FORM";
			var popOption =	"width = 800, height = 650, left=300,top=100, location=no"
			window.open("/trade/reviewInsert",pop_name,popOption);
			
		});
	
	</script> -->

  <script type="text/javascript"> 
  var modal = document.querySelectorAll(".modal");
  var buttons = document.querySelectorAll("button");
  var closeButton = document.querySelectorAll(".close-button");
  var cancelButton = document.querySelectorAll("#cancel");

  for (var i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener("click", toggleModal);
  }

  for (var i = 0; i < closeButton.length; i++) {
    closeButton[i].addEventListener("click", toggleModal);
  }

  for (var i = 0; i < cancelButton.length; i++) {
    cancelButton[i].addEventListener("click", toggleModal);
  }

  /* function toggleModal() {
    for (var i = 0; i < modal.length; i++) {
      modal[i].classList.toggle("show-modal");
    }
  } */
  function toggleModal(event) {
	  var modal = event.target.nextElementSibling;
	  modal.classList.toggle("show-modal");
	}

  function windowOnClick(event) {
    for (var i = 0; i < modal.length; i++) {
      if (event.target === modal[i]) {
        toggleModal();
        break;
      }
    }
  }

  window.addEventListener("click", windowOnClick);

  
  
  
  
  
  
  
  /*   var modal = document.querySelectorAll(".modal"); 
         var trigger = document.querySelectorAll(".trigger"); 
         var closeButton = document.querySelector(".close-button"); 
         var cancelButton = document.querySelector("#cancel"); */

         /* var triggers = document.querySelectorAll(".trigger");
         for (var i = 0; i < triggers.length; i++) {
           triggers[i].addEventListener("click", toggleModal);
         } */
         
         /* for(var i=0; i< trigger.length; i++){
         	trigger[i].addEventListener("click", toggleModal); 
         }
         //console.log(modal);

         function toggleModal() { 
             modal.classList.toggle("show-modal"); 
         }

         function windowOnClick(event) { 
             if (event.target === modal) { 
                 toggleModal(); 
             } 
         } */

         /* trigger.addEventListener("click", toggleModal);  */
      /*    closeButton.addEventListener("click", toggleModal); 
         cancel.addEventListener("click", toggleModal); 
         window.addEventListener("click", windowOnClick);  */
         

         
         
     </script>

</body>
</html>