package controller;


import model.Role;
import model.User;
import serrvice.ProductService;
import util.PasswordEncode;
import util.ValidateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = productService.findByUsername(username);
        if (user == null) {
            request.setAttribute("errors", "Tài khoản không đúng hoặc không tồn tại");
            request.getRequestDispatcher("/login/login.jsp")
                    .forward(request, response);
            return;
        }

        if (PasswordEncode.check(password, user.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("role", user.getRole());
            request.setAttribute("username", user.getUsername());
            if (user.getRole() == Role.ADMIN) {
                response.sendRedirect("/admin");
            } else if (user.getRole() == Role.USER) {
                request.getRequestDispatcher("/products").forward(request, response);
//                response.sendRedirect("/home.jsp");
            }
        } else {
            request.setAttribute("errors", "Mật khẩu sai");
            request.getRequestDispatcher("/login/login.jsp")
                    .forward(request, response);
        }
    }
}