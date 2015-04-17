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
			String sql = "insert into category values(?,?,?,?,?,?)";
			pstmt = DB.getPStmt(conn, sql);
			pstmt.setInt(1, c.getId());
			pstmt.setString(2, c.getName());
			pstmt.setString(3, c.getDescr());
			pstmt.setInt(4, c.getPid());
			pstmt.setInt(5, c.isIsleaf()? 0:1);
			pstmt.setInt(5, c.getGrade());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
}
