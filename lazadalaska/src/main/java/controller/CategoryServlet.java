package controller;

import model.Category;
import serrvice.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CategoryServlet", urlPatterns ={ "/categories"})
public class CategoryServlet extends HttpServlet {
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                showEditCategory(req, resp);
                break;
            case "create":
                showCreateCategory(req, resp);
                break;
        }

    }

    private void showCreateCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("categories", categoryService.findAll());
        req.getRequestDispatcher("category1/createcate.jsp")
                .forward(req, resp);
    }
    private void showEditCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = categoryService.findById(id);
        req.setAttribute("category", category);
        req.getRequestDispatcher("category1/editcate.jsp").forward(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                editCategory(req, resp);
                break;
            case "create":
                createCategory(req, resp);
                break;

        }
    }
    private void createCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        Category category = new Category(name);

        categoryService.save(category);

        req.setAttribute("categories", categoryService.findAll());

        req.setAttribute("message", "Đã tạo thành công");
        req.getRequestDispatcher("category1/createcate.jsp").forward(req, resp);

    }
    private void editCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        Category category = new Category(id, name);
        categoryService.editCategory(category);
//        req.setAttribute("categorys", categoryService.findAll());
        req.setAttribute("message", "đã sữa thành công ");
        req.getRequestDispatcher("category1/editcate.jsp").forward(req, resp);


    }
}