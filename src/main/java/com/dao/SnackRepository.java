package com.dao;

import java.sql.*;
import java.util.ArrayList;

import com.dto.Snack;

public class SnackRepository {

	private ArrayList<Snack> snackList = new ArrayList<Snack>();

	public SnackRepository() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mini_project", "mini", "mini123");
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM snacklist");

			while(rs.next()) {
				Snack snack = new Snack();

				snack.setSnackId(rs.getString("snackId"));
				snack.setSnackName(rs.getString("snackName"));
				snack.setSnackCompany(rs.getString("snackCompany"));
				snack.setSnackKcal(rs.getInt("snachKcal"));
				snack.setSnackIngredients(rs.getString("snackIngredients"));
				snack.setSnackPrice(rs.getInt("price"));
				snack.setSnackImg(rs.getString("snackImage"));
				snack.setSnackDescription(rs.getString("description"));
				snack.setSnackImg2(rs.getString("snackImage2"));

				snackList.add(snack);
			}
			
		} catch (Exception e) {
			System.out.println("오류 발생");
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}

	public ArrayList<Snack> getSnackList() {
		return snackList;
	}
	
	
	public Snack getSnackInfo(String snackId) {
		Snack snack = new Snack();
		
		for(Snack s : snackList) {
			if(s.getSnackId() != null && s.getSnackId().equals(snackId)) {
				snack = s;
			}
		}
		
		return snack;
	}
	
	
	
}



