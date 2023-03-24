package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;
import study.dto.PersonDto;

import db.DbConnect;

public class PersonDao {
	DbConnect db = new DbConnect();
	Scanner sc = new Scanner(System.in);
	
	public void insertPerson(PersonDto dto) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into person values (null, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getBirthyear());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getJob());
			pstmt.setString(5, dto.getPhoto());
			
			// 실행
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void deletePerson(int num) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from person where num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setInt(1, num);
			
			// 실행
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public PersonDto getData(int num) {
		PersonDto dto = new PersonDto();
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from person where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setInt(1, num);
			// 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setBirthyear(rs.getInt("birthyear"));
				dto.setAddress(rs.getString("address"));
				dto.setJob(rs.getString("job"));
				dto.setPhoto(rs.getString("photo"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return dto;
	}
	
	public void updatePerson(PersonDto dto) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		String sql = "update person set name=?, birthyear=?, address=?, photo=?, job=? where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
//			String name = sc.nextLine();
//			String birthday = sc.nextLine();
//			String address = sc.nextLine();
//			String photo = sc.nextLine();
//			String job = sc.nextLine();
//			int num = Integer.parseInt(sc.nextLine());
//			
//			pstmt.setString(1, name);
//			pstmt.setString(2, birthday);
			
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getBirthyear());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getPhoto());
			pstmt.setString(5, dto.getJob());
			pstmt.setInt(6, dto.getNum());
			
			
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<PersonDto> getAllPerson() {
		List<PersonDto> list = new Vector<>();
		Connection conn = db.getMysqlConnection();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from person";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {				
				PersonDto dto = new PersonDto();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setBirthyear(rs.getInt("birthyear"));
				dto.setAddress(rs.getString("address"));
				dto.setJob(rs.getString("job"));
				dto.setPhoto(rs.getString("photo"));
				list.add(dto);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
}