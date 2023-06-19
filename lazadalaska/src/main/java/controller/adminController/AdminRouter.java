package controller.adminController;

import dto.PageAble;
import model.Product;
import serrvice.CategoryService;
import serrvice.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/admin","/admin/dashboard","/admin/product"})
public class AdminRouter extends HttpServlet {
    private ProductService productService = new ProductService();

    private CategoryService categoryService = new CategoryService();

    private int TOTAL_ITEMS = 5;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        switch (path){
            case "/admin/dashboard":
                showDashboard(req,resp);
                break;
            case "/admin/product":
                showProductPage(req,resp);
                break;
            case "profile":
                showProfile(req,resp);
            default:
                resp.sendRedirect("/login");
        }
    }

    private void showProfile(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showProductPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        String sortBy = req.getParameter("soryBy");
        if (sortBy == null) {
            sortBy = "asc";
        }

        String nameField = req.getParameter("nameField");
        if (nameField == null) {
            nameField = "id";
        }

        PageAble pageAble = new PageAble(search, page, TOTAL_ITEMS, nameField, sortBy);

        req.setAttribute("pageable", pageAble);
        List<Product> products = productService.findAll(pageAble);
        req.setAttribute("products", products);
        req.getRequestDispatcher("/admin/product.jsp").forward(req,resp);
    }

    private void showDashboard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/dashboard.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
