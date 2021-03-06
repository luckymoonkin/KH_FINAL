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
                        <h3>?????? ??????</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">?????????</a>
                            <span>?????? ??????</span>
                        </div>
                    </div>

                        <!-- Category -->
                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="member-select" class="selectbox">
                                            <option value="1" selected>?????????</option>
                                            <option value="2">????????????</option>
                                        </select>
                                        <select name="" id="" class="selectbox">
                                            <option value="" selected="selected">?????? ?????? ??????</option>
                                            <option value="5">5?????? ??????</option>
                                            <option value="10">10?????? ??????</option>
                                            <option value="30">30?????? ??????</option>
                                        </select>
                                    </div>
                                    <div class="input-with-icon search-input">
                                        <input type="text" placeholder="???????????? ??????????????????." id="search-val">
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
                                            <th>?????? ??????</th>
                                            <th>?????? ?????? ??????</th>
                                            <th>?????? ??????</th>
                                            <th>?????????</th>
                                            <th>??????</th>
                                            <th>??????</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty orderList }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="6">
													<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>????????? ?????? ????????? ????????????.</p>
						                       		</div>
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty orderList }">
	                                    <tbody>
											<c:forEach var="order" items="${ orderList }" varStatus="vs">
		                                        <tr>
		                                            <td>${ order.orderNo }</td>
		                                            <td>${ order.memberNo }</td>
		                                            <td>${ order.orderPrice }</td>
		                                            <td>
		                                            	<fmt:formatDate value="${ order.orderDate }" pattern="yyy-MM-dd hh:mm"/>
		                                            </td>
		                                            <td>
		                                            	<button class="btn btn-s" id="echo_order_detail" value="${ order.orderNo }">??????</button>
                            						</td>
		                                            <td>
		                                                <button id="cancel" name="no" value=${ order.orderNo } class="btn btn-s gray">????????????</button>
		                                            </td>
		                                        </tr>
											</c:forEach>
	                                    </tbody>
									</c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-wrap">
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <c:if test="${ !empty orderList }">
	                        <div class="paging">
								<!-- ??? ???????????? -->
								<a class="first" href="${ path }/admin/echo_delivery?page=1"></a>
					
								<!-- ?????? ???????????? -->
								<a class="prev" href="${ path }/admin/echo_delivery?page=${ pageInfo.prevPage }"></a>
					
								<!--  10??? ????????? ?????? -->
								<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">			
										<strong>${ status.current }</strong>
									</c:if>
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/admin/echo_delivery?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
					
								<!-- ?????? ???????????? -->
								<a class="next" href="${ path }/admin/echo_delivery?page=${ pageInfo.nextPage }"></a>
					
								<!-- ??? ????????? -->
								<a class="last" href="${ path }/admin/echo_delivery?page=${ pageInfo.maxPage }"></a>
							</div> 
						</c:if>                  
                    </div>
                    
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(() => {
	    let sideBarMenu = $('.side-bar ul li');
	    let menuPath = ['${ path }/admin/echo_list','${ path }/admin/echo_order','${ path }/admin/echo_delivery','${ path }/admin/echo_cancel','${ path }/admin/echo_bidding'];
	    let menuName = ['????????? ??????', '?????? ??????', '?????? ??????', '?????? ??????', '?????? ??????'];
	    let menuIcon = ['inventory_2', 'app_registration', 'local_shipping', 'remove_circle', 'edit'];
	
	    for( let i = 0; i < menuName.length; i++ ) {
	        let menuIdx = sideBarMenu.eq(i);
	
	        menuIdx.find('a').attr('href', menuPath[i]);
	        menuIdx.find('a > i').text(menuIcon[i]);
	        menuIdx.find('a > span').text(menuName[i]);
	    }
	
	    sideBarMenu.each(function(idx, el) {
	        if(idx == 2) {
	            $(this).addClass('current');
	        }
	    });
	});
	
	$(document).on("click","#echo_order_detail", (e) => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/admin/echo_order_detail?no="+ e.target.value;
        
        open(url, "", 'status=no, height=800, width=1500, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
	
	$(document).ready(() => {
		$(document).on('click','#cancel', (e) => {
			if(confirm("????????? ?????? ?????? ???????????????????")) {
				location.replace("${ path }/admin/order_cancel?no=" + e.target.value);
			}
		})
	});
	
	$(document).ready(() => {
		$(document).on('click', '#search', () => {
			if($("#member-select option:selected").val() == 1) {
				location.replace("${ path }/admin/echo_delivery?no=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 2) {
				location.replace("${ path }/admin/echo_delivery?name=" + $("#search-val").val());
			}
		})
	});
</script>

</html>