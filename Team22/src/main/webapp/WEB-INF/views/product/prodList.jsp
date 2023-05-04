<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<title>잊지마! 있지마켓</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/product.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.4/nouislider.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.4/nouislider.min.js"></script>
		
		
<link rel="preload" href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff" as="font" type="font/woff" crossorigin>
		
		<style>
			#sidebar.force-inactive{
				margin-left: -26em;
			}
			
			.custom-button {
		    background: none;
		    border: none;
		    color: inherit;
		    cursor: pointer;
		    font-size: inherit;
		    font-family: inherit;
		  }
		
		  .custom-button:focus {
		    outline: none;
		  }
		  
		  a.product-section {
			    text-decoration: none;
			    color: inherit;
			    outline: none;
			    cursor: pointer;
			}
			
			a.product-section:hover,
			a.product-section:focus {
			    text-decoration: none;
			    color: inherit;
			}
					  
		  
		</style>
		<script type="text/javascript">
			function imgerr(img){
				img.onerror = null;
				img.src = '/resources/images/default_product.jpg';
				img.alt = "사진이 없습니다";
			}
			
			
		</script>
	</head>
	<body>
	
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner" style="max-width:95em;">

							<!-- Header -->
								<header id="header">
									<a href="/main" class="logo"><strong>있지마켓</strong></a>
									<ul class="icons">
										<c:if test="${id == null }">
											<li><a href="/members/login"><span class="label">로그인</span></a></li>
											<li><a href="#"><span class="label">회원가입</span></a></li>
										</c:if>
                                        
                                        <c:if test="${id != null && id !=('admin')}">
                                           <li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
                                           <li><a href="/members/myPage" ><span class="label">마이페이지</span></a></li>
                                            <li><a href="/chat" ><span class="label">내채팅</span></a></li>
										  <!--  <li><a href="/chat" class="icon fa-instagram"> 내채팅<span class="label"></span></a></li> -->
                                        </c:if>

                                        <c:if test="${id != null && id ==('admin')}">
                                            <li><a href="/members/logout"><span class="label">로그아웃</span></a></li>
                                            <li><a href="/admin/adminPage" ><span class="label">관리자</span></a></li>
                                        </c:if>
										

									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>있지마켓 상품목록</h1>
										</header>
									</div>
			
			
			
								</section>

							<!-- Section -->
									
									
									<section>
									<div id="div-filter-show">
	<form id="filter-form">
		<div class="div-filter-part">
		<button type="button" onclick="resetForm();">검색조건 초기화</button>
		<div class="select-container">
			<select name="sort" id="sort-select" class="select_filter">
				<option value="" hidden>===정렬===</option>
				<option value="">전체</option>
				<option value="price_asc">가격 낮은 순</option>
				<option value="price_desc">가격 높은 순</option>
				<option value="date_desc">최근일자 순</option>
				<option value="date_asc">예전일자 순</option>
			</select>
		</div>
		<div class="select-container">
			<select name="grade" id="grade-select" class="select_filter">
				<option value="" hidden>==상품상태==</option>
				<option value="">전체</option>
				<option value="상">상</option>
				<option value="중">중</option>
				<option value="하">하</option>
			</select>
		</div>
		<div class="select-container">
			<select name="category" id="category-select" class="select_filter">
				<option value="" hidden>====분류====</option>
				<option value="">전체</option>
				<option value="의류">의류</option>
				<option value="가전제품">가전제품</option>
				<option value="식기,가구">식기,가구</option>
				<option value="디지털,전자기기">디지털,전자기기</option>
				<option value="식품,생필품">식품,생필품</option>
				<option value="스포츠,건강">스포츠,건강</option>
				<option value="기기,공구">기기,공구</option>
				<option value="도서,쿠폰">도서,쿠폰</option>
				<option value="유아">유아</option>
				<option value="애완동물">애완동물</option>
				<option value="기타">기타</option>
			</select>
			</div>
		</div>
		<div class="div-filter-part">
		최소가격<input type="number" name="minPrice" id="min-price" min="0" max="100000000" value="${param.minPrice }">
		~최대가격<input type="number" name="maxPrice" id="max-price" min="0" max="100000000" value="${param.maxPrice }">
		<div class="div-search">		
			<input type="text" name="title" class="search-input">
			<div id="div-filter-submit">
				<i class="fas fa-search"></i>
			</div>
			<input type="submit" style="display:none;">
		</div>
		</div>
	</form>
	</div>
	
	<section>
		<header class="major">
			<h2>${param.title } 조회 결과</h2>
		</header>
		<div class="posts">
			<c:forEach var="list" items="${prodList }">
				<article>
			
			<a class="product-section" href="/product/prodInfo?product_num=${list.product_num }&seller=${list.product_seller}">
				<div class="img-wrapper">
					<img src="/product/download?fileName=${list.product_pic.split(',')[0] }" 
					onerror="imgerr(this)" draggable="false">
				</div>
			<div style="float:right;">
				조회수 ${list.product_readcount }
				좋아요 <div class="smalldiv" id="${list.product_num }">${list.product_favorite }</div>
			</div>
			<div>${list.product_title }</div>
			
			
			<div>${list.product_seller }</div>
			<div style="float:left;">
				<fmt:formatNumber value="${list.product_price }" pattern="#,###" />원
			</div>
			</a>
			<c:if test="${not empty id}">
