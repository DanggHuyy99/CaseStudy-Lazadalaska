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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showLoginPage(req,resp);
                break;
        }
    }

    private void showLoginPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login/login.jsp")
                .forward(req, resp);
    }

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

        HttpSession session = request.getSession();
        if (PasswordEncode.check(password, user.getPassword())) {

            session.setAttribute("role", user.getRole());
            request.setAttribute("username", user.getUsername());
            if (user.getRole() == Role.ADMIN) {
                response.sendRedirect("/admin/dashboard");
                session.setAttribute("user",user);
                session.setAttribute("id",user.getId());
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