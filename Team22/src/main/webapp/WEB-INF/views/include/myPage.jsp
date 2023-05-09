<%@page import="com.market.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Banner -->

<%

// MemberVO memberInfo = (MemberVO) request.getattribute("memberinfo");

// session.setattribute("memberinfo", memberinfo);
%>

								<section id="banner">
									<div class="content">
									<div class="wrap">
									  <div class="shippingStatusContainer">
									    <div class="status">
									      <div class="item">
									        <div>
									        <a href="/trade/buyList" > <div class="text">거래내역</div>
									          </a>
									        </div>
									      </div>  
									      <div class="item">
									        <div>
									         <a href="/trade/mySaleProduct" > <div class="text">판매상품</div>
									          </a>
									        </div>
									      </div>    
									      <div class="item">
									        <div>
									          <a href="/trade/myAuctionList" > <div class="text">경매·응모</div>
									          </a>
									        </div>
									      </div>     
									      <div class="item">
									        <div>
									          <a href="/trade/favorite" > <div class="text">찜한상품</div>
									          </a>
									        </div>
									      </div>     
									      <div class="item">
									     <a href="/trade/buyReview">  <div>
									          <div class="text">거래후기</div>
									          </a>
									        </div>
									      </div>      
									      
									    </div>
								
													    
									  </div>  
									</div>	
								
									  </section>

<script type="text/javascript">
//alert("${result}");
var result = "${update}";

if(result == "update"){
	alert("회원수정완료!");		
}
</script>

		