<div class="div-likeit" data-product-num="${list.product_num}" data-seller="${list.product_seller}" data-svg-visible="false">
	
	<?xml version="1.0" ?><svg class="svg-1" style="display:none;" height="24" version="1.1" width="24" xmlns="http://www.w3.org/2000/svg" xmlns:cc="http://creativecommons.org/ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><g transform="translate(0 -1028.4)"><path d="m7 1031.4c-1.5355 0-3.0784 0.5-4.25 1.7-2.3431 2.4-2.2788 6.1 0 8.5l9.25 9.8 9.25-9.8c2.279-2.4 2.343-6.1 0-8.5-2.343-2.3-6.157-2.3-8.5 0l-0.75 0.8-0.75-0.8c-1.172-1.2-2.7145-1.7-4.25-1.7z" fill="#c0392b"/></g></svg>
	
	<?xml version="1.0" ?><!DOCTYPE svg  PUBLIC '-//W3C//DTD SVG 1.1//EN'  'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'><svg class="svg-2" style="display:block;" enable-background="new 0 0 48 48" height="22px" id="Layer_1" version="1.1" viewBox="0 0 48 48" width="22px" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path clip-rule="evenodd" d="M24.804,43.648L24,44l-0.804-0.352C12.862,37.313,2,22.893,2,14.884  C2.035,8.326,7.404,3.002,14,3.002c4.169,0,7.849,2.128,10,5.349c2.151-3.221,5.831-5.349,10-5.349c6.596,0,11.965,5.324,12,11.882  C46,22.893,35.138,37.313,24.804,43.648z M34,4.993c-3.354,0-6.469,1.667-8.335,4.46L24,11.946l-1.665-2.494  C20.469,6.66,17.354,4.993,14,4.993c-5.484,0-9.971,4.442-10,9.891c0,7.064,10.234,20.808,20,26.917  c9.766-6.109,20-19.852,20-26.907C43.971,9.435,39.484,4.993,34,4.993z" fill-rule="evenodd"/></svg>

