package study.day0321;

import java.sql.*;
import java.util.List;
import java.util.Vector;

import db.DbConnect;

public class PersonDao {
	DbConnect db = new DbConnect();
	
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
				list.add(new PersonDto(rs.getString("name"), rs.getInt("birthyear"),
						rs.getString("address"), rs.getString("job"), rs.getString("photo")));
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
	
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//
//	}
}
