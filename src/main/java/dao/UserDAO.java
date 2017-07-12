package dao;

import idao.DAOFactory;
import idao.IUser;
import model.User;
import util.DBUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangbodong on 2017/7/11.
 */
public class UserDAO implements IUser {

    public boolean insert(User user) {
        return false;
    }

    public boolean update(User user) {
        return false;
    }

    public boolean delete(int user_id) {
        return false;
    }

    public ArrayList<User> findUserAll() {
        return null;
    }

    public User findUserByName(String user_name) {
        DBUtil db = null;
        User user = new User();
        ResultSet rst = null;
        try {
            String sql = "select * from user where user_name='" + user_name + "';";
            db = new DBUtil();
            if (!db.openConnection()) {
                System.out.print("fail to connect database");
                return null;
            }
            rst = db.execQuery(sql);
            if (rst != null) {
                while (rst.next()) {
                    user.setUser_id(rst.getInt("user_id"));
                    user.setUser_name(rst.getString("user_name"));
                    user.setUser_grade(rst.getString("user_grade"));
                    user.setUser_mail(rst.getString("user_mail"));
                }
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rst != null) {
                    db.close(rst);
                }
                if (db != null) {
                    db.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public User findUserById(int user_id) {
        return null;
    }
}
