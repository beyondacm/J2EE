package com.gzp.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gzp.shopping.Category;
import com.gzp.shopping.Product;
import com.gzp.shopping.util.DB;
import com.sun.org.apache.bcel.internal.generic.NEWARRAY;


//给product和productManager提供服务
//ProductManager相当于ProductDAO的一个客户

public class ProductMySQLDAO implements ProductDAO{
	
	public List<Product> getProducts() {
		
		Connection conn = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		
		try{				
			conn = DB.getConn();
			String sql = "select * from product";
			rs = DB.executeQuery(conn, sql);
			while(rs.next()) {
				Product p = new Product();
//				System.out.println(rs.getInt("id"));
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setpDate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				list.add(p);
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
		return list;
	}
	
	public List<Product> getProducts(int pageNo, int pageSize) {
		
		Connection conn = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		
		try{				
			conn = DB.getConn();
			String sql = "select * from product limit " + (pageNo-1)*pageSize + "," +pageSize;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()) {
				Product p = new Product();
//				System.out.println(rs.getInt("id"));
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setpDate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				list.add(p);
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
		return list;

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
		Connection conn = null;
		ResultSet rs = null;
		List<Product> list = new ArrayList<Product>();
		
		try{				
			conn = DB.getConn();
			String sql = "select * from product where 1=1";
			
			String strId = "";
			if(categoryId != null && categoryId.length > 0) {
				strId = "(";
				for(int i=0; i<categoryId.length ; i++) {
					if(i < categoryId.length -1) {
						strId = categoryId[i] + ",";
					} 	
				}
				strId += ")";
				sql = " and categoryid in " + strId;
			}
			
			if(keyWord != null && !keyWord.trim().equals("")) {
				sql += " and name like '%" +keyWord +"%' or descr like '%" +keyWord + "%'" ;
			}
 			
			rs = DB.executeQuery(conn, sql);
			while(rs.next()) {
				Product p = new Product();
//				System.out.println(rs.getInt("id"));
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setpDate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				list.add(p);
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
		return list;
	
	}
	
	public List<Product> findProducts(String name) {
		return null;
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

	@Override
	public boolean addProduct(Product p) {
		
//		System.out.println(p.getMemberPrice());
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{				
			conn = DB.getConn();
			String sql = "insert into product values (null, ?,?,?,?,?,?)";
			pstmt = DB.getPStmt(conn, sql);
			
			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getDescr());
			pstmt.setDouble(3, p.getNormPrice());
			pstmt.setDouble(4, p.getMemberPrice());
			pstmt.setTimestamp(5, p.getpDate());
			pstmt.setInt(6, p.getCategoryId());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
			return false;
		} finally {
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
		return true;
		
	}

	@Override
	public int getProducts(List<Product> products, int pageNo, int pageSize) {
		
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int pageCount = 0;		
		try{				
			conn = DB.getConn();
			
			rsCount = DB.executeQuery(conn, "select count(*) from product");
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize -1) / pageSize;
			
			System.out.println(pageCount);
			
			String sql = "select * from product limit " + (pageNo-1)*pageSize + "," +pageSize;
			rs = DB.executeQuery(conn, sql);
			
			while(rs.next()) {
				Product p = new Product();
//				System.out.println(rs.getInt("id"));
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setpDate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				products.add(p);
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DB.closeResultSet(rs);
			DB.closeResultSet(rsCount);
			DB.closeConn(conn);
		}
		
		return pageCount;
	}
}
