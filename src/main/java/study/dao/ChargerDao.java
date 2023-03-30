package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.mysql.cj.protocol.Resultset;

import db.DbConnect2;
import study.dto.ChargerDto;

public class ChargerDao {
	DbConnect2 db = new DbConnect2();
	
	public List<ChargerDto> getAllCharger() {
		List<ChargerDto> list = new Vector<>();
		
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select charger.id as id, name, max_watt, img_src, port_cnt, port_type_c, port_type_a, port_info, certification from charger \r\n"
				+ "join charger_port on charger.id = charger_port.port_id\r\n"
				+ "join charger_certi on charger.id = charger_certi.certi_id";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int id = Integer.parseInt(rs.getString("id"));
				String name = rs.getString("name");
				int max_watt = Integer.parseInt(rs.getString("max_watt"));
				String img_src = rs.getString("img_src");
				int port_cnt = Integer.parseInt(rs.getString("port_cnt"));
				int port_type_c = Integer.parseInt(rs.getString("port_type_c"));
				int port_type_a = Integer.parseInt(rs.getString("port_type_a"));
				String port_info = rs.getString("port_info");
				String port_certi = rs.getString("certification");
				list.add(new ChargerDto(id, name, max_watt, img_src, port_cnt, port_type_c, port_type_a, port_info, port_certi));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public List<ChargerDto> getAllCharger(String extra) {
		List<ChargerDto> list = new Vector<>();
		
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select charger.id as id, name, max_watt, img_src, port_cnt, port_type_c, port_type_a, port_info, certification from charger "
				+ "join charger_port on charger.id = charger_port.port_id "
				+ "join charger_certi on charger.id = charger_certi.certi_id where "
				+ extra;
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int id = Integer.parseInt(rs.getString("id"));
				String name = rs.getString("name");
				int max_watt = Integer.parseInt(rs.getString("max_watt"));
				String img_src = rs.getString("img_src");
				int port_cnt = Integer.parseInt(rs.getString("port_cnt"));
				int port_type_c = Integer.parseInt(rs.getString("port_type_c"));
				int port_type_a = Integer.parseInt(rs.getString("port_type_a"));
				String port_info = rs.getString("port_info");
				String port_certi = rs.getString("certification");
				list.add(new ChargerDto(id, name, max_watt, img_src, port_cnt, port_type_c, port_type_a, port_info, port_certi));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public List<ChargerDto> getOnlyCharger() {
		List<ChargerDto> list = new Vector<>();
		
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from charger";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int id = Integer.parseInt(rs.getString("id"));
				String name = rs.getString("name");
				int max_watt = Integer.parseInt(rs.getString("max_watt"));
				String img_src = rs.getString("name");
				
				list.add(new ChargerDto(id, name, max_watt, img_src));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public int getLastId() {
		List<ChargerDto> list = new Vector<>();
		int latest_id = -1;
		
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from charger order by id desc limit 1";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			latest_id = Integer.parseInt(rs.getString("id"));
//			while(rs.next()) {
//				int id = Integer.parseInt(rs.getString("id"));
//				String name = rs.getString("name");
//				int max_watt = Integer.parseInt(rs.getString("max_watt"));
//				String img_src = rs.getString("name");
//				
//				list.add(new ChargerDto(id, name, max_watt, img_src));
//			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return latest_id;
	}
	
	public void insetCharger(ChargerDto dto) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into charger values (null, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getMax_watt());
			pstmt.setString(3, dto.getImg_src());
			
			
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}

	public void deleteCharger(int id) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from charger where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, id);
			
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void updateCharger(int id, String name, int max_watt, String img_src) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		String sql = "update charger set name=?, max_watt=?, img_src=? where id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setInt(2, max_watt);
			pstmt.setString(3, img_src);
			pstmt.setInt(4, id);
			
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
