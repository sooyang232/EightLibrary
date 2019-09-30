<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								<li><a href="faq.do">자주하는 질문(FAQ)</a></li>
								<li><a href="qna.do">질문 및 답변(Q&A)</a></li>
								<li><a href="board.do">자유게시판</a></li>
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
                            <li><a href="#">Home</a></li>
                            <li><a href="#">커뮤니티</a></li>
                            <li><a href="#">게시판 문의</a></li>
                        </ul>
                    </div>
                    <h2 class="page-title">게시판 문의</h2>
                    <p class="sub-title">게시판 문의는 로그인해야만 작성할 수 있으며, 비밀글 사용이 가능합니다.<br>게시판 문의 이외에 FAQ, 전화 및 이메일 문의, 주제담당사서 문의를 통해 궁금증을 해결할 수 있습니다.</p>
                </div>
                
                <div class="board regist-area">
                    <form name="registForm" id="registForm" method="post"
                    			action="writeProQna.do" onsubmit="return writeSave()">
                    			
                    	<!-- 입력하지 않고 매개변수로 전달해서 테이블에 저장 (hidden) -->  
   						<input type="hidden" name="b2_num" value="${b2_num}">
						<input type="hidden" name="b2_reply" value="${b2_reply}">
						<input type="hidden" name="b2_step" value="${b2_step}">
						
                        <table class="table th-bg">
                            <colgroup>
                                <col width="15%">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><label for="b2_title">제목</label></th>
                                    <td><input type="text" class="form" name="b2_title" id="b2_title"></td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="userID">작성자</label></th>
                                    <td>
                                    	<%-- <input type="hidden" name="userID" value="${userID}"> --%>
                                    	<input type="text" class="form" name="userID" id="userID">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="secretY">공개여부</label></th>
                                    <td class="bd01td">
                                        <input type="radio" name="secretYn" id="secretN" value="N"> 공개
                                        <input type="radio" name="secretYn" id="secretY" value="Y" checked="checked"> 비공개
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="b2_content">내용</label></th>
                                    <td><textarea name="b2_content" id="b2_content" rows="15" class="form" title="상세 내용 입력"></textarea></td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- form 작성 내용 전달위해 form 태그 안에서 전송버튼 필요 -->
                        <input type="submit" value="등록">
                    </form>
                </div>
                <div class="btn-area tar">
                	<!-- <input type="submit" value="등록" class="btn deep-blue"> -->
                    <!-- <a href="#" role="button" class="btn deep-blue">등록</a> -->
                    <!-- <input type="submit" value="등록"> -->
                    <a href="qna.do" role="button" class="btn blue-gray">취소</a>
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