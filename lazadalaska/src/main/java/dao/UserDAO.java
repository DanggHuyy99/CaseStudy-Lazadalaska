package dao;

import model.Role;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO extends DatabaseConnection {
    private final String SELECT_USER = "SELECT * FROM user";
    private final String CREATE_USER = "INSERT INTO `lazadalaska`.`user` (`username`, `password`, `email`, `fullname`, `phone`, `role`) VALUES (?, ?, ?, ?, ?, ?)";

    private final String UPDATE_PASSWORD =  "UPDATE `lazadalaska`.`user` SET  `password` = ? WHERE (`id` = ?)";
    private final String UPDATE_USER = "UPDATE `lazadalaska`.`user` SET `username` = ?, `password` = ?, `email` = ?, `fullname` = ?, `phone` = ? WHERE (`id` = ?)";
    private final String SELECT_USER_BY_ID = "SELECT p.* FROM lazadalaska.user p where p.id = ?";

    private final String SELECT_USERNAME = "SELECT u.username FROM lazadalaska.user u";

    public ArrayList<User> findAll() {
        ArrayList<User> userList = new ArrayList<>();
        try {
            PreparedStatement statement = getConnection().prepareStatement(SELECT_USER);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
                user.setFullname(resultSet.getString("fullname"));
                user.setPhone(resultSet.getString("phone"));
                user.setRole(Role.valueOf(resultSet.getString("role")));
                user.setAddress(resultSet.getString("address"));
                user.setImg(resultSet.getString("img"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }


    public boolean updateUser(User user) {
        try {
            PreparedStatement statement = getConnection().prepareStatement(UPDATE_USER);
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getFullname());
            statement.setString(3, user.getPhone());
            statement.setString(4,user.getAddress());
            statement.setString(5,user.getImg());
            statement.setInt(6, user.getId());
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<String> getAllUsernames() {
        ArrayList<String> usernameList = new ArrayList<>();
        try {
            PreparedStatement statement = getConnection().prepareStatement(SELECT_USERNAME);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                usernameList.add(resultSet.getString("username"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usernameList;
    }

    public boolean isUsernameExist(String username) {
        String query = SELECT_USERNAME + " WHERE u.username = ?";
        try (PreparedStatement statement = DatabaseConnection.getConnection().prepareStatement(query)) {
            statement.setString(1, username);

            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean updateUserPassWord(User user) {
        try {
            PreparedStatement statement = getConnection().prepareStatement(UPDATE_PASSWORD);
            statement.setString(1, user.getPassword());
            statement.setInt(2, user.getId());
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
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

}

