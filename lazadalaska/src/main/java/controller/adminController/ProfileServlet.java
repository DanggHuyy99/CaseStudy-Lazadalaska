package controller.adminController;

import model.User;
import serrvice.ProfileService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProfileServlet", urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {
    private ProfileService profileService = new ProfileService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "password":
                showEditPassWord(req, resp);
                break;
            case "edit":
                showEditProfile(req, resp);
                break;
            case "myProfile":
                showMyProfile(req, resp);
                break;
            default:
                showProfile(req, resp);
                break;
        }
    }

    private void showMyProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = profileService.findById(id);
        List<User> users = new ArrayList<>();
        users.add(user);
        req.setAttribute("users", users);
        req.getRequestDispatcher("/admin/profileuser.jsp").forward(req, resp);
    }

    private void showEditPassWord(HttpServletRequest req, HttpServletResponse resp) {
//        int id = Integer.parseInt(req.getParameter("id"));
//        User user = profileService.
    }

    private void showEditProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        // lấy customer có id bằng với id trong parameter;
        // gửi customer qua bên edit.jsp;
        // điều hướng tới trang edit.jsp;
        User user = profileService.findById(id);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/admin/editprofile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "edit":
                editProfile(req, resp);
                break;
            case "password":
                editPassWord(req, resp);
                break;
            default:
                showProfile(req, resp);
                break;
        }
    }

    private void editPassWord(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String passsWord = req.getParameter("password");
        User user = new User(id, passsWord);
        profileService.updatePassWord(user);
        req.setAttribute("user", user);
        req.setAttribute("message", "updated");
        req.getRequestDispatcher("/admin/editpassword").forward(req, resp);

    }

    private void editProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String img = req.getParameter("img");
        User user = new User(id, email, fullname, phone, address, img);
        profileService.updateProfile(user);
        req.setAttribute("user", user);
        req.setAttribute("message", "edited");
        req.getRequestDispatcher("/admin/editprofile.jsp").forward(req, resp);
    }

    private void showProfile(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

//        // Truy xuất thông tin user từ HttpSession
//        HttpSession session = req.getSession();
//        User user = (User) session.getAttribute("user");

//        req.setAttribute("user", user);
//        req.getRequestDispatcher("/admin/profile.jsp").forward(req, resp);
//        if (user == null) {
//            resp.sendRedirect(req.getContextPath() + "/login");
//            return;
//        }
        List<User> users = profileService.findAll();
        req.setAttribute("users", users);
        req.getRequestDispatcher("/admin/profile.jsp").forward(req, resp);
    }
}




