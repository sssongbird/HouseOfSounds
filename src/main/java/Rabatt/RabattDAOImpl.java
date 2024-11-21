package Rabatt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class RabattDAOImpl implements RabattDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsound";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    public List<Rabatt> getAllRabatt() {
        List<Rabatt> rabatte = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM Rabatt")) {

            while (resultSet.next()) {
                Rabatt rabatt = new Rabatt();
                rabatt.setRabatt_ID(resultSet.getInt("Rabatt_ID"));
                rabatt.setRabattcode(resultSet.getString("Rabattcode"));
                rabatt.setHoehe_Rabatt(resultSet.getDouble("Hoehe_Rabatt"));
                rabatt.setDauer(resultSet.getInt("Dauer"));
                rabatte.add(rabatt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rabatte;
    }
}