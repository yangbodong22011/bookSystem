package servlet;

import dao.PasswordDAO;
import idao.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Created by yangbodong on 2017/7/11.
 */
@WebServlet(name = "login", urlPatterns = "/login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("user_name");
        String password = request.getParameter("password_content");
        request.getSession().setAttribute("login", null);
        request.getSession().setAttribute("actor", null);

        System.out.println(username + ":" + password);
        if (null == username || null == password || username.length() < 1 || password.length() < 1) {
            request.setAttribute("reason", "用户名或密码不能为空");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            PasswordDAO passwordDAO = (PasswordDAO) DAOFactory.createPasswordDAO();
            if (passwordDAO.check(username, password)) {

                /*正常登陆之后可以在Session中保存登录信息*/
                request.setAttribute("reason", "登录成功");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("reason", "用户名或密码错误");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
