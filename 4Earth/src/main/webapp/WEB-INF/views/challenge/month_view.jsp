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

			<div class="challenge">
				<%-- <p>${ loginMember.no }</p> --%>
				<div class="month-challenge-detail">
					<div class="img-thumb">
						<img src="${ path }/resources/upload/challenge/${ month.renamedFilename }" alt="">
					</div>
					<div class="item-cont">
						<span>이달의 챌린지</span>
						<strong>${ month.chalTitle }</strong>
						<p>${ month.chalContent }</p>
						<div class="month-count-point">
							<em>${ month.chalCount }</em>회 참여 완료 시,
							<span class="icon-point">
								<fmt:formatNumber pattern="##,###" value="${ month.chalPoint }" />
							</span>
						</div>
						<c:set var="complete" value="${ fn:length(count) }" />
						<c:if test="${ requiredCount != complete && !empty loginMember }">
							<button class="btn" onclick="location.href='${ path }/month_write?chalNo=${ month.chalNo }'">참여하기</button>
						</c:if>
						<c:if test="${ requiredCount == complete && !empty loginMember }">
							<button class="btn gray" disabled>참여완료</button>
						</c:if>
						<c:if test="${ empty loginMember }">
							<button class="btn gray" disabled>참여하기</button>
						</c:if>
					</div>
				</div>
				
				<c:if test="${ !empty loginMember }">
					<section class="section">
						<div class="using-user">
							<h4>참여중인 사용자</h4>
							<c:if test="${ !empty ongoingMember }">
								<span class="count"><em>${ countUser }</em>명의 사용자가 참여 중입니다</span>
							</c:if>
							<div class="user-list">
								<c:if test="${ !empty ongoingMember }">
									<ul>
										<c:forEach var="ongoingMember" items="${ ongoingMember }">
											<li>
												<div class="img-thumb">
													<c:if test="${ ongoingMember.modifyImgName != null }">
														<img src="${ path }/resources/upload/member/${ ongoingMember.modifyImgName }" alt="">
													</c:if>
													<c:if test="${ ongoingMember.modifyImgName == null }">
														<img src="" alt="">
													</c:if>
												</div>
												<span>${ ongoingMember.id }</span>
											</li>
										</c:forEach>
									</ul>
								</c:if>
								<c:if test="${ empty ongoingMember && !empty loginMember }">
									<p><i class="material-icons md-24">info</i>아직 참여 중인 사용자가 없습니다.</p>
								</c:if>
							</div>
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
	
					<section class="section" id="sectionReply">
						<h4>챌린지 참여 리뷰</h4>
						<div class="reply">
							<c:if test="${ !empty count }">
								<form action="${ path }/write_reply?chalNo=${ month.chalNo }" method="post">
									<textarea name="content" id="" placeholder="간단한 참여 후기를 작성해주세요." required></textarea>
									<button class="btn">등록</button>
									<span class="count-reply"><em>0</em> / 3000</span>
								</form>
							</c:if>
							
							<c:if test="${ empty count }">
								<form action="" method="">
									<textarea name="content" id="" placeholder="챌린지 참여 후 작성 가능합니다." disabled></textarea>
									<button class="btn gray" disabled>등록</button>
									<span class="count-reply"><em>0</em> / 3000</span>
								</form>
							</c:if>
	
							<div class="reply-list">
								<ul>
									<c:if test="${ empty month.replies }">
										<li>
											<div class="empty-content">
												<i class="material-icons">info</i>
												<p>조회된 댓글이 없습니다.</p>
											</div>
										</li>
									</c:if>
							
									<c:if test="${ !empty month.replies }">
										<c:forEach var="reply" items="${ month.replies }">
											<li>
												댓글 번호: ${ reply.replyNo }
												<div class="reply-wrap">
													<div class="user-info">
														<div class="img-thumb">
															<c:if test="${ reply.modifyImgName != null }">
																<img src="${ path }/resources/upload/member/${ reply.modifyImgName }" alt="">
															</c:if>
															<c:if test="${ reply.modifyImgName == null }">
																<img src="" alt="">
															</c:if>
														</div>
														<span class="user-id">
															${ reply.id }
															<c:if test="${ loginMember.no == reply.memNo }">
																<span class="tag tag-orange">내가 쓴 댓글</span>
															</c:if>
														</span>
														<span class="date">
															<fmt:formatDate	pattern="yyyy-MM-dd hh:mm" value="${ reply.modifyDate }" />
														</span>
													</div>
													<div class="reply-cont">
														<p>${ reply.content }</p>
														<button type="button" class="btn-nested-reply">답글</button>
														
														<!-- 수정 -->
														<div class="modify-wrap modify-reply-cont">
															<form action="modify_reply?chalNo=${ month.chalNo }" method="post">
															<!-- <form action="" method=""> -->
																<input type="text" name="replyNo" value="${ reply.replyNo }" class="blind">
																<textarea name="content" required></textarea>
																<div class="btn-wrap">
																	<button type="button" class="btn btn-cancel-reply">취소</button>
																	<button type="submit" class="btn">수정</button>
																	<%-- <button type="submit" class="btn" onclick="location.href='${ path }/modify_reply?no=${ month.chalNo }'">수정</button> --%>
																</div>
															</form>
														</div>
														<!-- // 수정 -->
													</div>
													<div class="btn-wrap">
														<c:if test="${ loginMember.no == reply.memNo }">
															<button class="material-icons md-18 btn-modify-reply" title="수정">create</button>
															<form action="delete_reply?chalNo=${ month.chalNo }" method="post">
																<input type="text" name="replyNo" value="${ reply.replyNo }" class="blind">
																<button type="submit" class="material-icons md-18 btn-delete-reply" title="삭제">delete_outline</button>
															</form>
														</c:if>
														<c:if test="${ loginMember.no != reply.memNo }">
															<a href="#popup01" class="material-icons md-18 btn-report-reply btn-open-pop" title="신고">report_problem</a>
														</c:if>
													</div>
												</div>
												
												<!-- 대댓글 작성 -->
												<!-- 수정 -->
												<%-- <div class="modify-wrap modify-reply-cont">
													<form action="modify_reply?chalNo=${ month.chalNo }" method="post">
													<!-- <form action="" method=""> -->
														<input type="text" name="replyNo" value="${ reply.replyNo }" class="blind">
														<textarea name="content" required></textarea>
														<div class="btn-wrap">
															<button type="button" class="btn btn-cancel-reply">취소</button>
															<button type="submit" class="btn">수정</button>
															<button type="submit" class="btn" onclick="location.href='${ path }/modify_reply?no=${ month.chalNo }'">수정</button>
														</div>
													</form>
												</div> --%>
												<!-- // 수정 -->
												
												<ul class="nested-wrap">
													<li>
	                                                	<div class="modify-reply-cont">
															<form action="write_nested_reply?chalNo=${ month.chalNo }" method="post">
																<input type="text" name="replyNo" value="${ reply.replyNo }" class="blind">
																<textarea name="content" required></textarea>
																<div class="btn-wrap">
																	<button type="button" class="btn btn-cancel-reply">취소</button>
																	<button type="submit" class="btn">등록</button>
																</div>
															</form>
														</div>
	                                                </li>
												</ul>
												<!-- // 대댓글 작성 -->
											
												<!-- 대댓글 목록 -->
												<c:if test="${ !empty month.replies }">
													<c:forEach var="nestedReply" items="${ month.nestedReplies }">
														<c:if test="${ reply.replyNo == nestedReply.replyNo }">
															<ul>
				                                                <li>
				                                                	대댓글 번호: ${ nestedReply.replyNo }
				                                                    <div class="user-info">
				                                                        <div class="img-thumb">
				                                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
				                                                        </div>
				                                                        <span class="user-id">
																			${ nestedReply.id }
																			<c:if test="${ loginMember.no == nestedReply.memNo }">
																				<span class="tag tag-orange">내가 쓴 댓글</span>
																			</c:if>
																		</span>
																		<span class="date">
																			<fmt:formatDate	pattern="yyyy-MM-dd hh:mm" value="${ nestedReply.modifyDate }" />
																		</span>
				                                                    </div>
				                                                    <div class="reply-cont">
				                                                        <p>${ nestedReply.content }</p>
				                                                        
				                                                        <!-- 수정 -->
																		<div class="modify-wrap modify-reply-cont">
																			<form action="modify_reply?chalNo=${ month.chalNo }" method="post">
																			<!-- <form action="" method=""> -->
																				<input type="text" name="replyNo" value="${ nestedReply.replyNo }" class="blind">
																				<textarea name="content" required></textarea>
																				<div class="btn-wrap">
																					<button type="button" class="btn btn-cancel-reply">취소</button>
																					<button type="submit" class="btn">수정</button>
																					<%-- <button type="submit" class="btn" onclick="location.href='${ path }/modify_reply?no=${ month.chalNo }'">수정</button> --%>
																				</div>
																			</form>
																		</div>
																		<!-- // 수정 -->
				                                                    </div>
				                                                    <div class="btn-wrap">
																		<c:if test="${ loginMember.no == nestedReply.memNo }">
																			<button class="material-icons md-18 btn-modify-reply" title="수정">create</button>
																			<form action="delete_reply?chalNo=${ month.chalNo }" method="post">
																				<input type="text" name="replyNo" value="${ nestedReply.replyNo }" class="blind">
																				<button type="submit" class="material-icons md-18 btn-delete-reply" title="삭제">delete_outline</button>
																			</form>
																		</c:if>
																		<c:if test="${ loginMember.no != nestedReply.memNo }">
																			<a href="#popup01" class="material-icons md-18 btn-report-reply btn-open-pop" title="신고">report_problem</a>
																		</c:if>
																	</div>
				                                                </li>
															</ul>
														</c:if>
													</c:forEach>
												</c:if>
												<!-- // 대댓글 목록 -->
												
											</li>
										</c:forEach>
									</c:if>
								</ul>
	
								<!-- <div class="paging">
									<a href="#" class="prev"><span>이전</span></a>
									<strong>1</strong>
									<a href="#">2</a>
									<a href="#">3</a>
									<a href="#">4</a>
									<a href="#">5</a>
									<a href="#" class="next"><span>다음</span></a>
								</div> -->
							</div>
	
						</div>
					</section>
				</c:if>
				
				<c:if test="${ empty loginMember }">
					<div class="empty-content">
						<i class="material-icons">info</i>
						<p>로그인 후 참여 가능합니다.</p>
						<a href="${ path }/login" class="btn-link">
							로그인 <i class="material-icons md-20">arrow_right</i>
						</a>
					</div>
				</c:if>
			</div>
		</section>

		<button class="btn scroll-top">
			<i class="material-icons md-24">vertical_align_top</i>
		</button>
		
		<!-- layer popup -->
        <div class="layer-popup" id="popup01">
            <div class="layer-inner">
                <div class="pop-head">
                    <strong>신고하기</strong>
                    <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
                </div>
                <div class="pop-cont">
                    <div>신고 내용</div>
                </div>
                <div class="btn-wrap">
                    <button class="btn gray btn-close-pop">취소</button>
                    <button class="btn">신고</button>
                </div>
            </div>
        </div>
        <div class="dimed"></div>
        <!-- // layer popup -->
        
	</div>
