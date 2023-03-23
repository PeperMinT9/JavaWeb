package study.dao;

import db.DbConnect;
import study.dto.day0322_carDto;

import java.sql.*;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Vector;
import java.util.concurrent.Executor;

public class day0322_carDao {
    DbConnect db = new DbConnect();

    public List<day0322_carDto> getAllCars() {
        List<day0322_carDto> list = new Vector<>();
        Connection conn = db.getMysqlConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from mycar";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                list.add(new day0322_carDto(rs.getInt("num"),
                        rs.getString("carname"), rs.getInt("carprice"),
                        rs.getString("carphoto"), rs.getString("guipday")));
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

    public void insertCar(day0322_carDto dto) {
        Connection conn = db.getMysqlConnection();
        PreparedStatement pstmt = null;

        int num = dto.getNum();
        String carname = dto.getCarname();
        int carprice = dto.getCarprice();
        String carphoto = dto.getCarphoto();
        String guipday = dto.getGuipday();

        String sql = "insert into mycar values (null, '" +
                 carname + "', " + carprice + ", '" + carphoto +
                "', '" + guipday + "')";

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

    public void deleteCar(int num) {
        Connection conn = db.getMysqlConnection();
        PreparedStatement pstmt = null;

        String sql = "delete from mycar where num = " + num;

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
}
