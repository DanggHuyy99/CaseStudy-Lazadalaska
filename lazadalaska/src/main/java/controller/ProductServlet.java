package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.BillHomeDAO;
import dao.BillDetailDAO;
import dao.UserDAO;
import dto.PageAble;
import model.Category;
import model.Product;
import model.User;

import model.*;

import serrvice.CategoryService;
import serrvice.ProductService;
import serrvice.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {


    private ProductService productService = new ProductService();

    private CategoryService categoryService = new CategoryService();
    private UserService userService = new UserService();

    private int TOTAL_ITEMS = 24;

    private BillHomeDAO billHomeDAO = new BillHomeDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "create":
                showCreateProduct(req, resp);
                break;
            case "edit":
                showEditProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            case "logout":
                logout(req, resp);
                break;

            case "shoppingCart":
                shoppingCart(req, resp);
                break;
            case "productdetail":
                productDetail(req, resp);
                break;
            default:
                listProduct(req, resp);
                break;
        }
    }

    private void productDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/product/productdetail.jsp").forward(req, resp);
    }

    private void shoppingCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("shoppingcart.jsp").forward(req, resp);
    }


    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.deleteProduct(id);
        listProduct(req, resp);
    }


    private void showEditProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        req.setAttribute("category", categoryService.findAll());
        req.getRequestDispatcher("edit.jsp").forward(req, resp);
    }

    private void showCreateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("category", categoryService.findAll());

        req.getRequestDispatcher("/admin/create.jsp")
                .forward(req,resp);



    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "create":
                createProduct(req, resp);
                break;
            case "edit":
                editProduct(req, resp);
                break;
            case "delete":
                deleteProduct(req, resp);
                break;
            case "checkout":
                checkOutCart(req, resp);
                break;
            default:
                listProduct(req, resp);
                break;
        }
    }

    private void checkOutCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String[] quantitys = req.getParameter("quantitys").split(",");
        String[] productIds = req.getParameter("productIds").split(",");

        List<BillDetailHome> billList = new ArrayList<>();
        BillHome billHome = new BillHome();
        billHome.setUserId(id);
//        bill.setDate(System.currentTimeMillis());
        double total = 0;
        for (int i = 0; i < quantitys.length; i++) {
            BillDetailHome billDetailHome = new BillDetailHome();
            Product product = productService.findById(Integer.parseInt(productIds[i]));
            billDetailHome.setQuantity(Integer.parseInt(quantitys[i]));
            billDetailHome.setPrice(product.getPrice());
            double totalOneProduct = billDetailHome.getQuantity() * billDetailHome.getPrice();
            total += totalOneProduct;
        }

        billHome.setTotal(total);
//        bill.setCart(false);
        billHome.setId(billHomeDAO.save(billHome));
        UserDAO userDAO = new UserDAO();
        User user = userDAO.findById(id);

        for (int i = 0; i < quantitys.length; i++) {
            BillDetailHome billDetailHome = new BillDetailHome();
            Product product = productService.findById(Integer.parseInt(productIds[i]));
            billDetailHome.setBillId(billHome.getId());
            billDetailHome.setProductId(product.getId());
            billDetailHome.setQuantity(Integer.parseInt(quantitys[i]));
            billDetailHome.setPrice(product.getPrice());
            billList.add(billDetailHome);
        }

//        for (Cart item : cartItems) {
//
//        }

        BillDetailDAO billDetailDAO = new BillDetailDAO();
        billDetailDAO.saveBillDetails(billList);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("Checkout successful");

    }
    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int category_id = Integer.parseInt(req.getParameter("category"));
        String describe = req.getParameter("describe");
        String img = req.getParameter("img");
        Category category = categoryService.findById(category_id);
        Product product = new Product(name, price, describe, quantity, img, category);
        req.setAttribute("product", product);
        req.setAttribute("message", "Created");
        req.setAttribute("category", categoryService.findAll());
        req.getRequestDispatcher("create.jsp").forward(req, resp);

    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int category_id = Integer.parseInt(req.getParameter("category"));
        String describe = req.getParameter("describe");
        String img = req.getParameter("img");
        Category category = categoryService.findById(category_id);
        Product product = new Product(id, name, price, describe, quantity, img, category);
        productService.updateProduct(product);
        req.setAttribute("product", product);
        req.setAttribute("category", categoryService.findAll());
        req.setAttribute("message", "edited");
        req.getRequestDispatcher("edit.jsp").forward(req, resp);
    }

    private void listProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        String sortBy = req.getParameter("sortBy");
        if (sortBy == null) {
            sortBy = "asc";
        }

        String nameField = req.getParameter("nameField");
        if (nameField == null) {
            nameField = "id";
        }

        String category = req.getParameter("category");

        PageAble pageAble = new PageAble(search, page, TOTAL_ITEMS, nameField, sortBy, category);

        req.setAttribute("pageable", pageAble);
        req.setAttribute("categories", categoryService.findAll());


        String cate = req.getParameter("category");
        if (cate != null) {
            List<Product> products = productService.findProductByCategoryName(cate,pageAble);
            req.setAttribute("products", products);
            req.getRequestDispatcher("home.jsp").forward(req, resp);
        } else {
            List<Product> products = productService.findAll(pageAble);
            for (Product product : products) {
                int defaultQuantity = product.getQuantity();
                req.setAttribute("defaultQuantity_" + product.getId(), defaultQuantity);
            }
            req.setAttribute("productsJSON", convertListToJson(products));
            req.setAttribute("products", products);
            req.getRequestDispatcher("/home.jsp").forward(req, resp);
        }

    }

    public static String convertListToJson(List<?> list) {
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            return objectMapper.writeValueAsString(list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.invalidate();
        resp.sendRedirect("/products");
    }


    }





