package com.gzp.shopping;

import java.util.Date;
import java.util.List;

import com.gzp.shopping.dao.*;;


//管理product的类， 提供一系列管理product的方法
public class ProductManager {
	
	private static ProductManager pm = null;
	private int pageCount = 0;
	ProductDAO dao = null;
	
	static {
		if(pm == null) {
			pm = new ProductManager();
			pm.setDao(new ProductMySQLDAO());
		}
	}
	
	//单例模式
	private ProductManager() {}
	
	public static ProductManager getInstance() {
		return pm;
	}


	public List<Product> getProducts() {
		return dao.getProducts();
	}
	
	public List<Product> getProducts(int pageNo, int pageSize) {
		return dao.getProducts(pageNo, pageSize); 
	}
	
	/**
	 * 
	 * @param products
	 * @param pageSize
	 * @param pageSize
	 * @return page counts of the spoecified pageSize
	 */ 
	public int getProducts(List<Product> products, int pageNo, int pageSize) {
		return dao.getProducts(products, pageNo, pageSize);
	}
	
	public List<Product> findProducts(int[] categoryId, 
									  String keyWord,
									  double lowNormalPrice, 
									  double highNormalPrice,
									  double lowMemberPrice,
									  double highMemberPrice,
									  Date startDate,
									  Date endDate,
									  int PageNo,
									  int PageSize) {
		return dao.findProducts(categoryId, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, PageNo, PageSize);
	
	}
	
	
	public boolean deleteProductByCategoryId(int categoryId) {
		return false;
	}
	
	public boolean deleteProductsById(int[] idArray) {
		return false;
	}
	
	public boolean updateProduct(Product p) {
		return false;
	}
	
	public ProductDAO getDao() {
		return dao;
	}

	public void setDao(ProductDAO dao) {
		this.dao = dao;
	}
	
	public boolean addProduct(Product p) {
		System.out.println(p.getMemberPrice());
		return dao.addProduct(p);
	}
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
}
