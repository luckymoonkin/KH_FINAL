<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>오프라인 매장안내</title>
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
                        <h3>오프라인 매장 안내</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>오프라인 매장 안내</span>
                        </div>
                    </div>
                    
                    <!-- 카카오맵 API -->
                    <section>
                        <div id="map" style="width:810px;height:500px;"></div>
                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2ebb212d45b3614404dcda8f6bda928"></script>
                        
                    </section>

					<br><br>

                    <section>
                        <div class="map-list">
                            <ul>
                                <li>
                                    <a href="">
                                        <strong>서울 남부터미널 본점</strong>
                                    </a>
                                </li>
                                <li>
                                    서울특별시 서초구 효령로 292
                                </li>
                                <li>
                                    000-0000-0000
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <a href="">
                                        <strong>강남 KH정보교육원 지점</strong>
                                    </a>
                                </li>
                                <li>
                                    서울특별시 강남구 테헤란로 14길
                                </li>
                                <li>
                                    111-1111-1111
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <a href="">
                                        <strong>송도 현대프리미엄아울렛 지점</strong>
                                    </a>
                                </li>
                                <li>
                                    인천시 연수구 송도국제대로 123
                                </li>
                                <li>
                                    123-4567-8901
                                </li>
                            </ul>
                        </div>
                    </section>
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
            if(idx == 2) {
                $(this).addClass('current');
            }
        });
    });
    
     // 카카오지도     
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.48459513051179, 127.01565404268777), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
  	 };
    
     var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     
	 // 마커를 표시할 위치와 title 객체 배열입니다
	 var positions = [
		 {
			 latlng: new kakao.maps.LatLng(37.48459513051179, 127.01565404268777), 
	         title: '남부터미널 본점'    
	     },
	     {
	    	 latlng: new kakao.maps.LatLng(37.49894689580301, 127.03286620917937),
	         title: '강남 KH정보교육원 지점'
	     },
	     {
	    	 latlng: new kakao.maps.LatLng(37.38164238113109, 126.65792906837977), 
	         title: '송도 현대프리미엄아울렛 지점' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
	     }
	     
	 ];
     
	 // 마커 이미지의 이미지 주소입니다
	 var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png"; 
	     
	 for (var i = 0; i < positions.length; i ++) {
		// 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(36, 52); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	     
	     // 마커를 생성합니다
	     var marker = new kakao.maps.Marker({
	         map: map, // 마커를 표시할 지도
	         position: positions[i].latlng, // 마커를 표시할 위치
	         title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	         image : markerImage, // 마커 이미지
	         clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	     });
	 }
</script>

</html>