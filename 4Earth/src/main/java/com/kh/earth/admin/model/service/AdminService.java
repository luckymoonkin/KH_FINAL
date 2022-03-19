package com.kh.earth.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.earth.admin.model.vo.ProInqAnswer;
import com.kh.earth.admin.model.vo.QnaAnswer;
import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.admin.model.vo.Reported;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.notice.model.vo.Qna;
import com.kh.earth.store.model.vo.OrderDetail;
import com.kh.earth.store.model.vo.OrderSum;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductBidding;
import com.kh.earth.store.model.vo.ProductImgs;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.twilio.rest.api.v2010.account.Application;

public interface AdminService {

	int getReportCount(Map<String, String> name);

	List<Report> getReportList(PageInfo pageInfo, Map<String, String> name);

	int deleteReport(int no);
	
	int getMemberCount(Map<String, String> name);
	
	List<Member> getMemberList(PageInfo pageInfo, Map<String, String> name);
	
	int deleteMember(int no);
	
	int getProductCount(Map<String, String> name);

	List<Product> getProductList(PageInfo pageInfo, Map<String, String> name);

	List<Reported> getReportedList(PageInfo pageInfo, Map<String, String> name);

	Report getReportDetail(int no);

	int getReportedCount();

	int getTodayCount();

	List<Today> getTodayList(PageInfo pageInfo, Map<String, String> name);

	int getMonthCount();

	List<Month> getMonthList(PageInfo pageInfo, Map<String, String> name);

	int getMonthMemCount();

	List<MonthMember> getMonthMemList(PageInfo pageInfo, Map<String, String> name);

	int getTodayMemCount();

	List<TodayMember> getTodayMemList(PageInfo pageInfo, Map<String, String> name);

	int productSave(Product product);

	Product findProductByNo(int no);

	int productUpdate(Product product);

	int getNoticeCount(Map<String, String> name);

	List<Notice> getNoticeList(PageInfo pageInfo, Map<String, String> name);

	int todaySave(Today today);

	int productImgsSave(ProductImgs productImgs);

	int monthSave(Month month);

	Today findTodayByNo(int no);

	int updateToday(Today today);

	Month findMonthByNo(int no);

	int updateMonth(Month month);

	int monthMemPoint(int no);

	int getOrderCountAll(Map<String, String> name);

	List<OrderSum> getOrderListAll(PageInfo pageInfo, Map<String, String> name);

	List<OrderDetail> getDetailList(int no);

	List<OrderDetail> findDetailByNo(int no);

	int orderDelivery(int no);

	int banMember(int no);

	int getOrderDeliveryCount(Map<String, String> name);

	List<OrderSum> getOrderDeliveryList(PageInfo pageInfo, Map<String, String> name);

	int getProInqCount(Map<String, String> name);

	List<ProductInquiry> getProInqList(PageInfo pageInfo, Map<String, String> name);

	int getApplicationCount();

	List<Application> getApplicationList(PageInfo pageInfo, String select);

	int updateApplication(int appNo);

	int biddingSave(ProductBidding productBidding);

	int cancelOrder(int no);

	int getOrderCancelCount(Map<String, String> name);

	List<OrderSum> getOrderCancelList(PageInfo pageInfo, Map<String, String> name);

	int getQnaCount(Map<String, String> name);

	List<Qna> getQnaList(PageInfo pageInfo, Map<String, String> name);

	int getQnaDoneCount(Map<String, String> name);

	List<Qna> getQnaDoneList(PageInfo pageInfo, Map<String, String> name);

	Qna findQnaByNo(int no);

	int answerQna(QnaAnswer qnaAnswer);

	ProductInquiry findProInqByNo(int no); 

	int answerProInq(ProInqAnswer proInqAnswer); 

	int updateProInq(int no); 
	
}
