<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>찜 목록</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

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
                        <h3></h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="#">마이페이지</a>
                            <span>찜한 상품</span>
                        </div>
                    </div>

                    <div class="guide">

                        <section>
                            <strong>찜한 상품</strong>     
                            <hr style="border: 1px solid #669948;">
                            <br>                
                            <div class="thumb-list">
                                <ul>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="../store/product-detail.html">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="../store/product-detail.html">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="../store/product-detail.html">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="../store/product-detail.html">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="../store/product-detail.html">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="../store/product-detail.html">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="../store/product-detail.html">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                    </li>
                                </ul>
                            </div>
                        </section>

                        <div class="paging">
                            <a href="#" class="prev"><span>이전</span></a>
                            <strong>1</strong>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">7</a>
                            <a href="#">8</a>
                            <a href="#">9</a>
                            <a href="#">10</a>
                            <a href="#" class="next"><span>다음</span></a>
                        </div>


                        
                    </div> <!-- // guide -->
                </section>


                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
            <!-- <div class="select-option">
                상품 선택
            </div> -->
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['notice.html', 'faq.html','#'];
        let menuName = ['공지사항', 'FAQ', '1:1 문의'];
        let menuIcon = ['home', 'home', 'home' ]

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }
    });

    $(".writeReview").on("click", () => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "file:///C:/FINAL/FinalProject_UI/store/write-review.html";
        
        open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
</script>

</html>