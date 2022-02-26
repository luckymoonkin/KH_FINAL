<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>챌린지</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
       <div class="contents">
           <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
          
           <section class="content-wrap">
               <div class="page-tit">
                   <h3>오늘의 챌린지</h3>
                   <div class="bread-crumb">
                       <a href="${ path }"><i class="material-icons md-16">home</i></a>
                       <a href="${ path }today_list">에코 챌린지</a>
                       <span>오늘의 챌린지</span>
                   </div>
               </div>

               <div class="challenge prov">
                   <div class="how-to">
                       <strong>인증 방법 및 주의 사항</strong>
                       <span>해당 이미지는 예시입니다. 각 챌린지에 맞는 이미지를 업로드하여 인증해주세요.</span>

                       <div class="example">
                           <strong>플로깅은 Plocka Up + Jogging의 합성어로<br>조깅을 하는 동시에 쓰레기를 줍는 활동입니다.</strong>
                           <ul>
                               <li>
                                   <img src="${ path }/resources/images/challenge/callenge02.png" alt="">
                                   <strong>
                                       <i class="material-icons md-22">thumb_up</i>
                                       이렇게 찍어주세요!
                                   </strong>
                                   <p>실외에서 실천하는 모습의<br>사진을 업로드해주세요.</p>
                               </li>
                               <li>
                                   <img src="${ path }/resources/images/challenge/callenge01.png" alt="">
                                   <strong>
                                       <i class="material-icons md-22">thumb_down</i>
                                       이런 사진은 안 돼요!
                                   </strong>
                                   <p>실내에서 쓰레기를 정리하는 사진은<br>챌린지의 의도와 맞지 않습니다.</p>
                               </li>
                           </ul>
                       </div>
                   </div>

                   <section class="section">
                       <h4>챌린지 인증하기</h4>
                       <div class="prov-set">
                           <div class="thumb-img">
                               <img src="${ path }/resources/images/challenge/challenge03.jpg" alt="">
                           </div>
                           <div class="upload-wrap">
                               <strong>걸어서 or 자전거로 출퇴근</strong>
                               <div class="upload-img">
                                   <button class="btn-delete-img">
                                       <i class="material-icons md-22">delete_outline</i>
                                   </button>
                                   <img src="" alt="">
                               </div>
                               <div class="prov-cont">
                                   <form action="" method="">
                                       <div class="upload-file">
                                           <input type="text" class="input-file" disabled placeholder="파일을 선택해주세요." multiple>
                                           <input type="file" id="inputFileOrigin" name="input-file-origin" accept="image/jpeg, image/jpg, image/gif, image/png">
                                           <label for="inputFileOrigin" class="btn">파일 선택</label> 
                                           <span class="validate">gif, png, jpg 파일만 업로드 가능합니다.</span>
                                       </div>
                                   </form>
                               </div>
                           </div>
                           
                           <button class="btn" onclick="location.href='${ path }/today_complete'">인증하기</button>
                       </div>
                   </section>
               </div>

           </section>

           <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
       </div>
   </div>
	

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['/4earth/today_list', '/4earth/month_list', '/4earth/ongoing_list'];
        let menuName = ['오늘의 챌린지', '이달의 챌린지', '참여 중인 챌린지'];
        let menuIcon = ['task_alt', 'public', 'bookmark_border' ]

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
</script>

</html>