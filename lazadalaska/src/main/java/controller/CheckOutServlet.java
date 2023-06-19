package controller;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "checkOutServlet", urlPatterns = "/checkout")
public class CheckOutServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        User user = (User) session.getAttribute("user");
        if (user == null) {
            req.setAttribute("errors", "Vui lòng đăng nhập để thanh toán!");
            req.getRequestDispatcher("/login/login.jsp").forward(req, resp);
        } else {
            // tạo trang thanh toán: checkout.jsp
            //tạo class cart và cartItem để quản lý giỏ hàng
            req.getRequestDispatcher("/Checkout.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    public void destroy() {

    }
}
