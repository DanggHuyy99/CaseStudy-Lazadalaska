package dao;

import model.Role;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO extends DatabaseConnection {
    private final String SELECT_USER = "SELECT * FROM user";

    private final String CREATE_USER = "INSERT INTO `lazadalaska`.`user` (`username`, `password`, `email`, `fullname`, `phone`, `role`) VALUES (?, ?, ?, ?, ?, ?)";

    private final String UPDATE_USER = "UPDATE `lazadalaska`.`user` SET `username` = ?, `password` = ?, `email` = ?, `fullname` = ?, `phone` = ? WHERE (`id` = ?)";
    private final String SELECT_USER_BY_ID = "SELECT p.* FROM lazadalaska.user p where p.id = ?";

private final String SELECT_USERNAME = "SELECT u.username FROM lazadalaska.user u";
    public void createUser(User user){
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE_USER )) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, "");
            preparedStatement.setString(4, "");
            preparedStatement.setString(5, "");
            preparedStatement.setString(6, String.valueOf(Role.USER));
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public User findById(int id) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idUser = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                String fullname = resultSet.getString("fullname");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String img = resultSet.getString("img");
                return new User(username,password,email,fullname,phone,address);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }


}

