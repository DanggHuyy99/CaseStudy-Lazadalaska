package controller;


import dao.CategoryDAO;
import dao.UserDAO;
import model.Role;
import model.User;
import serrvice.ProductService;
import serrvice.UserService;
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
    PasswordEncode passwordEncode = new PasswordEncode();
    private static final long serialVersionUID = 1L;

    private final ProductService productService = new ProductService();
    private final UserService userService = new UserService();


    private void showLoginPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login/login.jsp")
                .forward(req, resp);
    }

    @Override


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "login":
                login(request,response);
                break;
            case "createUser":
                createUser(request,response);
                break;
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            session.setAttribute("user", user);
            session.setAttribute("username", user.getUsername());


            request.setAttribute("username", user.getUsername());
            if (user.getRole() == Role.ADMIN) {
                response.sendRedirect("/admin/dashboard");
//                session.setAttribute("user",user);
                session.setAttribute("id",user.getId());
            } else if (user.getRole() == Role.USER) {

                response.sendRedirect("/products");
//                response.sendRedirect("/home.jsp");

            }
        } else {
            request.setAttribute("errors", "Mật khẩu sai");
            request.getRequestDispatcher("/login/login.jsp")
                    .forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "login":
                showLogin(req,resp);
                break;
            case "createUser":
                showCreateuser(req,resp);
                break;

        }

    }

    private void showLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login/login.jsp")
                .forward(req, resp);
    }

    private void showCreateuser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login/createuser.jsp")
                .forward(req, resp);

    }
    private void createUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        String enpass = PasswordEncode.encode(password);
        User user = new User(name,enpass,Role.USER);
        userService.createUser(user);
        req.setAttribute("user" , user);
        req.setAttribute("message", "đã đăng ký User thành công");
        req.getRequestDispatcher("/login/createuser.jsp").forward(req, resp);

    }

}