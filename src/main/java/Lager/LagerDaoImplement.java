package Lager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LagerDaoImplement implements LagerDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsound";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    public List<Lager> getAllLager() {
        List<Lager> lagerList = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(
                     "SELECT l.Lager_ID, l.Anzahl_Produkte_im_Lager, s.Standortname, s.Straße, s.Hausnummer, p.PLZ, p.Ort, l.Produkt_ID " +
                             "FROM Lager l " +
                             "JOIN Standort s ON l.Standort_ID = s.Standort_ID " +
                             "JOIN PLZ p ON s.PLZ_ID = p.PLZ_ID")) {

            while (resultSet.next()) {
                Lager lager = new Lager();
                lager.setLager_ID(resultSet.getString("Lager_ID"));
                lager.setAnzahl_Produkte_Im_Lager(resultSet.getInt("Anzahl_Produkte_im_Lager"));
                lager.setStandortname(resultSet.getString("Standortname"));
                lager.setStraße(resultSet.getString("Straße"));
                lager.setHausnummer(resultSet.getString("Hausnummer"));
                lager.setPLZ(resultSet.getInt("PLZ"));
                lager.setOrt(resultSet.getString("Ort"));
                lager.setProdukt_ID(resultSet.getInt("Produkt_ID"));
                lagerList.add(lager);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lagerList;
    }
}