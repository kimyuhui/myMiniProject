package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.dto.sellList;

public class SellListRepository {
	
	
	private ArrayList<sellList> sellAllList = new ArrayList<sellList>();
	
	public SellListRepository() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_project", "mini", "mini123");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from selllist");
			
			while(rs.next()) {
				sellList sellList = new sellList();
				
				sellList.setSnackId(rs.getString("snackId"));
				sellList.setInventory(rs.getInt("inventory"));
				
				sellAllList.add(sellList);
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
			
		}
		
	}
	
	public ArrayList<sellList> getSellAllList() {
		return sellAllList;
	}

	public int getInventory(String snackId) {
		
		for(int i = 0; i < sellAllList.size(); i++) {
			sellList sell = sellAllList.get(i);
			
			if(sell.getSnackId().equals(snackId)) {
				return sell.getInventory();
			}
		}
		
		return -1;
	}
	
	
	public int updateInventory(String snackId, int quantity) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_project", "mini", "mini123");
			
			String sql = "update selllist set inventory = inventory - ? where snackId = ? and inventory >= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quantity);
			pstmt.setString(2, snackId);
			pstmt.setInt(3, quantity);
			
			int result = pstmt.executeUpdate();
			
			return result;
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return -1;
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}

	}
	
	
	
}
