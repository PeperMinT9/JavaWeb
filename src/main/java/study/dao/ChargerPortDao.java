package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DbConnect2;
import study.dto.ChargerPortDto;

public class ChargerPortDao {
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
	
	public void InsertChargerPort(ChargerPortDto dto) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into charger_port values (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getId());
			pstmt.setInt(2, dto.getPort_cnt());
			pstmt.setInt(3, dto.getPort_type_c());
			pstmt.setInt(4, dto.getPort_type_a());
			pstmt.setString(5, dto.getPort_info());
			
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// public void deleteChargerPort(int id) {
	// 	Connection conn = db.getMysqlConnection();
	// 	PreparedStatement pstmt = null;
		
	// 	String sql = "delete from charger_port where id=?";
		
	// 	try {
	// 		pstmt = conn.prepareStatement(sql);
			
	// 		pstmt.setInt(1, id);
			
	// 		pstmt.execute();
	// 	}
	// 	catch (SQLException e) {
	// 		e.printStackTrace();
	// 	}
	// 	finally {
	// 		db.dbClose(pstmt, conn);
	// 	}
	// }
	
	public void updateChargerPort(int id, int cnt, int typec, int typea, String str) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update charger_port set port_cnt=?, port_type_c=?, "
				+ "port_type_a=?, port_info=? where port_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cnt);
			pstmt.setInt(2, typec);
			pstmt.setInt(3, typea);
			pstmt.setString(4, str);
			pstmt.setInt(5, id);
			
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
