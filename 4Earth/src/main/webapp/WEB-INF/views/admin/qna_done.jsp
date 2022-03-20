<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<%@ include file="/WEB-INF/views/common/admin_header.jsp" %>

        <div class="container">
            <div class="contents">
                <div class="side-bar is-open">
                    <button class="btn toggle-nav">
                        <i class="material-icons md-24">last_page</i>
                    </button>
                    <ul>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                    </ul>
                </div>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>문의 완료 목록</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">문의</a>
                            <span>문의 완료 목록</span>
                        </div>
                    </div>

                    <div class="guide">
                        <!-- Category -->
                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="member-select" class="selectbox">
                                            <option value="1" selected>번호검색</option>
                                            <option value="2">제목검색</option>
                                            <option value="3">분류검색</option>
                                        </select>
                                        <select name="" id="count-select" class="selectbox">
                                            <option value="" selected="selected">목록 갯수 선택</option>
                                            <option value="5">5개씩 보기</option>
                                            <option value="10">10개씩 보기</option>
                                            <option value="30">30개씩 보기</option>
                                        </select>
                                    </div>
                                    <div class="input-with-icon search-input">
                                        <input type="text" placeholder="검색어를 입력해주세요." id="search-val">
                                        <button id="search"><i class="material-icons">search</i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="board">
                                <table class="table">
                                    <colgroup>
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="*">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>문의 번호</th>
                                            <th>문의 제목</th>
                                            <th>문의 분류</th>
                                            <th>문의자 아이디</th>
                                            <th>작성일</th>
                                            <th>내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${ empty qna }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="7">
													<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>조회된 완료 문의 내역이 없습니다.</p>
						                       		</div>
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty qna }">
										<c:forEach var="qna" items="${ qna }" varStatus="vs">
		                                    <tbody>
		                                        <tr>
		                                            <td>${ qna.no }</td>
		                                            <td>${ qna.title }</td>
		                                            <td>${ qna.category }</td>
		                                            <td>${ qna.writerNo }</td>
		                                            <td><fmt:formatDate value="${ qna.createDate }" pattern="yyy-MM-dd hh:mm"/></td>
		                                            <td>
		                                            <a href="#popup${ vs.index }" class="btn btn-s btn-open-pop">보기</a> 
					                                <div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                    	문의 번호 : ${ qna.no }
						                                        <strong>문의 답변 완료</strong>
						                                        <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
						                                    </div>
						                                    <div class="pop-cont">
						                                       <table id="view-table">
													           <colgroup>
													           		<col style="10%">
													           		<col style="40%">
													           		<col style="15%">
													           		<col style="35%">
													    		</colgroup>
													        	<tbody>
													        		<tr>
													        			<th>제목</th>
													        			<td>${ qna.title }</td>
													        			<th>멤버 번호</th>
													        			<td>${ qna.writerNo }</td>
													        		</tr>
													        		<tr>
													        			<th colspan="2">사진</th>
													        			<th colspan="2">내용</th>
													        		</tr>
													        		<tr>
													        			<td colspan="2"><img id="member-img" src="${ path }/resources/upload/notice/${qna.renamedFileName}" /></td>
													        			<td colspan="2">${ qna.content }</td>
													        		</tr>
													        		<tr >
													        			<td colspan="4">문의답변</td>
													        		</tr>
													        		<tr>
													        			<td colspan="4">${ answer[vs.index].answerContent }</td>
													        		</tr>
												        		</tbody>
													       		</table>
						                                    </div>
						                                    <div class="btn-wrap">
						                                        <button class="btn gray btn-close-pop">취소</button>
						                                        <button class="btn">저장</button>
						                                    </div>
						                                </div>
						                            </div>
                            						</td>
		                                            <td>
		                                                <button id="qna_answer" name="no" value=${ qna.no } class="btn btn-s">수정</button>
		                                            </td>
		                                        </tr>
		                                    </tbody>
										</c:forEach>
									</c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-wrap">
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <c:if test="${ !empty qna }">
	                        <div class="paging">
								<!-- 맨 처음으로 -->
								<a class="first" href="${ path }/admin_member?page=1"></a>
					
								<!-- 이전 페이지로 -->
								<a class="prev" href="${ path }/admin_member?page=${ pageInfo.prevPage }"></a>
					
								<!--  10개 페이지 목록 -->
								<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">			
										<strong>${ status.current }</strong>
									</c:if>
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/admin/member?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
					
								<!-- 다음 페이지로 -->
								<a class="next" href="${ path }/admin_member?page=${ pageInfo.nextPage }"></a>
					
								<!-- 맨 끝으로 -->
								<a class="last" href="${ path }/admin_member?page=${ pageInfo.maxPage }"></a>
							</div>
						</c:if>            
                    </div>
                    
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(() => {
	    let sideBarMenu = $('.side-bar ul li');
	    let menuPath = ['${ path }/admin/qna','${ path }/admin/qna_done','${ path }/admin/echo_qna'];
	    let menuName = ['문의 목록', '문의 완료 목록', '상품 문의'];
	    let menuIcon = ['help', 'checklist_rtl', 'inventory_2']
	
	
	    for( let i = 0; i < menuName.length; i++ ) {
	        let menuIdx = sideBarMenu.eq(i);
	
	        menuIdx.find('a').attr('href', menuPath[i]);
	        menuIdx.find('a > i').text(menuIcon[i]);
	        menuIdx.find('a > span').text(menuName[i]);
	    }
	
	    sideBarMenu.each(function(idx, el) {
	        if(idx == 1) {
	            $(this).addClass('current');
	        }
	    });
	});
	
	$(document).ready(() => {
		$(document).on('click', '#search', () => {
			if($("#member-select option:selected").val() == 1) {
				location.replace("${ path }/admin/qna_done?no=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 2) {
				location.replace("${ path }/admin/qna_done?name=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 3) {
				location.replace("${ path }/admin/qna_done?category=" + $("#search-val").val());
			}
		})
	});
	
	$(document).on("click","#qna_answer", (e) => {
	    var popupX = (document.body.offsetWidth / 2) - (800 / 2);
	    var popupY= (window.screen.height / 2) - (800 / 2);
	    const url = "${ path }/admin/qna_answer?no="+ e.target.value;
	    
	    open(url, "", 'status=no, height=800, width=900, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	});
</script>

</html>