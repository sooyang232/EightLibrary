<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>에잇도서관 통합관리시스템</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/function.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
	<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/sub.css">
</head>
<body>
	<c:set var="flag" value="${requestScope.flag}" />
	<a class="skip-link" href="#content">Skip to content</a>
	<div id="header">
		<div class="top-area">
			<div class="inner-max">
				<h1 class="top-logo">
					<a href="index.html">
						<span class="site-logo">Eight Library</span>
					</a>
				</h1>
				<div class="top-gnb">
					<ul class="gnb-list">
						<li class="login"><a href="login.html">로그인</a></li>
						<li><a href="join1.html">회원가입</a></li>
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
							<a href="search.html">자료검색</a>
							<ul class="sub-menu">
								<li><a href="search.html">통합검색</a></li>
                                <li><a href="newarrivalbook.html">신착도서</a></li>
							</ul>
						</li>
						<li>
							<a href="reserveroom.html">열람실예약</a>
							<ul class="sub-menu">
								<li><a href="reserveroom.html">예약신청</a></li>
								<li><a href="reserveroomstatus.html">예약확인/취소</a></li>
							</ul>
						</li>
						<li>
							<a href="board.html">커뮤니티</a>
							<ul class="sub-menu">
								<li><a href="board.html">공지&새소식</a></li>
								<li><a href="board.html">자주하는 질문(FAQ)</a></li>
								<li><a href="board.html">질문 및 답변(Q&A)</a></li>
								<li><a href="board.html">자유게시판</a></li>
								<li><a href="award.html">다독상현황</a></li>
							</ul>
						</li>
                        <li>
                            <a href="contFacility.html">도서관소개</a>
                            <ul class="sub-menu">
                                <li><a href="contFacility.html">시설현황</a></li>
                                <li><a href="contData.html">자료현황</a></li>
                                <li><a href="contInfomation.html">이용안내</a></li>
                                <li><a href="contDirections.html">찾아오시는길</a></li>
                            </ul>
                        </li>
						<li>
							<a href="mypage1.html">마이페이지</a>
							<ul class="sub-menu">
								<li>
									<a href="usermodify.html">회원정보</a>
									<ul>
										<li><a href="usermodify.html">회원정보수정</a></li>
										<li><a href="passwordchange.html">비밀번호변경</a></li>
										<li><a href="withdraw.html">회원탈퇴</a></li>
										<li><a href="contPrivacy.html">개인정보처리방침</a></li>
										<li><a href="contEmail.html">이메일무단수집거부</a></li>
									</ul>
								</li>								
								<li>
									<a href="mypage1.html">대출/예약/이력</a>
									<ul>
										<li><a href="mypage1.html">대출현황</a></li>
										<li><a href="mypage2.html">예약현황</a></li>
										<li><a href="mypage3.html">대출이력</a></li>
									</ul>
								</li>
								<li><a href="basketlist.html">관심도서</a></li>
								<li>
									<a href="myboard1.html">나의 게시글</a>
									<ul>
										<li><a href="myboard1.html">질문 및 답변(Q&A)</a></li>
										<li><a href="myboard1.html">자유게시판</a></li>
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
                            <li><a href="index.html">Home</a></li>
                            <li><a href="#">회원가입</a></li>
                        </ul>
                    </div>
                    <h2 class="page-title">회원가입</h2>
                </div>
                
                <div class="join-wrap">
                    <ul class="join-step">
                        <li class="n1 white">
                            <div>
                                <span>약관동의</span>
                            </div>
                        </li>
                        <li class="n2 white">
                            <div>
                                <span>정보입력</span>
                            </div>
                        </li>
                        <li class="n3 white">
                            <div>
                                <span>회원가입완료</span>
                            </div>
                        </li>
                    </ul>
                    <c:choose>
                    	<c:when test="${flag==true}">
		                    <div class="join-box tac">
		                        <p class="join-t1">회원가입이 완료되었습니다.</p>
		                        <p class="join-t2">※ 관리자 승인 후 로그인이 가능합니다.</p>
		                        <div class="btn-area tac">
		                            <a href="index.html" class="btn lg deep-blue">메인으로 이동</a>
		                        </div>
		                    </div>
	                    </c:when>
	                    <c:otherwise>
	                    	<p>회원가입 실패</p>
	                    	<p>다시 확인하고 입력해주세요.</p>
	                    	<br>
	                    	<a href=join2.do>다시 가입</a>
	                    </c:otherwise>
                    </c:choose>
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