package codegym.service;

import codegym.model.Product;
import codegym.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM Product";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Product product = new Product(
                        resultSet.getInt("ProductID"),
                        resultSet.getString("ProductName"),
                        resultSet.getDouble("Price"),
                        resultSet.getString("Discount"),
                        resultSet.getInt("Stock")
                );
                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO Product (ProductName, Price, Discount, Stock) VALUES (?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, product.getProductName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDiscount());
            statement.setInt(4, product.getStock());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getTopSellingProducts(int top) {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT Product.ProductID, Product.ProductName, Product.Price, Product.Discount, Product.Stock, SUM(OrderDetail.Quantity) AS TotalQuantity " +
                "FROM Product " +
                "JOIN OrderDetail ON Product.ProductID = OrderDetail.ProductID " +
                "GROUP BY Product.ProductID " +
                "ORDER BY TotalQuantity DESC " +
                "LIMIT ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, top);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Product product = new Product(
                        resultSet.getInt("ProductID"),
                        resultSet.getString("ProductName"),
                        resultSet.getDouble("Price"),
                        resultSet.getString("Discount"),
                        resultSet.getInt("Stock")
                );
                productList.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }


}
