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
                        <h3>이달의 챌린지 목록</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">챌린지</a>
                            <span>이달의 챌린지 목록</span>
                        </div>
                    </div>

                        <!-- Category -->
                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="member-select" class="selectbox">
                                            <option value="1" selected>번호</option>
                                            <option value="2">챌린지 이름</option>
                                            <option value="3">포인트</option>
                                        </select>
                                        <select name="" id="count-select" class="selectbox">
                                            <option value="5">5개씩 보기</option>
                                            <option value="10" selected="selected">10개씩 보기</option>
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
                                        <col width="*">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="10%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>챌린지 번호</th>
                                            <th>챌린지 이름</th>
                                            <th>포인트</th>
                                            <th>시작일</th>
                                            <th>상태</th>
                                            <th>내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${ empty list }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="7">
													<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>조회된 이달의 챌린지가 없습니다.</p>
						                       		</div>
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty list }">
	                                    <tbody>
											<c:forEach var="month" items="${ list }" varStatus="vs">
		                                        <tr>
		                                            <td>${ month.chalNo }</td>
		                                            <td>${ month.chalTitle }</td>
		                                            <td>${ month.chalPoint }</td>
		                                            <td>
		                                            	<fmt:formatDate value="${ month.startDate }" pattern="yyy-MM-dd hh:mm"/>
		                                            </td>
		                                            <td>${ month.chalStatus }</td>
		                                            <td>
		                                            <a href="#popup${ vs.index }" class="btn btn-s btn-open-pop">보기</a> 
					                                 <div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                    	${ month.chalNo }
						                                        <strong>${ month.chalTitle }</strong>
						                                        <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
						                                    </div>
						                                    <table id="view-table">
													           <colgroup>
													           		<col style="10%">
													           		<col style="40%">
													           		<col style="15%">
													           		<col style="35%">
													    		</colgroup>
													        	<tbody>
													        		<tr>
													        			<th>번호</th>
													        			<td>${ month.chalNo }</td>
													        			<th>제목</th>
													        			<td>${ month.chalTitle }</td>
													        		</tr>
													        		<tr>
													        			<th>포인트</th>
													        			<td>${ month.chalPoint }</td>
													        			<th>필요참여수</th>
													        			<td>${ month.chalCount }</td>
													        		</tr>
													        		<tr>
													        			<th>시작일</th>
													        			<td>
													        				<fmt:formatDate value="${ month.startDate }" pattern="yyy-MM-dd hh:mm"/>
													        			</td>
													        			<th>종료일</th>
													        			<td>
													        				<fmt:formatDate value="${ month.endDate }" pattern="yyy-MM-dd hh:mm"/>
													        			</td>
													        		</tr>
													        		<tr>
													        			<th colspan="2">사진</th>
													        			<th colspan="2">내용</th>
													        		</tr>
													        		<tr>
													        			<td colspan="2"><img id="member-img" src="${ path }/resources/upload/challenge/${month.renamedFilename}" /></td>
													        			<td colspan="2">${ month.chalContent }</td>
													        		</tr>
												        		</tbody>
													       		</table>
						                                    <div class="btn-wrap">
						                                        <button class="btn gray btn-close-pop">취소</button>
						                                        <button class="btn">저장</button>
						                                    </div>
						                                </div>
						                            </div>
                            						</td>
		                                            <td>
		                                                <button class="btn btn-s" id="month_update" value="${ month.chalNo }">수정</button>
		                                                <button id="delete" name="no" value=${ month.chalNo } class="btn btn-s gray">정지</button>
		                                        </tr>
											</c:forEach>
	                                    </tbody>
									</c:if>
                                </table>
                            </div>
                            <div class="btn-wrap">
                                <button id="month_write" class="btn">작성</button>
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <c:if test="${ !empty list }">
	                        <div class="paging">
								<!-- 맨 처음으로 -->
								<a class="first" href="${ path }/admin_challenge_month?page=1"></a>
					
								<!-- 이전 페이지로 -->
								<a class="prev" href="${ path }/admin_challenge_month?page=${ pageInfo.prevPage }"></a>
					
								<!--  10개 페이지 목록 -->
								<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">			
										<strong>${ status.current }</strong>
									</c:if>
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/admin/challenge_month?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
					
								<!-- 다음 페이지로 -->
								<a class="next" href="${ path }/admin_challenge_month?page=${ pageInfo.nextPage }"></a>
					
								<!-- 맨 끝으로 -->
								<a class="last" href="${ path }/admin_challenge_month?page=${ pageInfo.maxPage }"></a>
							</div>    
						</c:if>               
                    
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(() => {
	    let sideBarMenu = $('.side-bar ul li');
	    let menuPath = ['${ path }/admin/challenge_today','${ path }/admin/challenge_month','${ path }/admin/challenge_today_manage','${ path }/admin/challenge_month_manage'];
	    let menuName = ['오늘의 챌린지 목록', '이달의 챌린지 목록', '오늘의 챌린지 관리', '이달의 챌린지 관리'];
	    let menuIcon = ['task_alt', 'public', 'people', 'people'];
	
	
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
				location.replace("${ path }/admin/challenge_month?no=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 2) {
				location.replace("${ path }/admin/challenge_month?name=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 3) {
				location.replace("${ path }/admin/challenge_month?point=" + $("#search-val").val());
			}
		})
	});
	
	$(document).on("click","#month_write", (e) => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/admin/month_write";
        
        open(url, "", 'status=no, height=800, width=900, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
	
	$(document).on("click","#month_update", (e) => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/admin/month_update?no="+ e.target.value;
        
        open(url, "", 'status=no, height=800, width=900, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
	
	$(document).ready(() => {
		$(document).on('click','#delete', (e) => {
			if(confirm("정말로 이 챌린지를 정지시키겠습니까??")) {
				location.replace("${ path }/admin/month_delete?no=" + e.target.value);
			}
		})
	});
</script>

</html>