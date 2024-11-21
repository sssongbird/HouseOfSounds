package Produkte;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProdukteDaoImplement implements ProdukteDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsound";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    public List<Produkte> getAllProdukte() {
        List<Produkte> produkte = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(
                     "SELECT p.Produkte_ID, p.Preis, r.Dauer, r.Hoehe_Rabatt, r.Rabattcode " +
                             "FROM Produkte p " +
                             "LEFT JOIN Rabatt r ON p.Rabatt_ID = r.Rabatt_ID")) {

            while (resultSet.next()) {
                Produkte produkt = new Produkte();
                produkt.setProdukte_ID(resultSet.getInt("Produkte_ID"));
                produkt.setPreis(resultSet.getDouble("Preis"));
                produkt.setDauer(resultSet.getInt("Dauer"));
                produkt.setHoehe_Rabatt(resultSet.getDouble("Hoehe_Rabatt"));
                produkt.setRabattcode(resultSet.getString("Rabattcode"));
                produkte.add(produkt);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return produkte;
    }
}