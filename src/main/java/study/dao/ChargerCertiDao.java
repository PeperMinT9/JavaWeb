package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DbConnect2;
import study.dto.ChargerCertiDto;

public class ChargerCertiDao {
	DbConnect2 db = new DbConnect2();
	int last_insert = -1;
	
	public int LastInsert() {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT LAST_INSERT_ID()";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			last_insert = Integer.parseInt(rs.getString("LAST_INSERT_ID()"));
			System.out.println(sql);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return last_insert;
	}
	
	public void InsertChargerCerti(ChargerCertiDto dto) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into charger_certi values (?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getId());
			pstmt.setString(2, dto.getCertification());
			
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void updateChargerCerti(int id, String str) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update charger_certi set certification=? where certi_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, str);
			pstmt.setInt(2, id);
			
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
}
