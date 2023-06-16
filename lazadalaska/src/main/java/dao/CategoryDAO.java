package dao;

import model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DatabaseConnection {
    private final String SELECT_CATEGORY = "SELECT * FROM lazadalaska.category;";

    private final String SELECT_CAEGORY_BY_ID = "SELECT * FROM lazadalaska.category where id = ?;";

    private final String INSERT_CATEGORY = "INSERT INTO lazadalaska.category (name) VALUES (?);";
    private static final String EDIT_CATEGORY = "UPDATE `lazadalaska`.`category` SET `name` = ? WHERE (`id` = ?);";
    private static final String DELETE_CATEGORY = "DELETE FROM `lazadalaska`.`category` WHERE (`id` = ?);";

    public List<Category> findAll() {
        List<Category> categories = new ArrayList<>();
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                categories.add(new Category(id, name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categories;
    }

    public Category findById(int id) {
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAEGORY_BY_ID);

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idCategory = resultSet.getInt("id");
                String name = resultSet.getString("name");
                return new Category(idCategory, name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    //viet chieu 14/6 5h chieu
    public void save(Category category) {
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY);

            preparedStatement.setString(1, category.getName());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void editCategory(Category category) {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(EDIT_CATEGORY)) {
            preparedStatement.setString(1, category.getName());
            preparedStatement.setInt(2, category.getId());
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void delele(int id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CATEGORY)) {
            preparedStatement.setInt(1, id);

            System.out.println(preparedStatement);
            //execute dùng để thực thi câu lệnh.
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}


