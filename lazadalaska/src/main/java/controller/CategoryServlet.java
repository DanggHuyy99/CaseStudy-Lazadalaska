package controller;

import model.Product;
import serrvice.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", urlPatterns = "/category")
public class CategoryServlet extends HttpServlet {
    private ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");


        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            default:
                listProduct(req, resp);
                break;
        }

//        @Override
//        protected void doPost (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            super.doPost(req, resp);
//        }
    }

    private void listProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        List<Product> products = productService.findProductByCategoryName(category);
        req.setAttribute("products", products);
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }

}
