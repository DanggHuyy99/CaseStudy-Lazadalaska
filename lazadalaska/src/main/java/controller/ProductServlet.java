package controller;

import dto.PageAble;
import serrvice.CategoryService;
import serrvice.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();

    private CategoryService categoryService = new CategoryService();

    private int TOTAL_ITEMS = 5;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
//            case "create":
//                showCreateProduct(req, resp);
//                break;
//            case "edit":
//                showEditProduct(req, resp);
//                break;
//            case "delete":
//                deleteProduct(req, resp);
//                break;
            default:
                listProduct(req, resp);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
//            case "create":
//                createProduct(req, resp);
//                break;
//            case "edit":
//                editProduct(req, resp);
//                break;
//            case "delete":
//                deleteProduct(req, resp);
//                break;
            default:
                listProduct(req, resp);
                break;
        }
    }

    private void listProduct(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
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

        req.setAttribute("product", productService.findAll(pageAble));

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

    }
}


