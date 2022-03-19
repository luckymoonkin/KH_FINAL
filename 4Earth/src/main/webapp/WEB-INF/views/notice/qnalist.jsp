<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>main</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

       <div class="container">
        <div class="contents">
<%@ include file="/WEB-INF/views/common/sideBar.jsp" %>  
          <section class="content-wrap">
            <div class="page-tit">
              <h3>공지사항</h3>
              <div class="bread-crumb">
                <a href="${ path }"
                  ><i class="material-icons md-16">home</i></a
                >
                <a href="#">About Us</a>
                <span>공지사항</span>
              </div>
            </div>
            <br />
            <table class="table">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>카테고리</th>
                  <th>작성자</th>
                  <th>날짜</th>
                  <th>파일</th>
                </tr>
              </thead>
              <tbody>
                	<c:if test="${ empty list }">			
			<tr>
				<td colspan="6">
					조회된 게시글이 없습니다.
				</td>
			</tr>	
		</c:if>
		<c:if test="${ !empty list }">
			<c:forEach var="qna" items="${ list }">
				<tr>
					<td>${ qna.no }</td>
					<td colspan="8">
						<a href="${ path }/notice/qnaView?no=${ qna.no }">
							${ qna.title }
						</a>
					</td>
					<td>${ qna.category }</td>
					<td>${ qna.writerId }</td>
					<td><fmt:formatDate type="date" value="${ qna.createDate }"/></td>
					<td>
						<c:if test="${ empty qna.originalFileName }">
							<span> - </span>
						</c:if>
						<c:if test="${ !empty qna.originalFileName }">
							<img src="${ path }/resources/images/file.png" width="20" height="20"/>
						</c:if>
					</td>
				</tr>
			</c:forEach>

		</c:if>			
              </tbody>
            </table>
            <div class="table_bottom">
              <a class="btn" href="${ path }/notice/qnaWrite" role="button">
                글쓰기
              </a>

         
              
            </div>
            <form action="#" method="GET" class="form-search">
              <div class="input-with-icon search-input">
                <input type="text" placeholder="검색어를 입력해주세요." />
                <button><i class="material-icons">search</i></button>
              </div>
            </form>
            <div class="paging">
              <!-- 맨 처음으로 -->
              <a
                class="first"
                onclick="location.href='${ path }/notice/qnalist?page=1'"
              >
              </a>

              <!-- 이전 페이지로 -->
              <a
                class="prev"
                onclick="location.href='${ path }/notice/qnalist?page=${ pageInfo.prevPage }'"
              >
              </a>

              <!--  10개 페이지 목록 -->
              <c:forEach
                begin="${ pageInfo.startPage }"
                end="${ pageInfo.endPage }"
                varStatus="status"
              >
                <c:if test="${ status.current == pageInfo.currentPage}">
                  <a disabled>${ status.current }</a>
                </c:if>

                <c:if test="${ status.current != pageInfo.currentPage }">
                  <a
                    onclick="location.href='${ path }/notice/qnalist?page=${ status.current }&count=${ pageInfo.listLimit }'"
                  >
                    ${ status.current }
                  </a>
                </c:if>
              </c:forEach>

              <!-- 다음 페이지로 -->
              <a
                class="next"
                onclick="location.href='${ path }/notice/qnalist?page=${ pageInfo.nextPage }'"
              >
              </a>

              <!-- 맨 끝으로 -->
              <a
                class="last"
                onclick="location.href='${ path }/notice/qnalist?page=${ pageInfo.maxPage }'"
              >
              </a>
            </div>
                      
          </section>
        </div>
      </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <script src="../resources/js/notice.js"></script>
    <script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['list', 'faq','qnalist'];
        let menuName = ['공지사항', 'FAQ', '1:1 문의'];
        let menuIcon = ['home', 'home', 'home' ]

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }
    });
</script>