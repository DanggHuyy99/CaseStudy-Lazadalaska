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
        //moi code ... dong 28
        //code dong 29
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        List<String> errorsValidate = new ArrayList<>();
//        if(password.length() < 8) {
//            errorsValidate.add("Mật khẩu không được nhỏ hơn 8 kí tự");
//        }
//        if (!ValidateUtil.validatePassword(password)){
//            errorsValidate.add("Phải chứa ít nhất một chữ số.\n" + "<br>" +
//                    "Phải chứa ít nhất một chữ cái viết thường.\n" + "<br>" +
//                    "Phải chứa ít nhất một chữ cái viết hoa.\n" + "<br>" +
//                    "Phải chứa ít nhất một trong các ký tự đặc biệt @, #, $, %, ^, &, +, =.\n" + "<br>" +
//                    "Không được chứa khoảng trắng.\n" + "<br>" +
//                    "Phải có ít nhất 8 ký tự.");
//        }
        if(errorsValidate.size() > 0) {
            request.setAttribute("errorsValidate", errorsValidate);
            request.getRequestDispatcher("login.jsp")
                    .forward(request,response);
        } else {
            User product = productService.findByUsername(username);
            //=> Không tìm thấy username thì thông báo không tìm thấy usernaem này

            //Có username này rồi thì sao??
            //Kiểm tra mật khẩu
            //Sai thì thông báo sai mật khẩu
            //Đúng thì về trang index

            if(product != null && PasswordEncode.check(password, product.getPassword())){
                HttpSession session = request.getSession();
                session.setAttribute("role", product.getRole());
                request.setAttribute("username", product.getUsername());
                if(product.getRole() == Role.ADMIN) {
                    response.sendRedirect("/admin");
                } else if(product.getRole() == Role.USER) {
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
//            response.sendRedirect("/login");
                return;
            } else {
                request.setAttribute("errors", "Login Failed");
                request.getRequestDispatcher("login.jsp")
                        .forward(request,response);
            }
        }



    }
}