package dao;

import model.Category;
import model.Status;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StatusDAO extends DatabaseConnection{
    private final String SELECT_CATEGORY = "SELECT * FROM lazadalaska.status;";

    private final String SELECT_CAEGORY_BY_ID = "SELECT * FROM lazadalaska.status where id = ?;";

    private final String INSERT_CATEGORY = "INSERT INTO lazadalaska.status (name) VALUES (?);";
    private static final String EDIT_CATEGORY = "UPDATE `lazadalaska`.`status` SET `name` = ? WHERE (`id` = ?);";
    private static final String DELETE_CATEGORY = "DELETE FROM `lazadalaska`.`status` WHERE (`id` = ?);";

    public List<Status> findAll() {
        List<Status> statuses = new ArrayList<>();
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                statuses.add(new Status(id, name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return statuses;
    }

    public Status findById(int id) {
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAEGORY_BY_ID);

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idStatus= resultSet.getInt("id");
                String name = resultSet.getString("name");
                return new Status(idStatus, name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

}
