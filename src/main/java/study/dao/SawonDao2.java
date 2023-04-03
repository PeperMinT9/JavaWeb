package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.SawonDto;

public class SawonDao2 {
DbConnect db = new DbConnect();
	
	public List<SawonDto> getSelected(int num) {
		List<SawonDto> list = new Vector<>();
		Connection conn = db.getMysqlConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		if (num == 1) {
			sql = "select * from sawon";
		}
		else if (num == 2 ) {
			sql = "select * from sawon where gender = '남자'";
		}
		else {
			sql = "select * from sawon where gender = '여자'";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SawonDto dto = new SawonDto();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setScore(rs.getInt("score"));
				dto.setGender(rs.getString("gender"));
				dto.setBuseo(rs.getString("buseo"));
				
				list.add(dto);
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
}
