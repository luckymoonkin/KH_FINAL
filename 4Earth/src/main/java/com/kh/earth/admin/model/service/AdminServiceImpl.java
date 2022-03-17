package com.kh.earth.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.admin.model.dao.AdminMapper;
import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.admin.model.vo.Reported;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.store.model.vo.OrderDetail;
import com.kh.earth.store.model.vo.OrderSum;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductBidding;
import com.kh.earth.store.model.vo.ProductImgs;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.twilio.rest.api.v2010.account.Application;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int getReportCount(Map<String, String> name) {
		
		return mapper.getReportCount(name);
	}

	@Override
	public List<Report> getReportList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getReportList(rowBounds, name);
	}
	
	@Override
	public int deleteReport(int no) {
		
		return mapper.deleteReport(no);
	}
	
	@Override
	public int deleteMember(int no) {
		
		return mapper.deleteMember(no);
	}
	
	@Override
	public int getMemberCount(Map<String, String> name) {
		
		return mapper.getMemberCount(name);
	}
	
	@Override
	public List<Member> getMemberList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findMember(rowBounds, name);
	}
	
	@Override
	public int getProductCount(Map<String, String> name) {
		
		return mapper.getProductCount(name);
	}

	@Override
	public List<Product> getProductList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getProductList(rowBounds, name);
	}

	@Override
	public List<Reported> getReportedList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getReportedList(rowBounds, name);
	}

	@Override
	public Report getReportDetail(int no) {
		
		return mapper.getReportDetail(no);
	}

	@Override
	public int getReportedCount() {
		
		return mapper.getReportedCount();
	}

	@Override
	public int getTodayCount() {
		
		return mapper.getTodayCount();
	}

	@Override
	public List<Today> getTodayList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getTodayList(rowBounds, name);
	}

	@Override
	public int getMonthCount() {
		
		return mapper.getMonthCount();
	}

	@Override
	public List<Month> getMonthList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getMonthList(rowBounds, name);
	}

	@Override
	public int getMonthMemCount() {

		return mapper.getMonthMemCount();
	}

	@Override
	public List<MonthMember> getMonthMemList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getMonthMemList(rowBounds, name);
	}

	@Override
	public int getTodayMemCount() {
		
		return mapper.getTodayMemCount();
	}

	@Override
	public List<TodayMember> getTodayMemList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getTodayMemList(rowBounds, name);
	}

	@Override
	@Transactional
	public int productSave(Product product) {
		int result = 0;
		
		result = mapper.insertProduct(product);
		
		return result;
	}

	@Override
	@Transactional
	public int productUpdate(Product product) {
		int result = 0;
		
		result = mapper.updateProduct(product);
		
		return result;
	}
	
	@Override
	public Product findProductByNo(int no) {
		
		return mapper.findProductByNo(no);
	}

	@Override
	public int getNoticeCount(Map<String, String> name) {
		
		return mapper.getNoticeCount(name);
	}

	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getNoticeList(rowBounds, name);
	}

	@Override
	public int todaySave(Today today) {
		int result = 0;
		
		result = mapper.insertToday(today);
		
		return result;
	}

	@Override
    public int productImgsSave(ProductImgs productImgs) {

        return mapper.productImgsSave(productImgs);
    }

	@Override
	public int monthSave(Month month) {
		int result = 0;
		
		result = mapper.insertMonth(month);
		
		return result;
	}

	@Override
	public Today findTodayByNo(int no) {
		
		return mapper.findTodayByNo(no);
	}

	@Override
	public int updateToday(Today today) {
		int result = 0;
		
		result = mapper.updateToday(today);
		
		return result;
	}

	@Override
	public Month findMonthByNo(int no) {

		return mapper.findMonthByNo(no);
	}

	@Override
	public int updateMonth(Month month) {
		int result = 0;
		
		result = mapper.updateMonth(month);
		
		return result;
	}

	@Override
	public int monthMemPoint(int no) {
		int result = 0;
		
		result = mapper.monthMemPoint(no);
		
		return result;
	}

	@Override
	public int getOrderCountAll(Map<String, String> name) {
		
		return mapper.getNoticeCount(name);
	}

	@Override
	public List<OrderSum> getOrderListAll(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getOrderListAll(rowBounds, name);
	}

	@Override
	public List<OrderDetail> getDetailList(int no) {
		
		return mapper.getDetailList(no);
	}

	@Override
	public List<OrderDetail> findDetailByNo(int no) {
		
		return mapper.findDetailByNo(no);
	}

	@Override
	public int orderDelivery(int no) {
		int result = 0;
		
		result = mapper.orderDelivery(no);
		
		return result;
	}

	@Override
	public int banMember(int no) {
		
		return mapper.banMember(no);
	}

	@Override
	public int getOrderDeliveryCount(Map<String, String> name) {
		
		return mapper.getOrderDeliveryCount(name);
	}

	@Override
	public List<OrderSum> getOrderDeliveryList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getOrderDeliveryList(rowBounds, name);
	}

	@Override
	public int getProInqCount(Map<String, String> name) {
		
		return mapper.getProInqCount(name);
	}

	@Override
	public List<ProductInquiry> getProInqList(PageInfo pageInfo, Map<String, String> name) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getProInqList(rowBounds, name);
	}

	@Override
    public int getApplicationCount() {

        return mapper.getApplicationCount();
    }

    @Override
    public List<Application> getApplicationList(PageInfo pageInfo, String select) {
        int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
        int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);

        return mapper.getApplicationList(rowBounds, select);
    }

    @Override
    public int biddingSave(ProductBidding productBidding) {

        return mapper.biddingSave(productBidding);
    }

    @Override
    public int updateApplication(int appNo) {

        return mapper.updateApplication(appNo);
    }

}
