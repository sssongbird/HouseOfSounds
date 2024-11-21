package Kunden;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class KundenDaoImplement implements KundenDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsound";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    public List<Kunden> getAllKunden() {
        List<Kunden> kunden = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();

             /*
                 ResultSet resultSet = statement.executeQuery("SELECT * FROM Kunden")) {
              */


            ResultSet resultSet = statement.executeQuery(
                    "SELECT k.vorname, k.nachname, k.straße, k.hausnummer, p.PLZ, p.Ort " +
                            "FROM Kunden k " +
                            "JOIN PLZ p ON k.PLZ_ID = p.PLZ_ID")) {

            while (resultSet.next()) {
                Kunden kunde = new Kunden();
                kunde.setVorname(resultSet.getString("vorname"));
                kunde.setNachname(resultSet.getString("nachname"));
                kunde.setStraße(resultSet.getString("straße"));
                kunde.setHausnummer(resultSet.getString("hausnummer"));

               // kunde.setPLZ_ID(resultSet.getInt("PLZ_ID"));

                kunde.setPLZ(resultSet.getInt("PLZ"));
                kunde.setOrt(resultSet.getString("Ort"));

                kunden.add(kunde);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kunden;
    }
}