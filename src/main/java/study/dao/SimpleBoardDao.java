package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.SimpleBoardDto;

public class SimpleBoardDao {
	DbConnect db = new DbConnect();
	
	// all select
	public List<SimpleBoardDto> getAll() {
		List<SimpleBoardDto> list = new Vector<>();
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboard";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new SimpleBoardDto(rs.getInt("num"), rs.getString("writer"), rs.getString("subject"), 
						rs.getString("content"), rs.getString("photo"), rs.getInt("readcount"),
						rs.getTimestamp("writeday")));
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
	
	// readcount increase
	public void updateReadCount(int num) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update simpleboard set readcount = readcount + 1 where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setInt(1, num);
			
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// insert
	public void insertBoard(SimpleBoardDto dto) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into simpleboard (writer, subject, content, photo) "
				+ "values ('" + dto.getWriter() + "', '" + dto.getSubject() +
				"', '" + dto.getContent() + "', '" + dto.getPhoto() + "')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// detail veiw
	public SimpleBoardDto getData(int num) {
		SimpleBoardDto dto = null;
		
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboard where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new SimpleBoardDto(rs.getInt("num"), rs.getString("writer"), rs.getString("subject"), 
						rs.getString("content"), rs.getString("photo"), rs.getInt("readcount"),
						rs.getTimestamp("writeday"));
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
	
	// delete
	public void deleteBoard(int num) {
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		
		String sql = "delete from simpleboard where num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setInt(1, num);
			pstmt.execute();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// update
	public void updateBoard(SimpleBoardDto dto) {
		Connection conn = db.getMysqlConnection();
		Statement stmt = null;
		
		String sql = "update simpleboard set writer='" + dto.getWriter() + "', subject='"
				+ dto.getSubject() + "', content='" + dto.getContent() + "', photo='" +dto.getPhoto() +
				"' where num=" + dto.getNum();
		System.out.println(sql);
		
		String sql2 = "update simpleboard set writer='" + dto.getWriter() + "', subject='"
				+ dto.getSubject() + "', content='" + dto.getContent() +
				"' where num=" + dto.getNum();
		
		try {
			stmt = conn.createStatement();
			if(dto.getPhoto() == null) 
				stmt.execute(sql2); // photo 수정 안함
			else
				stmt.execute(sql);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
