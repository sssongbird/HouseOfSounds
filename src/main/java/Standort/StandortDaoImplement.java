package Standort;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StandortDaoImplement implements StandortDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsound";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    public List<Standort> getAllStandorte() {
        List<Standort> standorte = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(
                     "SELECT s.Standort_ID, s.Standortname, s.Straße, s.Hausnummer, p.PLZ, p.Ort " +
                             "FROM Standort s " +
                             "JOIN PLZ p ON s.PLZ_ID = p.PLZ_ID")) {

            while (resultSet.next()) {
                Standort standort = new Standort();
                standort.setStandort_ID(resultSet.getInt("Standort_ID"));
                standort.setStandortname(resultSet.getString("Standortname"));
                standort.setStraße(resultSet.getString("Straße"));
                standort.setHausnummer(resultSet.getString("Hausnummer"));
                standort.setPLZ(resultSet.getInt("PLZ"));
                standort.setOrt(resultSet.getString("Ort"));
                standorte.add(standort);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return standorte;
    }
}
