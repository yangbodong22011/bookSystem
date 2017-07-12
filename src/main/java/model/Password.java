package model;

/**
 * Created by yangbodong on 2017/7/11.
 */
public class Password {
    private int password_id;
    private int user_id;
    private String password_content;

    public int getPassword_id() {
        return password_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getPassword_content() {
        return password_content;
    }

    public void setPassword_id(int password_id) {
        this.password_id = password_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setPassword_content(String password_content) {
        this.password_content = password_content;
    }
}
