package com.kh.earth.store.model.service;

import java.util.List;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.vo.Cart;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.kh.earth.store.model.vo.ProductOption;
import com.kh.earth.store.model.vo.Wish;

public interface StoreService {

	int getProductCount();

	List<Product> getProductList(PageInfo pageInfo, String arrange);

	int getProductCount(String category);

	int getProductCount(List<String> detail);

	List<Product> getProductListByCategory(PageInfo pageInfo, String category);

	List<Product> getProductListByDetail(PageInfo pageInfo, List<String> detail);

	List<Product> getProductListByCategory(PageInfo pageInfo, String category, String arrange);

	List<Product> getProductListByDetail(PageInfo pageInfo, List<String> detail, String arrange);

	Product findProductByNo(int no);

	List<ProductOption> findProductOption(int no);

	int addCart(Cart cart);

	List<Cart> getCartList(int no);

	String getProductNameByNo(int productNo);

	int addWish(Wish wish);

	int getWish(Wish wish);

	int updateWish(Wish wish);

	String getWishStat(Wish wish);
	
	int getWishCount(int no);

	List<Product> getWishList(PageInfo pageInfo, int no);

	int writeQna(ProductInquiry productInquiry);

	List<ProductInquiry> getProductInqList(PageInfo inqPageInfo, int no);

	int getProductInqCount(int no);





	
	
}
