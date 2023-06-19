package controller.adminController;

import dto.PageAble;
import model.Category;
import model.Product;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import serrvice.CategoryService;
import serrvice.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.List;

@WebServlet(urlPatterns = {"/handleproduct"})
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
        listProduct(req, resp);
    }


    private void showEditProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        // lấy customer có id bằng với id trong parameter;
        // gửi customer qua bên edit.jsp;
        // điều hướng tới trang edit.jsp;
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        req.setAttribute("category", categoryService.findAll());
        req.getRequestDispatcher("/admin/edit.jsp").forward(req, resp);
    }

    private void showCreateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("category", categoryService.findAll());
        req.getRequestDispatcher("/admin/create.jsp")
                .forward(req, resp);

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

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Product product = new Product();
        try {

            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            sf.setHeaderEncoding("UTF-8");
            List<FileItem> multifiles = sf.parseRequest(req);
            String listImage = "";

            for (FileItem item : multifiles) {

                if (item.isFormField()) {
                    // Process regular form field (input type="text|radio|checkbox|etc",
                    // select,etc).
                    String fieldname = item.getFieldName();
                    String fieldvalue = item.getString("UTF-8");

                    switch (fieldname) {
                        case "name":
                            product.setName(fieldvalue);
                            break;
                        case "category":
                            Category cate = categoryService.findById(Integer.parseInt(fieldvalue));
                            product.setCategory(cate);
                            break;
                        case "price":
                            product.setPrice(Float.valueOf(fieldvalue));
                            break;
                        case "quantity":
                            product.setQuantity(Integer.valueOf(fieldvalue));
                            break;

                        case "describe":
                            product.setDescribe(fieldvalue);
                            break;
                    }

                } else {
                    // Process form file field (input type="file").
                    if (!item.getName().isEmpty() && !item.getFieldName().equals("files")) {
                        String filename = FilenameUtils.getName(item.getName());
                        product.setImg("/assets/img/" + filename);
                        item.write(new File("D:\\clone\\CaseStudy-Lazadalaska\\lazadalaska\\src\\main\\webapp\\assets\\img\\"
                                + filename));

                    }
                }

            }
            productService.createProduct(product);

            req.setAttribute("product", product);
            req.setAttribute("message", "Created");
            req.setAttribute("category", categoryService.findAll());
            req.getRequestDispatcher("/admin/create.jsp").forward(req, resp);

        } catch (FileUploadException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }


    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product product = new Product();
        try {
            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            sf.setHeaderEncoding("UTF-8");
            List<FileItem> multifiles = sf.parseRequest(req);
            String listImage = "";

            for (FileItem item : multifiles) {
                if (item.isFormField()) {
                    // Process regular form field (input type="text|radio|checkbox|etc",
                    // select,etc).
                    String fieldname = item.getFieldName();
                    String fieldvalue = item.getString("UTF-8");

                    switch (fieldname) {
                        case "id":
                            product = productService.findById(Integer.parseInt(fieldvalue));
                            break;
                        case "name":
                            product.setName(fieldvalue);
                            break;
                        case "category":
                            Category cate = categoryService.findById(Integer.parseInt(fieldvalue));
                            product.setCategory(cate);
                            break;
                        case "price":
                            product.setPrice(Float.valueOf(fieldvalue));
                            break;
                        case "quantity":
                            product.setQuantity(Integer.valueOf(fieldvalue));
                            break;
                        case "describe":
                            product.setDescribe(fieldvalue);
                            break;
                    }

                } else {
                    // Process form file field (input type="file").
                    if (!item.getName().isEmpty() && !item.getFieldName().equals("files")) {
                        String filename = FilenameUtils.getName(item.getName());
                        product.setImg("/assets/img/" + filename);
                        item.write(new File("D:\\clone\\CaseStudy-Lazadalaska\\lazadalaska\\src\\main\\webapp\\assets\\img\\"
                                + filename));
                    }
                }
            }
            productService.updateProduct(product);

            req.setAttribute("product", product);
            req.setAttribute("message", "Updated");
            req.setAttribute("category", categoryService.findAll());
            req.getRequestDispatcher("/admin/edit.jsp").forward(req, resp);
        } catch (FileUploadException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
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
        req.getRequestDispatcher("/admin/product.jsp").forward(req, resp);


    }
}


