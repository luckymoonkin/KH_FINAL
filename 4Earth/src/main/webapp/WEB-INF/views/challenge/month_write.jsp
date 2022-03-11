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
<div class="container">
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

		<section class="content-wrap">
			<div class="page-tit">
				<h3>이달의 챌린지</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a> <a
						href="${ path }/today_main">에코 챌린지</a> <span>이달의 챌린지</span>
				</div>
			</div>

			<div class="challenge prov">
				<div class="how-to">
					<strong>인증 방법 및 주의 사항</strong> <span>해당 이미지는 예시입니다. 각 챌린지에
						맞는 이미지를 업로드하여 인증해주세요.</span>

					<div class="example">
						<strong>플로깅은 Plocka Up + Jogging의 합성어로<br>조깅을 하는 동시에
							쓰레기를 줍는 활동입니다.
						</strong>
						<ul>
							<li>
								<img src="${ path }/resources/images/challenge/challenge02.png" alt="">
								<strong><i class="material-icons md-22">thumb_up</i>이렇게 찍어주세요!</strong>
								<p>실외에서 실천하는 모습의<br>사진을 업로드해주세요.</p>
							</li>
							<li>
								<img src="${ path }/resources/images/challenge/challenge01.png" alt="">
								<strong><i class="material-icons md-22">thumb_down</i>이런 사진은 안 돼요!</strong>
								<p>실내에서 쓰레기를 정리하는 사진은<br>챌린지의 의도와 맞지 않습니다.</p>
							</li>
						</ul>
					</div>
				</div>

				<section class="section">
					<h4>챌린지 인증하기</h4>
					<%-- <p>회원 번호: ${ loginMember.no }</p>
					<p>챌린지 번호: ${ month.chalNo }</p> --%>
					<div class="prov-set">
						<form action="${ path }/month_complete?chalNo=${ month.chalNo }"method="post" enctype="multipart/form-data">
							<div class="thumb-img">
								<strong>예시 이미지</strong>
								<img src="${ path }/resources/images/challenge/challenge_today01.jpg"alt="">
							</div>
							
							<!-- <div class="upload-wrap">
								<div class="upload-img">
									<button type="button" class="btn-delete-img">
										<i class="material-icons md-22">delete_outline</i>
									</button>
									<img src="" alt="">
								</div>
								<div class="prov-cont">
									<div class="upload-file">
										<input type="text" class="input-file" disabled placeholder="파일을 선택해주세요." multiple>
										<input type="file" id="inputFileOrigin" name="upfile" accept="image/jpeg, image/jpg, image/gif, image/png" required>
										<label for="inputFileOrigin" class="btn">파일 선택</label>
										<span class="validate">gif, png, jpg 파일만 업로드 가능합니다.</span>
									</div>
								</div>
							</div> -->
							
							<div class="upload-wrap">
                                <div class="upload-img"></div>
                                <div class="upload-file">
                                    <input type="text" class="input-file" disabled="" placeholder="파일을 선택해주세요." multiple="">
                                    <input type="file" id="inputFileOrigin" name="upfile" accept="image/jpeg, image/jpg, image/gif, image/png" required>
                                    <label for="inputFileOrigin" class="btn">파일 선택</label> 
                                    <span class="validate">gif, png, jpg 파일만 업로드 가능합니다.</span>
                                </div>
                                <div class="file-edit-icon">
                                    <a href="javascript:void(0);" class="btn-delete-img"><i class="material-icons md-22">delete_outline</i></a>
                                </div>
                            </div>

							<%-- <button type="submit" class="btn" onclick="location.href='${ path }/today_complete?chalNo=${ today.chalNo }'">인증하기</button> --%>
							<input type="submit" class="btn" id="btnComplete" value="인증하기">
						</form>
					</div>
				</section>

				<c:if test="${ !empty count }">
					<section class="section">
						<h4>나의 챌린지 참여 현황</h4>
						<div class="gauge">
							<c:set var="remainCount" value="${ requiredCount - fn:length(count) }" />
							<%-- 필요 횟수: ${ requiredCount }번<br>
							완료 횟수: ${ fn:length(count) }번<br>
							남은 횟수: ${ requiredCount - fn:length(count) }번 --%>
							<ul>
								<!-- 달성 완료 횟수 -->
								<c:forEach var="count" items="${ count }" varStatus="status">
									<li class="complete">
										<span></span>
										<p>${ status.count }회 달성 완료</p>
									</li>
								</c:forEach>
								
								<c:forEach var="remainCountList" items="${ remainCountList }" varStatus="remainStatus">
									<c:set var="completeCount" value="${ fn:length(count) }" />
									<li>
										<span></span>
										<p>${ completeCount + remainStatus.count }회</p>
									</li>
								</c:forEach>
							</ul>
						</div>
					</section>
				</c:if>
			</div>

		</section>

		<button class="btn scroll-top">
			<i class="material-icons md-24">vertical_align_top</i>
		</button>
	</div>
</div>

<script type="text/javascript">
let idxNum = 1;
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script src="resources/js/challenge.js"></script>