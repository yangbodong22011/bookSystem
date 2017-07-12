package idao;

import model.User;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangbodong on 2017/7/11.
 */
public interface IUser {

    public boolean insert(User user);

    public boolean update(User user);

    public boolean delete(int user_id);

    public ArrayList<User> findUserAll();

    public User findUserByName(String user_name);

    public User findUserById(int user_id);
}
