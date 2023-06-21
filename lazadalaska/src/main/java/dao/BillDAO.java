package dao;

import dto.PageAble;
import model.Bill;
import model.Status;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BillDAO extends DatabaseConnection {

    private final String CREATE_BILL = "INSERT INTO orders(id, user_id, date, total) VALUES(?,?,?,?)";
    private final String SELECT_ALL_BILL = "SELECT b.*, u.username AS `user_name`, st.name as `status_name`" +
            " FROM lazadalaska.bill b LEFT JOIN lazadalaska.user u ON b.user_id = u.id" +
            " LEFT JOIN lazadalaska.status st ON b.is_bill = st.id " +
            " WHERE LOWER(u.username) LIKE '%s' ORDER BY %s %s  LIMIT %d OFFSET %d";
    private final String UPDATE_BILL = "UPDATE `lazadalaska`.`bill` SET `user_id` = ?," +
            " `date` = ?, `total` = ? `total` = ?  WHERE (`id` = ?)";
    private final String DELETE_BILL = "DELETE FROM orders WHERE id=?";
    private final String SELECT_BILL_BY_ID = "SELECT p.*, c.name as `status_name`" +
            " FROM lazadalaska.bill p left join status c on p.is_bill = c.id where p.id = ?";
    private final String TOTAL = "SELECT count(1) as `total` FROM lazadalaska.bill p left join user c on p.user_id = c.id where  lower(p.name) like ?";

    public List<Bill> findAll(PageAble pageAble) {
        String search = pageAble.getSearch();
        if (search == null) search = "";
        search = "%" + search + "%";
        List<Bill> bills = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(String.format(SELECT_ALL_BILL,
                    search, pageAble.getNameField(), pageAble.getSortBy(), pageAble.getTotalItems(), (pageAble.getPage() - 1) * pageAble.getTotalItems()));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int user_id = resultSet.getInt("user_id");
                String user_name = resultSet.getString("user_name");
                User user = new User(user_id, user_name);
                Date date = resultSet.getDate("date");
                double total = resultSet.getDouble("total");
                String status_name = resultSet.getString("status_name");
                bills.add(new Bill(id, user, date, total, new Status(status_name)));
            }
            PreparedStatement statement = connection.prepareStatement(TOTAL);
            statement.setString(1, search);
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
        return bills;
    }

    public Bill findById(int id) {
        Bill bill = null;
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BILL_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int user_id = resultSet.getInt("user_id");
                String user_name = resultSet.getString("user_name");
                User user = new User(user_id, user_name);
                Date date = resultSet.getDate("date");
                double total = resultSet.getDouble("total");
                int status_id = resultSet.getInt("status_id");
                String status_name = resultSet.getString("status_name");
                Status status = new Status(status_id, status_name);
                bill = new Bill(id, user, date, total, status);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return bill;
    }

    public void save(Bill bill) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_BILL);
            preparedStatement.setInt(1, bill.getId());
            preparedStatement.setInt(2, bill.getUser_id().getId());
            preparedStatement.setDate(3, new java.sql.Date(bill.getDate().getTime()));
            preparedStatement.setDouble(4, bill.getTotal());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void update(Bill bill) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BILL);
            preparedStatement.setInt(1, bill.getUser_id().getId());
            preparedStatement.setDate(2, new java.sql.Date(bill.getDate().getTime()));
            preparedStatement.setDouble(3, bill.getTotal());
            preparedStatement.setInt(4, bill.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}