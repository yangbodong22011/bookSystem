package idao;

import dao.PasswordDAO;
import dao.UserDAO;

/**
 * Created by yangbodong on 2017/7/11.
 */
public class DAOFactory {
    public static IUser createUserDAO() {
        return new UserDAO();
    }

    public static IPassword createPasswordDAO() {
        return new PasswordDAO();
    }
}
