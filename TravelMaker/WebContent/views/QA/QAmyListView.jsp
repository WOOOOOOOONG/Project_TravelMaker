<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, QA.model.vo.*, member.model.vo.*, board.model.vo.*"%>

<% 
	ArrayList<QA> list = (ArrayList<QA>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>

<!-- 영역 분할 -->
<style>
/* 몸체 */
#body {
	margin-top: 180px;
	width: 1500px;
	height: 700px;
	display: flex;
	flex-direction: row;
	margin-left: auto;
	margin-right: auto;
}

aside {
	margin-left: 10%;
	width: 15%;
	height: 100%;
	margin-right: 2%;
}

#my-info-section1 {
	width: 80%;
	height: 220px;
	font-family: 'Do Hyeon', sans-serif;
}

/* aside -> my-info-section2 */
#my-info-section2 {
	width: 80%;
	height: 460px;
	font-family: 'Do Hyeon', sans-serif;
}

#marginBody {
	width: 65%;
}
</style>

<!-- aside->section1 css -->
<style>
#my-info {
	width: 100%;
	height: 100%;
	background-color: cornflowerblue;
}

#my-info-text {
	text-align: center;
	color: white;
	margin-bottom: 40px;
}

#my-info-section1 img {
	margin-left: 35px;
	width: 80px;
	height: 80px;
	float: left;
}

#name {
	font-size: 24px;
	font-weight: bold;
}

.myinfo-button {
	border: 1px solid white;
	width: 50%;
	background-color: cornflowerblue;
	color: white;
	font-size: 13px;
	height: 40px;
}

#my-info-logout {
	float: left;
}

@media only screen and (max-width: 2000px) {
	#my-info-section1 {
		width: 220px;
	}
	#my-info-section2 {
		width: 220px;
	}
}
</style>

<!-- aside->section2 css -->
<style>
#my-info-section2 {
	margin-top: 50px;
}

aside {
	float: left;
}

#mypage-menu {
	border: 1px solid black;
	margin-top: 30px;
	width: 100%;
	height: 80%;
}

#mypage-menu ul {
	text-decoration: none;
	list-style-type: none;
	font-size: 18px;
}

#mypage-menu ul {
	margin: 0;
}

#mypage-menu ul li {
	margin-bottom: 15px;
}

.bigContent {
	font-size: 23px;
	font-weight: bold;
	margin-top: 13px;
	color: cornflowerblue;
}
</style>

<!-- .notice -->
<style>
.notice table {
	border-collapse: collapse;
	border-spacing: 0;
}

.page {
	cursor:pointer;
}

.page-title {
	margin-bottom: 60px;
}

.page-title h3 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

#board-search .search-window {
	padding: 15px 0;
	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	margin-right: 20px;
	width: 70%;
	max-width: 564px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 100%;
	font-size: 14px;
	padding: 7px 14px;
	border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
	border-color: #333;
	outline: 0;
	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
	position: absolute;
	right: 0;
	top: 0;
	bottom: 0;
	width: 108px;
	padding: 0;
	font-size: 16px;
}

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

.btn {
	display: inline-block;
	padding: 0 30px;
	font-size: 15px;
	font-weight: 400;
	background: transparent;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	text-transform: uppercase;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-ms-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn-dark {
	background: #555;
	color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

.container {
	width: 1100px;
	margin: 0 auto;
}

.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}

.container {
	width: 80%;
}

#write {
	margin-left: 85%;
	margin-top: 3%;
}

