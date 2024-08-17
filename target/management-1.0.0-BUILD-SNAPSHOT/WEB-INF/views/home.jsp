<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
<head>
<title>미르대학교에 오신 걸 환영합니다.</title>
<script defer src="${path}/resources/js/scrollbtn.js"></script>
<link href="${path}/resources/css/scrollbtn.css" rel="stylesheet" />
</head>
<jsp:include page="/WEB-INF/views/common/homeheader.jsp" />
<body>
	<c:if test="${not empty msg }">

		<script>
			alert('${msg}');
		</script>
		<c:remove var=" msg" />
	</c:if>
	<p class="top_scrollbtn" onclick="scrollbtn('main-img')">TOP</p>
	<div class="slogan-box">
		<div>
			<img id="main-img" src="${path}/resources/img/main_img.jpg"
				width="100%" height="750px" />
		</div>
		<div class="slogan">
			<h1>
				<strong>Designing Tomorrow,</strong>
			</h1>
			<h1>
				<strong>Engineering Today</strong>
			</h1>
		</div>
	</div>
	<div id="section1">
		<main class="container news">
			<h1 align="center">
				<strong>MR Today</strong>
			</h1>
			<div class="row"></div>
			<div class="row">
				<div class="col col-8">
					<div class="row main-news">
						<div class="col col-12">
							<img class="top" src="${path}/resources/img/newimg1.jpg"
								alt="newsimg1" width="100%" />
							<div class="article main-article">
								<p class="title">제 6회 노벨 경제학상 수상자 토만스 존 사전트 박사 특강</p>
								<p class="content">코페르니쿠스에서 ChtGPT까지, 인공지능의 근원은?</p>
								<div class="readmore">
									<a href="https://m.dhnews.co.kr/news/view/1065579716005996"
										target="_blank">read more</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row sub-menu">
						<div class="col col-6 sub1">
							<div class="article sub-article1 top">
								<p class="title">"졸업 전에 재학생 신분으로 의미 있는 일을 해보고 싶었다."</p>
								<div id="readmore">
									<a
										href="https://m.khan.co.kr/national/national-general/article/202403061411011#c2b"
										target="_blank">read more</a>
								</div>
							</div>
						</div>
						<div class="col col-6 sub2">
							<div class="article sub-article2 top">
								<h3>
									<a
										href="https://www.dhnews.co.kr/news/articleList.html?sc_section_code=S1N2"
										target="_blank">미르 소식 더보기&nbsp;<img
										src="${path}/resources/img/more.png" /></a>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col col-4">
					<div class="row sub-news">
						<div class="col col-12">
							<img class="top" src="${path}/resources/img/subnews1.jpg"
								alt="newsimg1" width="100%" />
							<div class="article main-article">
								<p class="title">그레이스 카오(Grace Kao)예일대 교수 특별강연 성료</p>
								<p class="content">'선미-팝'이라고 하는 현상이 어떻게 비전형적인 아이돌의 커리어 모델을
									만들 수 있었는가</p>
								<div class="readmore2">
									<a
										href="https://www.usline.kr/news/articleView.html?idxno=21805"
										style="font-weight: bold;" target="_blank">read more</a>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col col-12">
							<img class="top" src="${path}/resources/img/subnews2.jpg"
								alt="newsimg1" width="100%" />
							<div class="article main-article">
								<p class="title">2024 Yale-Korea University Forum 개최</p>
								<p class="content">"기후변화로 인한 재난에 대응하고 지속가능한 미래를 위한 에너지-물
									기후기술 혁신"를 주제로 열려</p>
								<div class="readmore2">
									<a
										href="https://www.newstnt.com/news/articleView.html?idxno=383298"
										style="font-weight: bold;" target="_blank">read more</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<section id="section3">
		<img src="${path}/resources/img/main_banner.png" width="100%"
			height="250px">
		<div id="banner-content">
			<h3>2024년 8월 열람실 리모델링</h3>
			<h3>미르도서관 임시공사 안내</h3>
			<p>2024.08.19(월) ~ 2024.09.20(금)</p>
		</div>
	</section>
	<div class="section2">
		<section id="section2" class="container">
			<h1 align="center">미르인에게 알립니다</h1>
			<div class="row new2">
				<div class="col col-3" style="margin-right: 50px;">
					<a href="https://www.donga.com/news/Society/article/all/20231121/122273034/1" style="text-decoration: none;" target="_blank">
						<div class="article main-article">
							<p class="title" style="color: #333">2024년도 1분기 학술교류 유학생 모집</p>
							<p class="content">"한국 교육의 선두에 있는 미르대 학업뿐만 아니라, 다양한 사람들과 교류할
								기회!"</p>
						</div>
						<div class="bottom">
							<img src="${path}/resources/img/section3_img1.jpg" alt="newsimg1"
								width="100%" height="200px" />
						</div>
					</a>
				</div>
				<div class="col col-3"  style="margin-right: 50px;">
					<a href="https://www.newspim.com/news/view/20210916000640" style="text-decoration: none;" target="_blank">
						<div class="article main-article">
							<p class="title" style="color: #333">2024 9월부터 미르 구내식당 비건 식단
								출시</p>
							<p class="content">"채식 위주의 식단이 항산화 성분과 항염증 특성으로 인해 노화 방지 효과를
								줄 수 있어."</p>
						</div>
						<div class="bottom">
							<img src="${path}/resources/img/section3_img2.jpg" alt="newsimg1"
								width="100%" height="200px" />
						</div>
					</a>
				</div>
				<div class="col col-3">
					<a href="https://jumpball.co.kr/news/newsview.php?ncode=1065617995348432&dt=m" style="text-decoration: none;" target="_blank">
						<div class="article main-article">
							<p class="title" style="color: #333">미르대 농구팀 전국대회에서 3연속 4강 진출 쾌거</p>
							<p class="content">"올해 3월부터 열린 전국 대학부 농구 대회에서 맹활약!"</p>
						</div>
						<div class="bottom">
							<img src="${path}/resources/img/section3_img3.jpg" alt="newsimg1"
								width="100%" height="200px" />
						</div>
					</a>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="common/footer.jsp" />
<body>
</html>
