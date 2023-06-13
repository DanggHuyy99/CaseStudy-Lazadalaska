package dao;

import dto.PageAble;
import model.Category;
import model.Product;

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

    private final String CREATE_PRODUCT = "INSERT INTO `lazadalaska`.`product` (`name`, `price`, `describe`, `quantity`, `img`, `category_id`) VALUES (?, ?, ?, ?, ?, ?)";

    private final String UPDATE_PRODUCT = "UPDATE `lazadalaska`.`product` SET `name` = ?, `price` = ?, `describe` = ?, `quantity` = ?, `img` = ?, `category_id` = ? WHERE (`id` = ?)";

    private final String DELETE_PRODUCT = "DELETE FROM `lazadalaska`.`product` WHERE (`id` = ?)";

    public List<Product> findAll(PageAble pageAble) {
        String search = pageAble.getSearch();
        if (search == null) search = "";
        search = "%" + search + "%";
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(String.format(SELECT_ALL_PRODUCT, search, search, search, pageAble.getNameField(), pageAble.getSortBy(), pageAble.getTotalItems(), (pageAble.getPage() - 1) * pageAble.getTotalItems()));

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
            throw new RuntimeException(e);
        }
        return products;
    }


}
