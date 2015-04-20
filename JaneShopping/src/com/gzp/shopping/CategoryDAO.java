//和数据库打交道的一层
//作用在于， 今后数据库要是改了只需要改DAO这一层的程序， 其他程序不用改
package com.gzp.shopping;

import java.sql.*;
import java.util.*;

import com.gzp.shopping.util.DB;


public class CategoryDAO {
	
	public static void save(Category c) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{	
			
			conn = DB.getConn();
		
			String sql = "";
			if(c.getId() == -1) {
				sql = "insert into category values(null,?,?,?,?,?)";
			} else {
				sql = "insert into category values("+ c.getId() +" ,?,?,?,?,?)";
			}
			pstmt = DB.getPStmt(conn, sql);
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getDescr());
			pstmt.setInt(3, c.getPid());
			pstmt.setInt(4, c.isIsleaf()? 0:1);
			pstmt.setInt(5, c.getGrade());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	
	
	
	public static void getCategories(List<Category> list, int id) {
		Connection conn = null;
		ResultSet rs = null;
		try{	
			
			conn = DB.getConn();	
			String sql = "select * from category where pid = "+id;
			rs = DB.executeQuery(conn, sql);
			
			while( rs.next() ) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setIsleaf(rs.getInt("isleaf") == 0? true : false);
				c.setGrade(rs.getInt("grade"));
				list.add(c);
				if( !c.isIsleaf() ) {
					getCategories(list, c.getId());
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
	}
	
	
	public static void addChildCategory(int pid, String name, String descr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{				
			conn = DB.getConn();			
			conn.setAutoCommit(false);
			
			rs = DB.executeQuery(conn, "select * from category where id =" +pid);
			int parentGrade = 0;
			if ( rs.next() )
				parentGrade = rs.getInt("grade");
			
			//存储新的category
			Category c = new Category();
			String sql = "insert into category values(null, ?, ?, ?, ?, ?)";
			pstmt = DB.getPStmt(conn, sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, descr);
			pstmt.setInt(3, pid);
			pstmt.setInt(4, 0);
			pstmt.setInt(5, parentGrade + 1);
			pstmt.executeUpdate();
			
			//更新父节点leaf, 设置为非叶子几点
			DB.executeUpdate(pstmt, "update category set isleaf = 1 where id = "+pid);
			
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
	}



	public static Category loadById(int id) {
		Connection conn = null;
		Category c = null;
		ResultSet rs = null;
		try{				
			conn = DB.getConn();
			rs = DB.executeQuery(conn, "select * from category where id = "+id);
			if(rs.next()) {
				c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setIsleaf(rs.getInt("isleaf") == 0? true : false);
				c.setGrade(rs.getInt("grade"));
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
		return c;
	}
}
