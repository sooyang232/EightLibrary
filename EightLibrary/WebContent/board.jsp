<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>에잇도서관 통합관리시스템</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/sub.css">
</head>
<body>
	<a class="skip-link" href="#content">Skip to content</a>
	<div id="header">
		<div class="top-area">
			<div class="inner-max">
				<h1 class="top-logo">
					<a href="#"> <span class="site-logo">Eight Library</span>
					</a>
				</h1>
				<div class="top-gnb">
					<ul class="gnb-list">
						<li class="login"><a href="/member/login.html">로그인</a></li>
						<li><a href="/member/join.html">회원가입</a></li>
					</ul>
				</div>
				<button type="button" class="btn-all-menu" id="show-menu">
					<span class="line"> <span></span> <span></span> <span></span>
					</span>
				</button>
			</div>
		</div>
		<div class="nav-area">
			<div class="inner-max">
				<div id="main-nav">
					<h2 class="hide">주메뉴</h2>
					<ul class="main-nav-list">
						<li><a href="#">자료검색</a>
							<ul class="sub-menu">
								<li><a href="#">통합검색</a></li>
								<li><a href="#">소장자료</a></li>
								<li><a href="#">신착자료</a></li>
							</ul></li>
						<li><a href="#">열람실예약</a>
							<ul class="sub-menu">
								<li><a href="#">예약신청</a></li>
								<li><a href="#">예약확인/취소</a></li>
							</ul></li>
						<li><a href="#">커뮤니티</a>
							<ul class="sub-menu">
								<li><a href="#">공지&새소식</a></li>
								<li><a href="#">자주하는 질문(FAQ)</a></li>
								<li><a href="#">질문 및 답변(Q&A)</a></li>
								<li><a href="#">자유게시판</a></li>
								<li><a href="#">서식 자료실</a></li>
								<li><a href="#">도서관안내</a></li>
							</ul></li>
						<li><a href="#">내서재</a>
							<ul class="sub-menu">
								<li><a href="#">대출/예약/이력</a>
									<ul>
										<li><a href="#">대출현황</a></li>
										<li><a href="#">예약현황</a></li>
										<li><a href="#">대출이력</a></li>
									</ul></li>
								<li><a href="#">희망도서신청</a>
									<ul>
										<li><a href="#">신청하기</a></li>
										<li><a href="#">신청조회</a></li>
									</ul></li>
								<li><a href="#">나의 게시글</a>
									<ul>
										<li><a href="#">질문 및 답변(Q&A)</a></li>
										<li><a href="#">자유게시판</a></li>
									</ul></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="content" class="site-content">
		<div class="inner-max">
			<div class="content-area">
				<div class="page-header">
					<div class="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">자료검색</a></li>
						</ul>
					</div>
					<h2 class="page-title">자유 게시판</h2>
				</div>
				<div class="board-search-box tar">
					<form method="post" action="" id="searchForm">
						<div class="input-box">
							<select name="searchKey" title="검색 선택" id="searchKey"
								class="select">
								<option value="all" selected>전체</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select> <input type="text" name="searchKeyword" title="검색어 입력"
								id="searchKeyword" class="form"> <input type="submit"
								value="검색" title="검색" class="btn primary md">
						</div>
					</form>
				</div>
				<div class="board-area">
					<table class="table tac">
						<thead>
							<tr>
								<th class="board-list-uid">번호</th>
								<th class="board-list-title">제목</th>
								<th class="board-list-user">작성자</th>
								<th class="board-list-date">작성일</th>
								<th class="board-list-view">조회</th>
							</tr>
						</thead>
						<tbody>

							<c:set var="number" value="${pgList.number}" />
							<c:forEach var="article" items="${articleList }">
								<tr>
									<td class="board-list-uid"><c:out value="${number}" /> <c:set
											var="number" value="${number-1}" /></td>
									<td class="board-list-title"><a
										href="/EightLibrary/boardView.do?num=${article.b1_num}&pageNum=${pgList.currentPage}">
											<div class="board-default-cut-strings">
												<!--  도서관에 핸드폰 두고 갔습니다ㅠㅡㅠ여자 화장실에 있는것 같아요. -->
												${article.b1_title}

											</div>
											<div class="board-mobile-contents">
												<span class="contents-item">${article.userID}</span> <span
													class="contents-item">${article.b1_date}</span> <span
													class="contents-item">${article.b1_view}</span>
											</div>
									</a></td>
									<td class="board-list-user">${article.userID}</td>
									<td class="board-list-date"><fmt:formatDate
											value="${article.b1_date}" pattern="yyyy-MM-dd" /></td>
									<td class="board-list-view">${article.b1_view}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pagination tac">
						<a href="#" class="page-btn prev">이전</a> <a href="#"
							class="page-num current">1</a> <a href="#" class="page-num">2</a>
						<a href="#" class="page-num">3</a> <a href="#" class="page-num">4</a>
						<a href="#" class="page-num">5</a> <a href="#"
							class="page-btn next">다음</a>
					</div>
				</div>
				<div class="btn-area tar mt0">
					<a href="boardRegister.jsp" role="button" class="btn deep-blue">글쓰기</a>
				</div>
			</div>
		</div>
		<div id="footer" class="site-footer">
			<div class="inner-max">
				<div class="foot-section">
					<div class="link-section">
						<div class="panel family-site">
							<div class="panel-head">
								<h4 class="title">Family Sites</h4>
							</div>
							<div class="panel-body">
								<ul class="link-list">
									<li><a
										href="https://eproxy.pusan.ac.kr/link.n2s?sid=riss_db"
										target="_blank">RISS(한국교육학술정보원)</a></li>
									<li><a href="http://dlibrary.go.kr" target="_blank">국가전자도서관</a></li>
									<li><a href="http://www.ndsl.kr" target="_blank">NDSL(국가과학기술정보센터)</a></li>
									<li><a href="http://nl.go.kr" target="_blank">국립중앙도서관</a></li>
									<li><a href="http://www.nanet.go.kr" target="_blank">국회도서관</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="foot-info">
					<ul class="foot-util group">
						<li><a href="https://lib.pusan.ac.kr/etc/privacy-notice-new/"
							target="_blank">개인정보처리방침</a></li>
						<li><a href="#">이메일무단수집거부</a></li>
					</ul>
					<div class="sns-section">
						<ul class="foot-sns">
							<li class="facebook"><a href="#" target="_blank"><i
									class="icon-facebook"></i><span class="hide">페이스북</span></a></li>
							<li class="instagram"><a href="#" target="_blank"><i
									class="icon-instagram"></i><span class="hide">인스타그램</span></a></li>
							<li class="youtube"><a href="#" target="_blank"><i
									class="icon-youtube"></i><span class="hide">유튜브</span></a></li>
						</ul>
					</div>
					<p class="address">(06134) 서울특별시 강남구 테헤란로1길 10 세경빌딩 3층 Tel.
						02-538-3746</p>
					<p class="copyright">Copyright 2019 KIC Campus Eight Library.
						All Rights Reserved.</p>
				</div>
			</div>
		</div>
</body>
</html>