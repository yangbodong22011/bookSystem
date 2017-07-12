package model;

/**
 * Created by yangbodong on 2017/7/11.
 */
public class User {
    private int user_id;
    private String user_name;
    private String user_grade;
    private String user_mail;

    public int getUser_id() {
        return user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getUser_grade() {
        return user_grade;
    }

    public String getUser_mail() {
        return user_mail;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public void setUser_grade(String user_grade) {
        this.user_grade = user_grade;
    }

    public void setUser_mail(String user_mail) {
        this.user_mail = user_mail;
    }
}
