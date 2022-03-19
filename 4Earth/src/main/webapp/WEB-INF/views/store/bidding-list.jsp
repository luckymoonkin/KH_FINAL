<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://kit.fontawesome.com/da4a2ee2c4.js" crossorigin="anonymous"></script>
    <title>모집목록</title>
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
                        <h3>모집중인 상품</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>소분샵 입고 신청</span>
                        </div>
                    </div>

                    <div class="store-wrap">

                        <section>
                            <hr style="border: 1px solid #669948;">
                            <br>
                            <button id="writeApplication" class="btn" style="float: right;">입고 신청하기</button>
                            <br><br><br>

                            <div class="thumb-list">
                                <ul>
                                	<c:if test="${ empty list }">
                                		<p style="text-align: center;">모집중인 상품이 없습니다.</p> 
                                	</c:if>
                                	<c:if test="${ !empty list }">
                                		<c:forEach var="list" items="${ list }">
											<li>
												<input type="hidden" value="${ list.bidNo }">
		                                        <div class="img-thumb">
		                                            <img src="${ path }/resources/upload/store/${ list.renamedFileName }" alt="">
		                                        </div>
		                                        <strong><a href="${ path }/bidding_detail?no=${ list.bidNo }">${ list.bidName }</a></strong>
		                                        <div class="price">
		                                            <div class="progress">
		                                                <div class="progress-bar bg-success prog-list" role="progressbar" style="width: ${ list.bidCurr div list.bidCond * 100 }%" aria-valuenow="${ list.bidCurr div list.bidCond * 100 }" aria-valuemin="0" aria-valuemax="100"></div>
		                                            </div>
		                                        </div>
		                                        <div class="review"><small>달성률 <fmt:formatNumber value="${ list.bidCurr div list.bidCond * 100 }" pattern="0.0"/>%</small></div>
		                                        
		                                        <div class="btn-wrap">
		                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
		                                        </div>
		                                    </li>
                                		</c:forEach>                                		
                                	</c:if>
                                </ul>
                            </div>
                        </section>
                        <!-- // Thumbnail List -->

                        <c:if test="${ !empty list }">
	                        <div class="paging">
	                            <a href="${ path }/product_bidding?page=${ pageInfo.prevPage }" class="prev"><span>이전</span></a>
	                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">				
										<strong>${ status.current }</strong>
									</c:if>
									
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }product_bidding?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
	                            <a href="${ path }/product_bidding?page=${ pageInfo.nextPage }" class="next"><span>다음</span></a>
	                        	<input type="hidden" name="no" value="${ product.proNo }">
	                        </div>
                        </c:if>
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
        let menuPath = ['${ path }/product_list', '${ path }/bidding_list','${ path }/map'];
        let menuName = ['소분샵', '소분샵 입고 신청', '오프라인 매장 안내'];
        let menuIcon = ['storefront', 'edit', 'location_on' ]

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }
        
        sideBarMenu.each(function(idx, el) {
            if(idx == 1) {
                $(this).toggleClass('current');
            }
        });
    });

    // 하트 버튼
    $(".heart.fa").click(function() {
        $(this).toggleClass("fa-heart fa-heart-o");
    });

 	// 모집 참여
    $(document).on("click", ".heart.fa", function() {
        var selected = $(this);
    	var bidNo = $(this).parents("li").find("input[type='hidden']").val();
        
        console.log(bidNo);
        console.log(typeof bidNo);
        
		$.ajax({
			type : "post",
			url : "${ path }/add_bid",
			data : 
				bidNo,
			contentType : 'application/json; charset=UTF-8',
			error : function(request, error){
		    	console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    	
		    	if(request.status === 500){
		    		alert("이미 참여하셨습니다.");
		    	}
		    	else if(request.status === 400){		    		
			    	alert("우선 로그인해주세요");
			    	window.location = "${ path }/login";
		    	}
			},
			success : function(data){
				console.log("ajax success");
				console.log(data);
				
				console.log(selected);
				selected.toggleClass("fa-heart fa-heart-o");
				
				if(data === "Bid Added" || data === "Bid Again"){
					alert("참여 성공");
				}
				else if(data === "Bid Deleted"){
					alert("참여 취소");
				}
			}
		});  
    }); 
    
    // 입고 신청하기 팝업
    $("#writeApplication").on("click", () => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/write_application";
        
        open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
</script>

</html>