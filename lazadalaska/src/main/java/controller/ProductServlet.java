package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dto.PageAble;
import model.Category;
import model.Product;
import serrvice.CategoryService;
import serrvice.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns ={ "/products","/"})
public class ProductServlet extends HttpServlet {
    
    // nhat dev co code
    private ProductService productService = new ProductService();

    private CategoryService categoryService = new CategoryService();

    private int TOTAL_ITEMS = 16;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        // nhatdev cpde aaaaaaaaa Huy vo thay doi

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
            default:
                listProduct(req, resp);
                break;
        }
    }
    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.deleteProduct(id);
        listProduct(req,resp);
    }


    private void showEditProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        // lấy customer có id bằng với id trong parameter;
        // gửi customer qua bên edit.jsp;
        // điều hướng tới trang edit.jsp;
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        req.setAttribute("category", categoryService.findAll());
        req.getRequestDispatcher("edit.jsp").forward(req, resp);
    }

    private void showCreateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("category", categoryService.findAll());
        req.getRequestDispatcher("create.jsp")
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
            default:
                listProduct(req, resp);
                break;
        }
    }
    private void createProduct(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int category_id = Integer.parseInt(req.getParameter("category"));
        String describe = req.getParameter("describe");
        String img = req.getParameter("img");
        Category category = categoryService.findById(category_id);
        Product product = new Product(name,price,describe,quantity,img, category);
        req.setAttribute("product", product);
        req.setAttribute("message", "Created");
        req.setAttribute("category", categoryService.findAll());
        req.getRequestDispatcher("create.jsp").forward(req,resp);

    }
    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity= Integer.parseInt(req.getParameter("quantity"));
        int category_id = Integer.parseInt(req.getParameter("category"));
        String describe = req.getParameter("describe");
        String img = req.getParameter("img");
        Category category = categoryService.findById(category_id);
        Product product = new Product(id,name,price,describe,quantity,img, category);
        productService.updateProduct(product);
        req.setAttribute("product",product);
        req.setAttribute("category", categoryService.findAll());
        req.setAttribute("message", "edited");
        req.getRequestDispatcher("edit.jsp").forward(req,resp);
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

        PageAble pageAble = new PageAble(search, page, TOTAL_ITEMS, nameField, sortBy);

        req.setAttribute("pageable", pageAble);
        req.setAttribute("categories", categoryService.findAll());

        List<Product> products = productService.findAll(pageAble);
        req.setAttribute("products", products);


        Category category = categoryService.findById(3);
        req.setAttribute("category", category);
        req.getRequestDispatcher("demo.jsp").forward(req,resp);

        req.setAttribute("productsJSON", convertListToJson(products));
        req.getRequestDispatcher("/home.jsp").forward(req,resp);



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
}


