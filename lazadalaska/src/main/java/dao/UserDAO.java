package dao;

import java.util.ArrayList;

public class UserDAO extends DatabaseConnection{
    private final String SELECT_USER = "SELECT * FROM user";

    private final String CREATE_USER = "INSERT INTO `lazadalaska`.`user` (`username`, `password`, `email`, `fullname`, `phone`, `role`) VALUES (?, ?, ?, ?, ?, ?)";

    private final String UPDATE_USER = "UPDATE `lazadalaska`.`user` SET `username` = ?, `password` = ?, `email` = ?, `fullname` = ?, `phone` = ? WHERE (`id` = ?)";

private final String SELECT_USERNAME = "SELECT u.username FROM lazadalaska.user u";


}
