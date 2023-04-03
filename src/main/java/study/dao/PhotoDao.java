package study.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import db.DbConnect;
import study.dto.PhotoDto;

public class PhotoDao {
    DbConnect db = new DbConnect();

    public List<PhotoDto> getAllPhoto() {
        List<PhotoDto> list = new Vector<>();
        Connection conn = db.getMysqlConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from myphoto";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                list.add(new PhotoDto(rs.getString("photo_name"), rs.getInt("photo_price"),
                    rs.getString("photo_img"), rs.getString("pub_date")));
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
