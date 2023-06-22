//package dao;
//
//import model.Bill;
//import model.BillDetail;
//import model.Category;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//public class BillDetailDAO extends DatabaseConnection {
//    private final String SELECT_ALL_BILL =" SELECT bd.*, p.name AS `product_name`, b.id as `id_bill`" +
//            "            FROM lazadalaska.bill_detail bd LEFT JOIN lazadalaska.product p ON bd.product_id = p.id" +
//            "             LEFT JOIN lazadalaska.bill b ON bd.bill_id = b.id " +
//            "             WHERE LOWER(p.name) LIKE '%s' ORDER BY %s %s LIMIT %d OFFSET %d;";
//
//    public List<BillDetail> findAll() {
//        List<BillDetail> billDetails = new ArrayList<>();
//        try {
//            Connection connection = getConnection();
//
//            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BILL);
//
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                int detail_id = resultSet.getInt("detail_id");
//                Bill bill = new Bill()
//                int product_id2 = resultSet.getInt("product_id");
//                int quantity = resultSet.getInt("quantity");
//                double price = resultSet.getDouble("price");
//                billDetails.add(new BillDetail(detail_id,bill_id1,product_id2,quantity,price);
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return billDetails;
//    }
//}
