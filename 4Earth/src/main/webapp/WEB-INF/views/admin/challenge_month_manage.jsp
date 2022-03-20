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

                    <div class="month-member">
                        <!-- Category -->
                        <section>
                            <div style="margin-bottom: 5px;">
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="member-select" class="selectbox">
                                            <option value="1" selected>참가번호</option>
                                            <option value="2">회원번호</option>
                                            <option value="3">챌린지번호</option>
                                        </select>
                                        <select name="" id="count-select" class="selectbox">
                                            <option value="5">5개씩 보기</option>
                                            <option value="10" selected="selected">10개씩 보기</option>
                                            <option value="30">30개씩 보기</option>
                                        </select>
                                        <div class="input-with-icon search-input">
                                            <input type="text" placeholder="검색어를 입력해주세요." id="search-val">
                                            <button id="search"><i class="material-icons">search</i></button>
                                        </div>
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
                                            <th>챌린지 번호</th>
                                            <th>챌린지 참가 번호</th>
                                            <th>챌린지 참여자</th>
                                            <th>확인</th>
                                            <th>포인트</th>
                                            <th>내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${ empty list }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="6">
												조회된 멤버가 없습니다
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty list }">
										<c:forEach var="monthMember" items="${ list }" varStatus="vs">
		                                    <tbody>
		                                        <tr>
		                                            <td>${ monthMember.chalNo }</td>
		                                            <td>${ monthMember.no }</td>
		                                            <td>${ monthMember.memNo }</td>
		                                            <td>${ monthMember.chalPointStatus }</td>
		                                            <td>${ monthMember.chalPoint }</td>
		                                            <td>
		                                            <a href="#popup${ vs.index }" class="btn btn-open-pop">보기</a> 
					                                <div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                    	${ monthMember.no }
						                                        <strong>${ monthMember.chalNo }</strong>
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
													        			<th>이름</th>
													        			<td>${ monthMember.memNo }</td>
													        			<th>참여일</th>
													        			<td>
													        				<fmt:formatDate value="${ monthMember.chalDate }" pattern="yyy-MM-dd hh:mm"/>
													        			</td>
													        		</tr>
													        		<tr>
													        			<th>포인트</th>
													        			<td>${ monthMember.chalPoint }</td>
													        			<th>지급상황</th>
													        			<td>${ monthMember.chalPointStatus }</td>
													        		</tr>
													        		<tr>
													        			<th colspan="4">사진</th>
													        		</tr>
													        		<tr>
													        			<td colspan="4" style="height: 300px">
													        				<img id="member-img" src="${ path }/resources/upload/challengeUser/${ monthMember.renamedFilename }" />
													        			</td>
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
		                                                <button id="point" name="no" value=${ monthMember.no } class="btn btn-s">확인</button>
		                                                <button id="delete" name="no" value=${ monthMember.no } class="btn btn-s gray">정지</button>
		                                            </td>
		                                        </tr>
		                                    </tbody>
										</c:forEach>
									</c:if>
                                </table>
                            </div>
                            <div class="btn-wrap">
                            </div>
                        </section>
                        <!-- // Category -->
                        <div class="paging">
							<!-- 맨 처음으로 -->
							<a class="prev" href="${ path }/admin_member?page=1"></a>
				
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
							<a class="next" href="${ path }/admin_member?page=${ pageInfo.maxPage }"></a>
						</div>                 
                    </div>
                    
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
	    let menuIcon = ['home', 'home', 'home', 'home']
	
	
	    for( let i = 0; i < menuName.length; i++ ) {
	        let menuIdx = sideBarMenu.eq(i);
	
	        menuIdx.find('a').attr('href', menuPath[i]);
	        menuIdx.find('a > i').text(menuIcon[i]);
	        menuIdx.find('a > span').text(menuName[i]);
	    }
	
	    sideBarMenu.each(function(idx, el) {
	        if(idx == 3) {
	            $(this).addClass('current');
	        }
	    });
	});
	
	$(document).ready(() => {
		$(document).on('click', '#search', () => {
			if($("#member-select option:selected").val() == 1) {
				location.replace("${ path }/admin/challenge_month_manage?no=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 2) {
				location.replace("${ path }/admin/challenge_month_manage?memberNo=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 3) {
				location.replace("${ path }/admin/challenge_month_manage?chalNo=" + $("#search-val").val());
			}
		})
	});
	
	$(document).ready(() => {
		$(document).on('click','#point', (e) => {
			if(confirm("정말로 확인 하셨습니까??")) {
				location.replace("${ path }/admin/month_point?no=" + e.target.value);
			}
		})
	});
	
	$(document).ready(() => {
		$(document).on('click','#delete', (e) => {
			if(confirm("정말로 이 챌린지 참여를 취소 시키겠습니까??")) {
				location.replace("${ path }/admin/month_mem_delete?no=" + e.target.value);
			}
		})
	});
</script>

</html>