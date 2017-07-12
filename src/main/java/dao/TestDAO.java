package dao;

import util.ConnectionManager;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by yangbodong on 2017/7/10.
 */
public class TestDAO {

    public static void testSQL(String user_name) {
        String sql = "select * from user where user_name='"+ user_name + "'";

        System.out.println(sql);
    }

    public static void main(String[] args) throws Exception{
        testSQL("yang");

//        Connection conn = ConnectionManager.getInstance().getConnection();
//        ResultSet rs = null;
//
//        String sql = "select * from log";
//        PreparedStatement ps = conn.prepareStatement(sql);
//        rs = ps.executeQuery();
//        System.out.println(rs);

//        String sql = "select * from user";
//        DBUtil db = new DBUtil();
//        if(!db.openConnection()) {
//            System.out.println("connect error");
//        }
//        ResultSet rst = null;
//            try {
//                rst = db.execQuery(sql);
//            }catch (Exception e) {
//
//            }
//            if(rst != null) {
//                while(rst.next()) {
//                    System.out.println(rst.getString("user_name"));
//                }
//            }
//            db.close(rst);
//            db.close();
    }
}
