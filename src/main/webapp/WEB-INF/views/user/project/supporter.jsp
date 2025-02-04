<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/userHeader.jsp" />

<style type="text/css">
/* 전체 영역 */
.container {
	margin-top: 0;
}

hr {
	margin-top: 5px;
	margin-bottom: 5px;
}

#topMenu {
	height: 40px;
	width: 700px;
	margin: 0 auto;
}

#topMenu ul li {
	list-style: none;
	color: black;
	float: left;
	line-height: 40px;
	vertical-align: middle;
	text-align: center;
	display: flex;
}

#topMenu .menuLink {
	text-decoration: none;
	color: black;
	width: 150px;
	font-size: 15px;
}

/* 메뉴 옆 작은 숫자 */
#topMenu .count {
	position: relative;
	font-size: 14px;
	color: #4EE2EC;
	left: 2px;
}

#left {
	/* 영역 확인용 */
/*  	border: 1px solid red;  */
	float: left;
	width: 60%;
	margin-left: 10px;
	padding-left: 12px;
}

#left .ment {
	font-size: 28px;
	font-weight: 300;
	line-height: 1.29; /* 줄 간격 */
	padding: 0 0 23px;
}

/* 서포터 리스트 div */
#left .supporterContainer .supporterList {
	margin-top: 40px;
}

#left .supporterContainer .supporterList .oneperson {
	height: 72px;
}

#left .supporterContainer .supporterList .supportDetail .fundingDetail {
	font-size: 17px;
	line-height: 1.65;
	margin-bottom: 2px;
}

#left .supporterContainer .supporterList .supportDetail em {
	font-style: normal;
}

/* 더보기 div */
#left .listMoreBtn {
	display: block;
	position: relative;
	width: 100%;
	height: 48px;
}

#left .listMoreBtn .moreBtn {
	display: block;
	background: none;
	font-size: 17px;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

#right {
	/* 영역 확인용 */ 
/*  	border: 1px solid green;  */
	float: right;
	width: 35%;
	margin-right: 15px;
	padding-top: 15px;
/*  	padding-left: 5px; */
}

#right .project_state_info p {
	margin-bottom: 25px;
	font-size: 16px;
	line-height: 30px;
}

#right .project_state_info p strong {
	padding-right: 5px;
	font-size: 24px;
	font-weight: 500;
}

/* 프로젝트 남은 일수 */
#right .project_state_info p.remaining_day {
	font-size: 28px;
	line-height: 36px;
	font-weight: 500;
/* 	margin-bottom: 25px; */
}

/* 프로젝트 남은 일수 밑에 바 */
#right .project_state_info p.rate_bar {
	width: 100%;
	height: 7px;
	background: white;
	overflow: hidden;
}

#right .project_state_info p.rate_bar em {
	width: 100%;
	display: block;
	height: 5px;
	background: #4EEDED;
}

/* 펀딩하기, 환불하기 버튼 감싸는 div */
#right .funding, #right .refund {
	width: 100%;
	margin-bottom: 15px;
	padding-top: 10px;
}

/* 환불하기 */
#right .refund {
	margin-top: -15px;
}

/* 펀딩하기, 환불하기 버튼 */
#right .funding .btn_funding, #right .refund .btn_refund {
	background-color: #4EE2EC;
	color: white;
	border-color: #4EE2EC;
	width: 100%;
	text-align: center;
	border-radius: 5px;
	cursor: pointer;
	height: 48px;
	font-size: 20px;
	font-weight: 400;
	vertical-align: middle;
	box-sizing: border-box!important;
}

/* 프로필 */
.profileBox {
	width: 50px;
	height: 50px;
	border-radius: 70%;
	overflow: hidden;
 	margin-right: 18px; 
  	float: left; 
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

</style>

<div class="container">
<br><br><hr>

<div id="titleHeader">
<!-- 	<div class="titleBg" style="background-image: -->
<!-- 		url('/resources/img/test1.png')"> -->
<!-- 	</div> -->
	<p class="text-center">${info.iCategory }</p>
	<p class="lead text-center">${info.iTitle }</p>
</div><!-- #titleHeader end --> <hr>

<div class="reward-nav">
<nav id="topMenu">
	<ul>
		<li class="active"><a class="menuLink" href="#">스토리</a></li>
		<li><a class="menuLink" href="#">새소식<span class="count">2</span></a></li>
		<li><a class="menuLink" href="#">커뮤니티<span class="count">2</span></a></li>
		<li><a class="menuLink" href="/supporter">서포터<span class="count">${totalCnt }</span></a></li>
	</ul>
</nav><!-- #topMenu end -->
</div><!-- .reward-nav end --> <hr><br>


<div id="left">
	<span class="ment">현재 이 프로젝트에<br>
		<strong style="color: #4EE2EC;">${totalCnt }명</strong>의 참여가 이루어졌습니다.
	</span>
	
	<div class="supporterContainer">
		<div class="supporterList">
		<c:forEach items="${list }" var="supporter">
			<div class="oneperson">
				<div class="profileBox">
					<img class="profile" src="/resources/img/basic.png">
				</div>
				<div class="supportDetail">
					<p class="fundingDetail"><strong>${supporter.mId }</strong>님이 <strong>${supporter.reMoney + supporter.suAddMoney }원 펀딩</strong>으로 참여 하셨습니다.</p>
					<em>1분 전</em>
				</div><div style="clear: both;"></div>
			</div>
		</c:forEach>
		</div><!-- .supporterList end -->
		<div class="listMoreBtn">
			<button class="moreBtn">더보기</button>
		</div><!-- .listMoreBtn end -->
	</div><!-- .supporterContainer end -->
</div><!-- #left end -->


<div id="right">
	<div class="project_state_info">
		<p class="remaining_day">${remainDay }일 남음</p>
		<p class="rate_bar">
			<em></em>
		</p>
		<p class="achievement_rate">
			<strong>1921</strong>% 달성
		</p>
		<p class="total_amount">
			<strong>${totalAmount }</strong>원 펀딩
		</p>
		<p class="total_supporter">
			<strong>${totalCnt }</strong>명의 서포터
		</p>
	</div>
	<div class="funding">
		<button class="btn_funding">펀딩하기</button>
	</div>
	<div class="refund">
		<button class="btn_refund">환불하기</button>
	</div>
</div><!-- #right end --> 


<div style="clear: both;"></div>
</div>

<br><br>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
