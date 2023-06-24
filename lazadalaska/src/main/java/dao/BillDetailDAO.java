package dao;

import model.BillDetailHome;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class BillDetailDAO extends DatabaseConnection {
    private static final String INSERT_BILL_DETAIL = "INSERT INTO bill_detail (bill_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";

    public void saveBillDetails(List<BillDetailHome> billDetailHomes) {
        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement;
            for (BillDetailHome billDetailHome : billDetailHomes) {
                preparedStatement = connection.prepareStatement(INSERT_BILL_DETAIL);
                preparedStatement.setInt(1, billDetailHome.getBillId());
                preparedStatement.setInt(2, billDetailHome.getProductId());
                preparedStatement.setInt(3, billDetailHome.getQuantity());
                preparedStatement.setDouble(4, billDetailHome.getPrice());
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
