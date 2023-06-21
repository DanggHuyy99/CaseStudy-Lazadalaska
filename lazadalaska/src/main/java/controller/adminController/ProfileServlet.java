package controller.adminController;

import model.Category;
import model.Product;
import model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import serrvice.ProfileService;
import sun.java2d.cmm.Profile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
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
        req.setAttribute("user", user);
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
        User user = new User();
        User olduser = new User();
        try {
            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            sf.setHeaderEncoding("UTF-8");
            List<FileItem> multifiles = sf.parseRequest(req);


            for (FileItem item : multifiles) {
                if (item.isFormField()) {
                    String fieldname = item.getFieldName();
                    String fieldvalue = item.getString("UTF-8");

                    switch (fieldname) {
                        case "id":
                            olduser = profileService.findById(Integer.parseInt(fieldvalue));
                            break;
                        case "email":
                            user.setEmail(fieldvalue);
                            break;
                        case "fullname":
                            user.setFullname(fieldvalue);
                            break;
                        case "phone":
                            user.setPhone(fieldvalue);
                            break;
                        case "address":
                            user.setAddress(fieldvalue);
                            break;
                    }

                } else {
                    // Process form file field (input type="file").
                    if (!item.getName().isEmpty() && !item.getFieldName().equals("files")) {
                        String filename = FilenameUtils.getName(item.getName());
                        user.setImg("/assets/img/" + filename);
                        item.write(new File("D:\\clone\\CaseStudy-Lazadalaska\\lazadalaska\\src\\main\\webapp\\assets\\img\\"
                                + filename));
                    }
                }
            }

            olduser.setAddress(user.getAddress());
            olduser.setPhone(user.getPhone());
            olduser.setEmail(user.getEmail());
            olduser.setImg(user.getImg());
            olduser.setFullname(user.getFullname());
            profileService.updateProfile(olduser);

            req.setAttribute("user", olduser);
            req.setAttribute("message", "Updated");
            req.getRequestDispatcher("/admin/editprofile.jsp").forward(req, resp);
        } catch (FileUploadException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void showProfile(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        List<User> users = profileService.findAll();
        req.setAttribute("users", users);
        req.getRequestDispatcher("/admin/profile.jsp").forward(req, resp);
    }
}