</div>
			</c:if>
				</article>
			</c:forEach>
		</div>
	</section>
	
	<!-- fixed button -->
	<div class="fixed">
		<div>
			<?xml version="1.0" ?><svg id="up-btn" class="list-sub-button" style="enable-background:new 0 0 16 16;" version="1.1" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><title>위로</title><path d="M8,0C3.582,0,0,3.582,0,8s3.582,8,8,8s8-3.582,8-8S12.418,0,8,0z M12.646,10.854L8,6.207l-4.646,4.646l-0.707-0.707L8,4.793  l5.354,5.354L12.646,10.854z"/></svg>
		</div>
		<div>
			<?xml version="1.0" ?><svg id="down-btn" class="list-sub-button" style="enable-background:new 0 0 16 16;" version="1.1" viewBox="0 0 16 16" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><title>아래로</title><path d="M8,0C3.582,0,0,3.582,0,8s3.582,8,8,8s8-3.582,8-8S12.418,0,8,0z M8,11.207L2.646,5.854l0.707-0.707L8,9.793l4.646-4.646  l0.707,0.707L8,11.207z"/></svg>
		</div>
		<c:if test="${id != null }">
		<div>
		<?xml version="1.0" ?><svg id="svg-submit" class="list-sub-button" style="enable-background:new 0 0 52 52;" version="1.1" viewBox="0 0 52 52" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><style type="text/css">
	.st0{fill:#231F20;}
</style><title>글 작성하기</title><g><g><path class="st0" d="M45.6519165,16.6408634c1.7962914,1.6340733,2.620697,1.7813034,2.302681,4.1490822    c-0.2697029,2.0080528-1.5468826,2.7967052-2.9013443,4.1150837c-2.1364021,2.0794926-4.2728081,4.158987-6.409214,6.2384796    c-2.2793236,2.218605-4.5785675,5.0002556-7.6327477,6.0461464c-2.1678295,0.7423668-4.1716213,0.7169533-6.2361755,1.823452    c0.5508728,0.4234924,1.1017475,0.8469849,1.6526222,1.2704735c0.4703083-1.6190224,0.500782-3.3308067,0.9414883-4.9193649    c1.0718803-3.8636627,3.5154285-6.0207939,6.1860714-8.7645531c1.6959724-1.7424049,9.8001404-12.18398,12.7151909-9.7041321    c1.0969543,0.9331818,2.6959724-0.6509781,1.590992-1.5909901c-4.6940727-3.993269-9.171711,2.7945404-12.1579857,5.8625736    c-2.9629478,3.0440674-6.7015381,6.0248928-9.1568871,9.491478c-1.8846092,2.6607819-1.4034271,5.9800224-2.2884979,9.0268517    c-0.2828255,0.9736214,0.8090935,1.7225647,1.6526222,1.2704735c3.0849247-1.6533699,6.525219-1.2370949,9.3736572-3.4502716    c3.6246567-2.816288,6.7882652-6.5598202,10.0780106-9.7619305c1.8073578-1.7592106,5.243309-3.9881153,5.7419586-6.6802044    c0.4980431-2.6888332-2.1205788-4.4299774-3.861454-6.0136385C46.1737862,14.0773029,44.5780258,15.6639528,45.6519165,16.6408634    L45.6519165,16.6408634z"/></g><g><path class="st0" d="M39.5258217,20.2935238c1.2073097,0.3493347,2.2280426,1.8412228,3.080265,2.7090626    c0.8879929,0.9042664,1.6555023,1.6119404,2.3679657,2.6683598c0.8053322,1.1941299,2.7554321,0.0693226,1.9428062-1.1356182    c-0.4325752-0.6414127-0.7863922-1.4117184-1.3755951-1.9159565c-0.628994-0.5382881-1.2241936-1.0855827-1.8106155-1.6827526    c-1.0775032-1.0972443-2.0770988-2.3701382-3.6066895-2.8127213    C38.7303848,17.7206688,38.1353302,19.8911896,39.5258217,20.2935238L39.5258217,20.2935238z"/></g><g><path class="st0" d="M25.1720867,38.8353577c-5.4722595,0.051651-10.944519,0.1032982-16.4167786,0.1549492    c-1.4470506,0.0136604-1.4506278,2.2636948,0,2.25c5.4722586-0.051651,10.9445181-0.1032982,16.4167786-0.1549492    C26.6191368,41.0716972,26.6227131,38.8216629,25.1720867,38.8353577L25.1720867,38.8353577z"/></g><g><path class="st0" d="M8.3389263,33.6037216c5.5555553,0,11.1111107,0,16.666666,0c1.4477673,0,1.4501667-2.25,0-2.25    c-5.5555553,0-11.1111107,0-16.666666,0C6.8911581,31.3537216,6.8887606,33.6037216,8.3389263,33.6037216L8.3389263,33.6037216z"/></g><g><path class="st0" d="M8.7555923,26.1870556c5.4722223,0,10.9444447,0,16.416666,0c1.4477692,0,1.4501667-2.25,0-2.25    c-5.4722214,0-10.9444437,0-16.416666,0C7.3078251,23.9370556,7.3054271,26.1870556,8.7555923,26.1870556L8.7555923,26.1870556z"/></g><g><path class="st0" d="M8.7555923,18.7703876c2.6111116,0,5.2222223,0,7.833334,0c1.4477673,0,1.4501648-2.25,0-2.25    c-2.6111116,0-5.2222223,0-7.833334,0C7.3078251,16.5203876,7.3054271,18.7703876,8.7555923,18.7703876L8.7555923,18.7703876z"/></g><g><path class="st0" d="M36.5968933,33.8063393c0.0450783,2.8336411,0.0901566,5.6672821,0.1352348,8.5009232    c0.0200348,1.2593956,0.0400734,2.5187912,0.0601082,3.7781868c0.030201,1.8984566,0.4561768,2.260952-1.0701332,3.1058998    c-1.9762955,1.0940552-6.5117416,0.2888794-8.8145618,0.2895546c-2.8872662,0.0008507-5.7745323-0.004879-8.6617737-0.0167122    c-2.8872414-0.011837-5.7744579-0.0297813-8.6616201-0.0543022c-1.1992273-0.0101852-2.6778693,0.204998-3.849515-0.0364532    c-1.8717687-0.3857269-2.0688982,0.2606392-2.3003945-2.0529099c-0.5717773-5.7142754,0.0116146-11.8066216,0.0172729-17.5585022    c0.0054376-5.5276775,0.0108755-11.0553551,0.0163131-16.5830307c0.0022128-2.2493534-0.849448-6.7680664,0.0086365-8.7792521    c1.0924525-2.5604992,4.8730993-1.7547991,7.1211729-1.7792678c2.7810125-0.0302696,5.5622253-0.0411053,8.3433876-0.0347731    c3.8890781,0.0088544,5.8862991,0.3938086,9.0523052,3.1354816c1.7986832,1.5576081,3.5107384,3.2767515,5.1404362,5.008997    c3.0374603,3.2285881,3.4274635,5.0931368,3.4647675,9.3344088c0.0127296,1.4471073,2.2627602,1.4506054,2.25,0    c-0.0277863-3.1589241,0.319149-5.4934931-1.5546265-8.0270805c-2.1652374-2.92768-5.0546837-5.448359-7.7095871-7.9073153    c-1.4204292-1.3155944-2.8286591-2.9598856-4.6759834-3.6011236c-3.3212509-1.1528623-8.9729271-0.2038049-12.4566641-0.1758811    C9.0219517,0.380677,2.5878301-1.3532057,1.2283796,2.4487953C0.5988765,4.2093387,1.2235287,7.3799973,1.2216625,9.2771025    c-0.0022391,2.2761021-0.0044782,4.5522051-0.0067172,6.8283072c-0.0041583,4.227047-0.0083165,8.4540939-0.0124748,12.6811409    s-0.0083166,8.4540958-0.0124749,12.6811428c-0.0017838,1.8133926-0.9460919,7.4519081,0.2473887,9.0286484    c0.681613,0.9004974,1.3937652,0.8781013,2.3725193,1.1060486c3.9895153,0.9291534,9.3321095,0.0888557,13.4734497,0.1078529    c4.4912529,0.020607,8.9825821,0.0258598,13.4738712,0.01577c1.8592644-0.0041771,5.7777214,0.9039993,7.3197098-0.3840179    c1.3354874-1.1155243,0.9825401-2.72752,0.9803276-4.3119965c-0.0061607-4.4069443-0.1402702-8.8173561-0.2103691-13.2236595    C38.8238831,32.3599281,36.5738144,32.355545,36.5968933,33.8063393L36.5968933,33.8063393z"/></g><g><path class="st0" d="M23.6096382,2.9787898c0.0168743,2.5877452,0.0337505,5.1754909,0.0506248,7.7632356    c0.0089474,1.37187-0.5748672,4.1699448,0.5680618,5.2289858c1.0502396,0.9731569,3.3529282,0.4631433,4.6175613,0.4638052    c2.6366158,0.0013809,5.2732315,0.0027618,7.9098473,0.0041428c1.4477997,0.0007591,1.4501343-2.249239,0-2.249999    c-1.8611412-0.0009747-3.7222824-0.0019503-5.5834217-0.0029249c-0.9305706-0.0004873-1.8611412-0.0009756-2.7917118-0.0014629    c-0.257473-0.0001345-2.6326237,0.1697912-2.7917118-0.001462c0.1510754,0.1626282,0.3283615-2.3697367,0.3277035-2.4706802    c-0.0063286-0.9704046-0.0126572-1.9408092-0.0189857-2.9112129c-0.0126553-1.9408092-0.0253124-3.8816185-0.0379677-5.8224273    C25.8501987,1.5314904,23.6001778,1.5282775,23.6096382,2.9787898L23.6096382,2.9787898z"/></g></g></svg>
		상품등록
		</div>
		</c:if>
		<!-- <form id="prodRegForm" action="/product/prodReg" method="get">
		</form> -->
	</div>

	</section>

	<div class="posts_end"></div>
	<div id="toast" class="toast"></div>
	

		</div>
		</div>
		

							<!-- Sidebar -->
					<div id="sidebar" class="inactive force-inactive">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>카테고리</h2>
									</header>
									<ul>
										<li><a href="index.html">여성의류</a></li>
										<li><a href="generic.html">Generic</a></li>
										<li><a href="elements.html">Elements</a></li>
										<li>
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul>
								</nav>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="/resources/images/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/images/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/images/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
										<li class="fa-phone">(000) 000-0000</li>
										<li class="fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>
						</div>
					</div>
			
			</div>

		<!-- Scripts -->
		<script src="https://code.jquery.com/jquery-3.6.4.js" 
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	<script>
	function showToast(message, duration = 3000) {
		const toastElement = document.getElementById('toast');
		toastElement.innerText = message;
		toastElement.classList.add('show');

		setTimeout(() => {
			toastElement.classList.remove('show');
		}, duration);
	}
	
	$('#up-btn').on('click',function(){
		window.scrollTo(0,0);
	});
	
	$('#down-btn').on('click',function(){
		window.scrollTo(0, document.body.scrollHeight);
	});
	
	/* 스크롤 페이지 로딩 */
	let pageNum = 1;
	let totalPage = ${totalPage};
	let hasNext = pageNum < totalPage;
	
	function infiniteScroll () {
		const pagination = document.querySelector('.posts_end'); // 리스트 엔드 포인트
		const fullContent = document.querySelector('.posts'); // 리스트 컨테이너
		const screenHeight = screen.height; // 화면 크기
		
		document.addEventListener('scroll',OnScroll,{passive:true}); // 스크롤 이벤트 리스너
		function OnScroll () { //스크롤 이벤트 함수
			const fullHeight = fullContent.clientHeight; //  리스트 컨테이너 높이   
			const scrollPosition = pageYOffset; // 현재 스크롤 위치
			if (hasNext && fullHeight-screenHeight/2 <= scrollPosition) {
				hasNext = false;
				getList(); // 리스트 추가하는 함수
			}
		}
	}
	infiniteScroll();
	/* 스크롤 페이지 로딩 */
	let globalMinPrice = 0;
	let globalMaxPrice = 100000000;
	/* 페이지 추가로 불러오기 */
	function getList(){
		
		const minPriceValue = parseInt($("#minPrice").val(), 10);
	    const maxPriceValue = parseInt($("input[name=maxPrice]").val(), 10);
	    
		$.ajax({
			url:"/product/prodList",
			type:"GET",
			data:{
				sort:$("select[name=sort]").val(),
				grade:$("select[name=grade]").val(),
				category:$("select[name=category]").val(),
				title:$("input[name=title]").val(),
				minPrice:$("input[name=minPrice]").val(),
				maxPrice:$("input[name=maxPrice]").val(),
				pageNum:++pageNum
			},
			success:function(data){
				const tempDiv = document.createElement('div');
		        tempDiv.innerHTML = data;
		        const newData = tempDiv.querySelector('.posts');
		        if (newData) {
		        	if(pageNum === 1){
		        		$(".posts").html(newData.innerHTML);
		        	}else{
		          		$(".posts").append(newData.innerHTML);
		        	}
		        }
			},
			error:function(data){
				console.log(data);
				console.log("page load error");
			}
		});
		hasNext = pageNum < totalPage;
	}
	/* 페이지 추가로 불러오기 */
	
	$('#div-filter-submit').on('click', function(){
		$('#filter-form').submit();
	})
	
	$('#register').on('click', function() {
		$('#prodRegForm').submit();
	});

	
	$(document).ready(function() {


	    const urlParams = new URLSearchParams(window.location.search);
	    const sortValue = urlParams.get('sort');
	    const gradeValue = urlParams.get('grade');
	    const categoryValue = urlParams.get('category');

	    if (sortValue) {
	    	$('#sort-select').val(sortValue);
	    }
	    if (gradeValue) {
	    	$('#grade-select').val(gradeValue);
	    }
	    if (categoryValue) {
	    	$('#category-select').val(categoryValue);
	    }
	    
	    function heartChange($svg1, $svg2, pnum, seller) {
	        $svg1.on('click', function(event) {
	            $.ajax({
	                type: 'GET',
	                url: '/product/likeProdCancel',
	                data: {product_num: pnum, seller: seller},
	                success: function() {
	                    //console.log('success Del');
	                    $svg1.hide();
	                    $svg2.show();
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    console.log('Failed to cancel like');
	                    console.log(jqXHR.responseText);
	                    console.log(textStatus);
	                    console.log(errorThrown);
	                }
	            });
	        });

	        $svg2.on('click', function(event) {
	            $.ajax({
	                type: 'GET',
	                url: '/product/likeProd',
	                data: {product_num: pnum, seller: seller},
	                success: function() {
	                	//console.log('success Reg');
	                	showToast(pnum + '번 상품을 찜했습니다', 3000);
	                	$svg2.hide();
	                    $svg1.show();
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    console.log("Save Failed");
	                    console.log(jqXHR.responseText);
	                    console.log(textStatus);
	                    console.log(errorThrown);
	                }
	            });
	        });
	    }
	    
	    $(".div-likeit").each(function() {
	    	
	    	var $div = $(this);
	        var pnum = $div.data('product-num');
	        var seller = "${id}";
	        var $svg1 = $div.find('.svg-1');
	        var $svg2 = $div.find('.svg-2');

	        $.ajax({
	        	type: 'GET',
	        	url: '/product/memlikeCheck',
	        	data: {product_num: pnum, seller: seller},
	        	success: function(response){
	        		if(response){
	        			$svg2.hide();
	        			$svg1.show();
	        		}else{
	        			$svg1.hide();
	        			$svg2.show();
	        		}
	        		heartChange($svg1, $svg2, pnum, seller)
        		},
        		error: function(response){
        			console.log(pnum + '번 상품 찜 확인 실패');
	        	}
	        });
	    });
	});

	
	document.getElementById('svg-submit').addEventListener('click', function() {
	    //document.getElementById('prodRegForm').submit();
	    location.href="/product/prodReg";
	  });
	
	document.getElementById('min-price').addEventListener('input', function() {
		  var minValue = parseInt(this.getAttribute('min'));
		  var maxValue = parseInt(this.getAttribute('max'));
		  var maxPrice = document.getElementById('max-price');

		  if (this.value < minValue) {
		    this.value = minValue;
		  } else if (this.value > maxValue) {
		    this.value = maxValue;
		  }

		});

		document.getElementById('max-price').addEventListener('input', function() {
		  var minValue = parseInt(this.getAttribute('min'));
		  var maxValue = parseInt(this.getAttribute('max'));
		  var minPrice = document.getElementById('min-price');

		  if (this.value < minValue) {
		    this.value = minValue;
		  } else if (this.value > maxValue) {
		    this.value = maxValue;
		  }

		  if (this.value < minPrice.value) {
		    minPrice.value = this.value;
		  }
		});

	


		function resetForm() {
		    $('#sort-select').val('');
		    $('#grade-select').val('');
		    $('#category-select').val('');
		    $('#min-price').val('');
		    $('#max-price').val('');
		    $('input[name="title"]').val('');
		}
	
	</script>
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>