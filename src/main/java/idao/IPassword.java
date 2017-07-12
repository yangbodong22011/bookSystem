package idao;

import model.Password;

/**
 * Created by yangbodong on 2017/7/11.
 */
public interface IPassword {

    public boolean insert(Password password);

    public boolean update(Password password);

    public boolean delete(int password_id);

    public String findPasswordById(int user_id);

    public String findPasswordByName(String user_name);

    public boolean check(String user_name, String password_content);

}