</div>

<script type="text/javascript">
	let idxNum = 1;
	
	window.onload = function() {
		let btnModify = $('.btn-modify-reply');
		let btnCancel = $('.btn-cancel-reply');
		let btnDelete = $('.btn-delete-reply');
		let btnNested = $('.btn-nested-reply');
		
		btnModify.each(function(idx, el) {
			$(el).on('click', (e) => {
				$(e.currentTarget).parents('.btn-wrap').hide();
				$(e.currentTarget).parents('.btn-wrap').prev().find('p').hide();
				$(e.currentTarget).parents('.btn-wrap').prev().find('.btn-nested-reply').hide();
				$(e.currentTarget).closest('li').css('background', '#f9f9f9');
				$(e.currentTarget).parents('.btn-wrap').prev().find('.modify-wrap').show();
			});
		});
		
		btnCancel.each(function(idx, el) {
			$(el).on('click', (e) => {
				$(e.currentTarget).parents('.reply-cont').next('.btn-wrap').show();
				$(e.currentTarget).parents('.reply-cont').find('p').show();
				$(e.currentTarget).parents('.reply-cont').find('.btn-nested-reply').show();
				$(e.currentTarget).closest('li').css('background', '#fff');
				$(e.currentTarget).parents('.reply-cont').find('.modify-wrap').find('textarea').val("");
				$(e.currentTarget).parents('.reply-cont').find('.modify-wrap').hide();
			});
		});
		
		btnDelete.on('click', () => {
			if(confirm("댓글을 삭제하시겠습니까?")) {
				location.replace("${ path }/delete_reply?no=${ month.chalNo }");
			}
		})
		
		btnNested.each(function(idx, el) {
			$(el).on('click', (e) => {
				$(e.currentTarget).parents('.reply-wrap').siblings('.nested-wrap').show();
			});
		});
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script src="resources/js/challenge.js"></script>