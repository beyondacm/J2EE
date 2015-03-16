package com.gzp.shopping;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gzp.shopping.util.DB;

//管理User类

public class UserManager {
	public static List<User> getUsers() {
		List<User> list = new ArrayList<User>();
		//通过数据库拿到所有的user
		Connection conn = null;
		//ResultSet，数据库结果集的数据表，通常通过执行查询数据库的语句生成
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from ruser";
			rs = DB.executeQuery(conn, sql);
			while(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeResultSet(rs);
		}
		return list;
	}
	
	
	public static void deleteUser(int id) {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			stmt.executeUpdate("delete from ruser where id = "+id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
	}
}
