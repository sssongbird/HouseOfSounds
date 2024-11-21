package FactoryProdukte;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Factory.Rabatt;

public class ProdukteDAOImpl implements ProdukteDAO{
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsounds";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    public List<Produkte> getAllProdukte() {
        List<Produkte> produkt = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(
                     "SELECT p.Produkte_ID, p.Preis, r.Dauer, r.Hoehe_Rabatt, r.Rabattcode " +
                             "FROM Produkte p " +
                             "LEFT JOIN Rabatt r ON p.Rabatt_ID = r.Rabatt_ID"))  {
             while (resultSet.next()) {
                 Produkte produkte = new Produkte();
                 produkte.setProdukte_ID(resultSet.getInt("Produkte_ID"));
                 produkte.setPreis(resultSet.getInt("Preis"));
                 //produkte.setRabatt_ID(resultSet.getInt("Rabatt_ID"));
                 produkte.setRabattcode(resultSet.getString("Rabattcode"));
                 produkte.setHoehe_Rabatt(resultSet.getDouble("Hoehe_Rabatt"));
                 produkte.setDauer(resultSet.getInt("Dauer"));
                 produkt.add(produkte);

             }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produkt;
        }
    }

