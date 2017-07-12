package dao;

import idao.DAOFactory;
import idao.IPassword;
import model.Password;
import model.User;
import util.DBUtil;

import java.sql.ResultSet;

/**
 * Created by yangbodong on 2017/7/11.
 */
public class PasswordDAO implements IPassword {

    public boolean insert(Password password) {
        return false;
    }

    public boolean update(Password password) {
        return false;
    }

    public boolean delete(int password_id) {
        return false;
    }

    public String findPasswordByName(String user_name) {
        return null;
    }

    public String findPasswordById(int user_id) {
        DBUtil db = null;
        ResultSet rst = null;
        String retStr = null;
        try {
            String sql = "select * from password Where user_id='" + user_id + "'";
            db = new DBUtil();
            if (!db.openConnection()) {
                System.out.print("fail to connect database");
                return null;
            }
            rst = db.execQuery(sql);
            if (rst != null) {
                while (rst.next()) {
                    retStr = rst.getString("password_content");
                }
                return retStr;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            /*一旦发生错误，保证数据库连接被关掉*/
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

    public boolean check(String user_name, String password_content) {
        try {
            UserDAO userDAO = (UserDAO) DAOFactory.createUserDAO();
            User user = userDAO.findUserByName(user_name);
            /*如果没有查询到此用户*/
            if (user.getUser_name() == null) {
                return false;
            }
            String passTemp = findPasswordById(user.getUser_id());
            if (passTemp == null) {
                return false;
            }
            if (!passTemp.equals(password_content)) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
