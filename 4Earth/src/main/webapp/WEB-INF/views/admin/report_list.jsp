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
                        <li class="current">
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
                        <h3>신고 목록</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">신고</a>
                            <span>신고 목록</span>
                        </div>
                    </div>

                    <div class="guide">
                        <!-- Category -->
                        <section>
                            <div style="margin-bottom: 5px;">
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="" class="selectbox">
                                            <option value="최신순" selected>최신순</option>
                                            <option value="댓글순">댓글순</option>
                                        </select>
                                        <select name="" id="" class="selectbox">
                                            <option value="10" selected>10개씩 보기</option>
                                            <option value="30">30개씩 보기</option>
                                        </select>
                                        <div class="input-with-icon search-input">
                                            <input type="text" placeholder="검색어를 입력해주세요.">
                                            <button><i class="material-icons">search</i></button>
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
                                            <th>신고 번호</th>
                                            <th>신고받은 회원</th>
                                            <th>신고 회원</th>
                                            <th>신고일</th>
                                            <th>신고분류</th>
                                            <th>신고내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${ empty list }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="6">
												조회된 신고가 없습니다
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty list }">
										<c:forEach var="report" items="${ list }">
		                                    <tbody>
		                                        <tr>
		                                            <td>${ report.reportNo }</td>
		                                            <td>${ report.reportedMemberNo }</td>
		                                            <td>${ report.reportMemberNo }</td>
		                                            <td>${ report.reportDate }</td>
		                                            <td>${ report.reportCategory }</td>
		                                            <td><button class="btn btn-s gray" id="report_view" value="${ report.reportNo }">보기</button></td>
		                                            <td>
		                                                <button class="btn btn-s">등록</button>
		                                                <button id="delete" name="no" value=${ report.reportNo } class="btn btn-s gray">정지</button>
		                                            </td>
		                                        </tr>
		                                    </tbody>
										</c:forEach>
									</c:if>
                                </table>
                            </div>
                            <div class="btn-wrap">
                                <button class="btn">작성</button>
                            </div>
                        </section>
                        <!-- // Category -->
                        <div class="paging">
							<!-- 맨 처음으로 -->
							<a class="prev" href="${ path }/admin/report_list?page=1"></a>
				
							<!-- 이전 페이지로 -->
							<a class="prev" href="${ path }/admin/report_list?page=${ pageInfo.prevPage }"></a>
				
							<!--  10개 페이지 목록 -->
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:if test="${ status.current == pageInfo.currentPage }">			
									<strong>${ status.current }</strong>
								</c:if>
								<c:if test="${ status.current != pageInfo.currentPage }">				
									<a href="${ path }/admin/report_list?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
								</c:if>
							</c:forEach>
				
							<!-- 다음 페이지로 -->
							<a class="next" href="${ path }/admin/report_list?page=${ pageInfo.nextPage }"></a>
				
							<!-- 맨 끝으로 -->
							<a class="next" href="${ path }/admin/report_list?page=${ pageInfo.maxPage }"></a>
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
	    let menuPath = ['${ path }/admin/report_list','${ path }/admin/reported_list' ];
	    let menuName = ['신고 목록', '신고받은 회원 목록'];
	    let menuIcon = ['home', 'home']
	
	    for( let i = 0; i < menuName.length; i++ ) {
	        let menuIdx = sideBarMenu.eq(i);
	
	        menuIdx.find('a').attr('href', menuPath[i]);
	        menuIdx.find('a > i').text(menuIcon[i]);
	        menuIdx.find('a > span').text(menuName[i]);
	    }
	
	    sideBarMenu.each(function(idx, el) {
	        if(idx == 0) {
	            $(this).addClass('current');
	        }
	    });
	});
	
	$(document).ready(() => {
		$(document).on("click","#delete", (e) => {
			if(confirm("정말로 이 신고를 처리하겠습니까??")) {
				location.replace("${ path }/admin/report_delete?no=" + e.target.value);
			}
		})
	
		$(document).on("click","#report_view", (e) => {
	        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
	        var popupY= (window.screen.height / 2) - (800 / 2);
	        const url = "${ path }/admin/report_view?no=" + e.target.value;
	        
	        open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	    });
	});
</script>

</html>