#inquire-type {
	height: 35px;
	margin-top: 2.5%;
	margin-left: 2%;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp"%>
	<section id="body">
		<aside id="aside1">
			<section id="my-info-section1">
				<div class="my-info" id="my-info">
					<h3 id="my-info-text">마이페이지</h3>
					<img onclick="profileUpdate();" id="profile"
						src="<%= request.getContextPath() %>/resources/myplan_upload/<%= loginUser.getProfile() %>"><br>
					<p id="name" style="margin-top:-6px;">
						&nbsp;&nbsp;&nbsp;<%= loginUser.getmName() %></p>
					<br> <br>
					<button class="myinfo-button" id="my-info-logout"
						onclick="logout();">로그아웃</button>
					<button class="myinfo-button" id="my-info-modify"
						onclick="infoModify();">회원정보 수정</button>
				</div>
				<script>
					// 로그아웃 이동 
                	function logout() {
                		location.href="<%= request.getContextPath() %>/logout.me";
                	}
                	
					// 정보수정 이동 
                	function infoModify() {
                		location.href="<%= request.getContextPath() %>/views/myPage/Info-update.jsp"
                	}
            		
            		// 프로필 
            		function profileUpdate() {
            			var left = (screen.width/2)-135;
            	    	var top = (screen.height/2)-115;
            	   		var url = "<%= request.getContextPath() %>/views/myPage/ProfileUpdate.jsp";
            	    	var uploadWin = window.open(url,"Upload","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=270px, height=230px" + ",top=" + top + ",left=" + left);
            	    	uploadWin.moveTo(left, top);
            	    	uploadWin.focus();
            		}
                </script>
			</section>

			<section id="my-info-section2">
				<div id="mypage-menu">
					<ul>
						<li class="bigContent no">나의 활동</li>
						<li class="no"><a class="page"
							onclick="location.href='<%= contextPath %>/festivalMember.fe?=' + 2">
								나의계획</a></li>
						<li><a class="page"
							onclick="location.href='<%= contextPath %>/festivalall.fe?flag=4&no=1'">내가
								쓴 게시글</a></li>
						<hr>
						<li class="bigContent no">개인정보 관리</li>
						<li><a class="page"
							onclick="location.href='<%= request.getContextPath() %>/views/myPage/Info-update.jsp';">회원정보
								수정</a></li>
						<hr>
						<li class="bigContent no">고객센터</li>
						<li style="font-weight: bold"><a class="page"
							onclick="location.href='<%= request.getContextPath() %>/select.qa?mSeq=' + <%= loginUser.getM_seq()%>">문의
								내역</a></li>
					</ul>
				</div>
			</section>
		</aside>

		<section id="marginBody">

			<section class="notice">
				<div class="page-title">
					<div class="container">
						<h3>문의내역</h3>
					</div>
				</div>

				<!-- board search area -->
				

				<!-- board list area -->
				<div id="board-list">
					<div class="container">
						<table class="board-table">
							<thead>
								<tr>
									<th scope="col" class="th-num">번호</th>
									<th scope="col" class="th-title">제목</th>
									<th scope="col" class="th-date">등록일</th>
								</tr>
							</thead>
							<tbody>
								<% if(list.isEmpty()){ %>
								<tr>
									<td colspan="3">문의내역이 존재하지 않습니다</td>
								</tr>
								<%} else { %>
								<% for(QA q : list) {%>
								<tr>
									<td><%= q.getqId() %></td>
									<td><%= q.getqTitle() %></td>
									<td><%= q.getEnrollDate() %></td>
								</tr>
								<% } %>
								<% } %>
							</tbody>
						</table>
						<button type="button" class="btn btn-dark" id="write">글쓰기</button>
					</div>
				</div>
			</section>
			<div class="pagingArea" align="center" style="margin-left:-95px;">
				<!-- 맨 처음으로 (<<) -->
				<button
					onclick="location.href='<%= contextPath %>/select.qa?currentPage=1&mSeq=<%= loginUser.getM_seq()%>'">
					&lt;&lt;</button>

				<!-- 이전 페이지로 (<) -->
				<% if(currentPage == 1){ %>
				<button disabled>&lt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%= contextPath %>/select.qa?currentPage=<%= currentPage - 1 %>&mSeq=<%= loginUser.getM_seq()%>'">
					&lt;</button>
				<% } %>

				<!-- 10개의 페이지 목록 -->
				<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
				<button disabled>
					<%= p %></button>
				<% } else { %>
				<button
					onclick="location.href='<%= contextPath %>/select.qa?currentPage=<%= p %>&mSeq=<%= loginUser.getM_seq()%>'">
					<%= p %>
				</button>
				<% } %>
				<% } %>

				<!-- 다음 페이지로(>) -->
				<% if(currentPage == maxPage) { %>
				<button disabled>&gt;</button>
				<% } else { %>
				<button
					onclick="location.href='<%= contextPath %>/select.qa?currentPage=<%= currentPage + 1 %>&mSeq=<%= loginUser.getM_seq()%>'">
					&gt;</button>
				<% } %>

				<!--  맨 끝으로 (>>) -->
				<button
					onclick="location.href='<%= contextPath %>/select.qa?currentPage=<%= maxPage %>&mSeq=<%= loginUser.getM_seq()%>'">
					&gt;&gt;</button>

			</div>
		</section>
	</section>

	<script>
		// 게시판 상세 보기 기능 구현
		$(function(){
			$(".board-table td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer", "color":"white"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white", "color":"black"});
			}).click(function(){
				var qId = $(this).parent().children().eq(0).text();
					location.href="<%= request.getContextPath() %>/detail.qa?qId="+qId;					
			});
			 
			$(".btn-dark").click(function(){
				location.href="<%= request.getContextPath()%>/views/QA/QAInsertView.jsp"
			})
		});
	
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>