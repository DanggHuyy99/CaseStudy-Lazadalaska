package serrvice;

import dao.ProductDAO;
import dto.PageAble;
import model.Product;
import model.User;

import java.util.List;

public class ProductService {
    private ProductDAO productDAO = new ProductDAO();

    public List<Product> findAll(PageAble pageAble) {
        return productDAO.findAll(pageAble);
    }

    public Product findById(int id) {
        return productDAO.findById(id);
    }

    public void createProduct(Product product) {
        productDAO.creatProduct(product);
    }

    public void updateProduct(Product product) {
        productDAO.updateProduct(product);
    }

    public void deleteProduct(int id) {
        productDAO.deleteProduct(id);
    }

    public User findByUsername(String username) {
        return productDAO.findByUsername(username);
    }
}
