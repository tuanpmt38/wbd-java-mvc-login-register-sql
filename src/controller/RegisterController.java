package controller;

import models.User;
import services.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegisterController", urlPatterns = "/register")
public class RegisterController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("register-submit")!= null){
            String firstname = request.getParameter("fist_name");
            String lastname = request.getParameter("last_name");
            String username = request.getParameter("txt_username");
            String password = request.getParameter("txt_password");

            User user = new User();
            user.setFirtname(firstname);
            user.setLastname(lastname);
            user.setUsername(username);
            user.setPassword(password);

            UserService registerdao = new UserService();
            String authorize = registerdao.authorizeRegister(user);

            if(authorize.equals("SUCCESS REGISTER")){
                request.setAttribute("RegiseterSuccessMsg",authorize);
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request,response);
            }else {
                request.setAttribute("RegisterErrorMsg", authorize);
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.include(request,response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
