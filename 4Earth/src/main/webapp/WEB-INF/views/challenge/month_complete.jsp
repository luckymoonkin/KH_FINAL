<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>챌린지</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:if test="${ mapLength == requiredCount }">
	<div class="container js-container">
</c:if>
<c:if test="${ mapLength < requiredCount }">
	<div class="container">
</c:if>
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

		<section class="content-wrap">
			<div class="page-tit">
				<h3>이달의 챌린지</h3>
				<div class="bread-crumb">
					<a href="../index.html"><i class="material-icons md-16">home</i></a>
					<a href="#">에코 챌린지</a> <span>이달의 챌린지</span>
				</div>
			</div>

			<div class="challenge">
				<div class="complete-page">
					<img class="deco" src="${ path }/resources/images/challenge/balloons.png" alt="">
					<div class="txt">
						<span class="user-name">${ loginMember.name }</span>님,
						<p><span class="chal-title">${ list.chalTitle }</span> 챌린지 인증이 완료되었습니다.</p>
					</div>
					<div class="img-thumb">
						<img src="${ path }/resources/upload/challenge/${ list.renamedFilename }" alt="">
					</div>
					<a href="${ path }/month_list" class="btn">이달의 챌린지 메인으로</a>
				</div>
			</div>
		</section>
	</div>

	<button class="btn scroll-top">
		<i class="material-icons md-24">vertical_align_top</i>
	</button>
</div>

<script src="${ path }/resources/js/confetti.js"></script>
<script type="text/javascript">
let idxNum = 1;
$(() => {
	setTimeout(() => {
		$('.container').removeClass('js-container');
		$('.confetti-container').fadeOut(3000);
	}, 3000);
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="resources/js/challenge.js"></script>