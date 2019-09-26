<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<a href="#">
						<span class="site-logo">Eight Library</span>
					</a>
				</h1>
				<div class="top-gnb">
					<ul class="gnb-list">
						<li class="login"><a href="/member/login.html">로그인</a></li>
						<li><a href="/member/join.html">회원가입</a></li>
					</ul>
				</div>
				<button type="button" class="btn-all-menu" id="show-menu">
					<span class="line">
						<span></span>
						<span></span>
						<span></span>
					</span>
				</button>
			</div>
		</div>
		<div class="nav-area">
			<div class="inner-max">
				<div id="main-nav">
					<h2 class="hide">주메뉴</h2>
					<ul class="main-nav-list">
						<li>
							<a href="#">자료검색</a>
							<ul class="sub-menu">
								<li><a href="#">통합검색</a></li>
								<li><a href="#">소장자료</a></li>
								<li><a href="#">신착자료</a></li>
							</ul>
						</li>
						<li>
							<a href="#">열람실예약</a>
							<ul class="sub-menu">
								<li><a href="#">예약신청</a></li>
								<li><a href="#">예약확인/취소</a></li>
							</ul>
						</li>
						<li>
							<a href="#">커뮤니티</a>
							<ul class="sub-menu">
								<li><a href="#">공지&새소식</a></li>
								<li><a href="#">자주하는 질문(FAQ)</a></li>
								<li><a href="#">질문 및 답변(Q&A)</a></li>
								<li><a href="#">자유게시판</a></li>
								<li><a href="#">서식 자료실</a></li>
								<li><a href="#">도서관안내</a></li>
							</ul>
						</li>
						<li>
							<a href="#">내서재</a>
							<ul class="sub-menu">
								<li>
									<a href="#">대출/예약/이력</a>
									<ul>
										<li><a href="#">대출현황</a></li>
										<li><a href="#">예약현황</a></li>
										<li><a href="#">대출이력</a></li>
									</ul>
								</li>
								<li>
									<a href="#">희망도서신청</a>
									<ul>
										<li><a href="#">신청하기</a></li>
										<li><a href="#">신청조회</a></li>
									</ul>
								</li>
								<li>
									<a href="#">나의 게시글</a>
									<ul>
										<li><a href="#">질문 및 답변(Q&A)</a></li>
										<li><a href="#">자유게시판</a></li>
									</ul>
								</li>							
							</ul>
						</li>
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
                            <li><a href="#">커뮤니티</a></li>
                            <li><a href="#">자주하는 질문(FAQ)</a></li>
                        </ul>
                    </div>
                    <h2 class="page-title">자주하는 질문(FAQ)</h2>
                    <p class="sub-title">FAQ 이외에 게시판 문의, 전화 및 이메일 문의, 주제담당사서 문의를 통해 궁금증을 해결할 수 있습니다.</p>
                </div>
                
                <div class="board view-area">
                    <div class="view-head">
                        <h2 class="article-title">
                            ${article.b4_title}<!-- <span class="item-icon new">새 글</span> -->
                        </h2>
                        <div class="article-meta">
                            <dl class="list colon inline">
                                <dt class="author">작성자</dt>
                                <dd class="author r-sep">${article.adminID}</dd>
                                <dt class="date">작성일</dt>
                                <dd class="board-list-date"><fmt:formatDate value="${article.b4_date}" pattern="yyyy-MM-dd" /></dd>
                                <dt class="view">조회</dt>
                                <dd class="view">${article.b4_view}</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="view-body">
                        ${article.b4_content}
                    </div>
                </div>
                <div class="btn-area tar">
                    <a href="faq.do" role="button" class="btn blue-gray">목록보기</a>
                </div>
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
                                <li><a href="https://eproxy.pusan.ac.kr/link.n2s?sid=riss_db" target="_blank">RISS(한국교육학술정보원)</a></li>
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
					<li><a href="https://lib.pusan.ac.kr/etc/privacy-notice-new/" target="_blank">개인정보처리방침</a></li>
					<li><a href="#">이메일무단수집거부</a></li>
				</ul>
				<div class="sns-section">
					<ul class="foot-sns">
						<li class="facebook"><a href="#" target="_blank"><i class="icon-facebook"></i><span class="hide">페이스북</span></a></li>
						<li class="instagram"><a href="#" target="_blank"><i class="icon-instagram"></i><span class="hide">인스타그램</span></a></li>
						<li class="youtube"><a href="#" target="_blank"><i class="icon-youtube"></i><span class="hide">유튜브</span></a></li>
					</ul>
				</div>
				<p class="address">(06134) 서울특별시 강남구 테헤란로1길 10 세경빌딩 3층 Tel. 02-538-3746</p>
				<p class="copyright">Copyright 2019 KIC Campus Eight Library. All Rights Reserved.</p>
			</div>
		</div>
	</div>
</body>
</html>