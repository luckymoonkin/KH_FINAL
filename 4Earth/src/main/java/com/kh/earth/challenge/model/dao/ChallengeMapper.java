package com.kh.earth.challenge.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.Point;
import com.kh.earth.challenge.model.vo.Reply;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.store.model.vo.Product;


@Mapper
public interface ChallengeMapper {
	// 오늘의 챌린지 전체 목록 조회
	List<Today> findAllToday();
	
	// 오늘의 챌린지 상세 조회
	Today selectTodayListByNo(@Param("chalNo") int chalNo);
	
	// 오늘의 챌린지 참여 회원 저장 및 완료
	int insertTodayMember(Map<String, Object> map);
	List<TodayMember> findChalTitle(Map<String, Object> map);
	
	// 오늘의 챌린지 모두 달성 시 포인트 저장
	int insertPoint(Point point);
	
	// 오늘의 챌린지 참여 회원 목록 조회
	List<TodayMember> selectTodayMemberListByNo(int no);

	
	
	
	
	// 이달의 챌린지 목록 조회
	int getBoardCount(); // 게시글 총 개수
	List<Month> findAllMonth(RowBounds rowBounds); // 페이징
	List<Month> findAllMonthArrange(RowBounds rowBounds, String arrange); // 페이징 + 정렬

	// 이달의 챌린지 상세 조회
	Month selectMonthListByNo(int chalNo);

	// 이달의 챌린지 참여 회원 저장 및 완료
	int insertMonthMember(Map<String, Object> map);
	List<MonthMember> findMonthCompleteList(Map<String, Object> map);

	// 참여 중인 사용자 목록 조회
	List<MonthMember> findOngoingUserList(Map<String, Object> map);

	// 참여 중인 사용자 목록 갯수 조회
	int findOngoingUserCount(Map<String, Object> mapCount);

	// 이달의 챌린지 참여 횟수 조회
	List<MonthMember> getMonthGuage(Map<String, Object> completeCount);

	// 댓글 작성
	int insertReply(Reply reply);
	
	// 댓글 수정
	int updateReply(Reply reply);

	// 댓글 삭제
	Reply findReplyByNo(int replyNo);
	int updateReplyStatus(@Param("replyNo") int replyNo, @Param("replyStatus") String replyStatus);

	
	

	
	
	
	// 참여 중인 챌린지 목록 조회
	List<MonthMember> findOngoingListByMemNo(int no, RowBounds rowBounds);

	// 참여 중인 챌린지 목록 갯수 조회
	int getOngoingListCount(int no);
	
	
	
	
	
	
	
	// 메인 - 챌린지 목록
	List<Month> findMonthBestList();
	// 메인 - 상품 목록
	List<Product> findProductBestList();






	



	

	



		


}
