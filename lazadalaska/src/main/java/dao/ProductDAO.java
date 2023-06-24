package dao;
import dto.PageAble;
import model.Category;
import model.Product;
import model.Role;
import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class ProductDAO extends DatabaseConnection {
    private final String SELECT_ALL_PRODUCT = "SELECT p.*, c.name as `category_name` FROM lazadalaska.product p left join category c on p.category_id = c.id where lower(p.name) like '%s' or lower(p.describe) like '%s' or lower(c.name) like '%s' order by %s %s limit %d offset %d ";
    private final String TOTAL_PRODUCT = "SELECT count(1) as `total` FROM lazadalaska.product p left join category c on p.category_id = c.id where  lower(p.name) like ?" +
            " or lower(p.describe) like ? or lower(c.name) like ?";
    private final String SELECT_PRODUCT_BY_ID = "SELECT p.*, c.name as `category_name` FROM lazadalaska.product p left join category c on p.category_id = c.id where p.id = ?";
    private final String CREATE_PRODUCT = "INSERT INTO `lazadalaska`.`product` (`name`, `price`, `describe`, `quantity`, `img`, `category_id`) VALUES (?, ?, ?, ?, ?, ?)";
    private final String UPDATE_PRODUCT = "UPDATE `lazadalaska`.`product` SET `name` = ?, `price` = ?, `describe` = ?, `quantity` = ?, `img` = ?, `category_id` = ? WHERE (`id` = ?)";
    private final String DELETE_PRODUCT = "DELETE FROM `lazadalaska`.`product` WHERE (`id` = ?)";

    private final String SELECT_BY_USERNAME = "SELECT * FROM user where username = ?";

    private final String SELECT_PRODUCT_BY_CATEGORY2 = "SELECT p.*, c.name as `category_name` FROM lazadalaska.product p left join category c on p.category_id = c.id where c.name = '%s' and (lower(p.name) like '%s' or lower(p.describe) like '%s' or lower(c.name) like '%s') order by %s %s limit %d offset %d ";

    public List<Product> findAll(PageAble pageAble) {
        String search = pageAble.getSearch();
        if (search == null) search = "";
        search = "%" + search + "%";
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(String.format(SELECT_ALL_PRODUCT,
                    search, search, search, pageAble.getNameField(),
                    pageAble.getSortBy(), pageAble.getTotalItems(), (pageAble.getPage() - 1) * pageAble.getTotalItems()));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String describe = resultSet.getString("describe");
                int quantity = resultSet.getInt("quantity");
                String img = resultSet.getString("img");
                int category_id = resultSet.getInt("category_id");
                String category_name = resultSet.getString("category_name");
                products.add(new Product(id, name, price, describe, quantity, img, new Category(category_id, category_name)));
            }
            PreparedStatement statement = connection.prepareStatement(TOTAL_PRODUCT);
            statement.setString(1, search);
            statement.setString(2, search);
            statement.setString(3, search);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                double totalProducts = rs.getDouble("total");
                double totalItems = Double.parseDouble(pageAble.getTotalItems() + "");
                int totalPages = (int) Math.ceil(totalProducts / totalItems);
                pageAble.setTotalPages(totalPages);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return products;
    }
    public Product findById(int id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idProduct = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String describe = resultSet.getString("describe");
                int quantity = resultSet.getInt("quantity");
                String img = resultSet.getString("img");
                int category_id = resultSet.getInt("category_id");
                String category_name = resultSet.getString("category_name");
                return new Product(idProduct, name, price, describe, quantity, img, new Category(category_id, category_name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public void creatProduct(Product product) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescribe());
            preparedStatement.setInt(4, product.getQuantity());
            preparedStatement.setString(5, product.getImg());
            preparedStatement.setInt(6, product.getCategory().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateProduct(Product product){
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getDescribe());
            preparedStatement.setInt(4, product.getQuantity());
            preparedStatement.setString(5, product.getImg());
            preparedStatement.setInt(6, product.getCategory().getId());
            preparedStatement.setInt(7, product.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void deleteProduct(int id){
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public User findByUsername(String username) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_USERNAME);
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                Role role = Role.valueOf(rs.getString("role"));
                String address = rs.getString("address");
                String img = rs.getString("img");
                return new User(id, name,password, email, fullname, phone, role,address,img);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public List<Product> findProductByCategoryName(String name,PageAble pageAble){
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_CATEGORY);
            String search = pageAble.getSearch();
            if (search == null) search = "";
            search = "%" + search + "%";

            PreparedStatement preparedStatement = connection.prepareStatement(String.format(SELECT_PRODUCT_BY_CATEGORY2,pageAble.getCategory(),
                    search, search, search, pageAble.getNameField(),
                    pageAble.getSortBy(), pageAble.getTotalItems(), (pageAble.getPage() - 1) * pageAble.getTotalItems()));
            System.out.println(preparedStatement);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String nameProduct = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String describe = resultSet.getString("describe");
                int quantity = resultSet.getInt("quantity");
                String img = resultSet.getString("img");
                int category_id = resultSet.getInt("category_id");
                String category_name = resultSet.getString("category_name");
                products.add(new Product(id, nameProduct, price, describe, quantity, img, new Category(category_id, category_name)));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }
}