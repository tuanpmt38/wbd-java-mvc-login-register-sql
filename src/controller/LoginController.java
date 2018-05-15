package controller;

import models.User;
import services.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginController",urlPatterns = "/login")
public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("login-submit")!=null){
            String username = request.getParameter("txt_username");
            String password = request.getParameter("txt_password");

            User user = new User();
            user.setUsername(username);
            user.setPassword(password);

            UserService userService = new UserService();
            String authorize = userService.authorizetion(user);

            if(authorize.equals("SUCCESS LOGIN")){
                HttpSession session = request.getSession();
                session.setAttribute("login",user.getUsername());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("welcome.jsp");
                requestDispatcher.forward(request,response);
            }else{
                request.setAttribute("error",authorize);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.include(request,response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
