package com.gzp.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.gzp.shopping.util.DB;

//javaBean与数据库中表的字段是一一对应的
//沿用javaBean的标准来写
//所有属性的首字母小写
//所有属性都是私有的
//可以通过getters&setters访问
public class User {
	private int id;
	private String username;
	private String password;
	private String phone;
	private String addr;
	private Timestamp rdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	
	public User() {}
	
	public User(String username, String password, String phone, String addr, Timestamp rdate) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.addr = addr;
		this.rdate = rdate;
	}
	
	public User(String username, String password, String phone, String addr) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.addr = addr;
		this.rdate = new Timestamp(System.currentTimeMillis());
	}
	
	public void save() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			
			conn = DB.getConn();
			String sql = "insert into ruser values(null,?,?,?,?,?)";
			pstmt = DB.getPStmt(conn, sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, phone);
			pstmt.setString(4, addr);
			pstmt.setTimestamp(5, rdate);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
	

}
