<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Banner -->
								<section id="banner">
									<div class="content">
									<div class="wrap">
									  <div class="shippingStatusContainer">
									    <div class="status">
									      
									      <div class="item">
									        <div>
									        <img alt="프로필사진" src="${memberInfo.member_pic}" width="150px" height="100px" >
									       </div>
									      	
									        <div style="margin-left: 10px;">
									          <div style="font-size: 20px;" >${sessionScope.id }</div>
									       	   <div style="font-size: 20px;">페이 : ${memberInfo.member_pay } 원</div>
									         <a href="/members/updatePwCk"><div style="font-size: 20px;">회원정보수정</div></a>
									         <a href="/members/deletePwCk"><div style="font-size: 20px;">회원탈퇴</div></a>
									        </div>
									      </div>
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
									          <a href="/trade/myAuctionList" > <div class="text">경매내역</div>
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

		
	</body>
</html>