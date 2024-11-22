package Factory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

public class GenericDAO<T> {
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsounds";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private final String tableName;
    private final Function<ResultSet, T> mapper; // Funktion, die ein ResultSet in ein Objekt umwandelt

    public GenericDAO(String tableName, Function<ResultSet, T> mapper) {
        this.tableName = tableName;
        this.mapper = mapper;
    }

    // CRUD-Operationen

    // Alle Einträge aus der Tabelle abrufen
    public List<T> getAll() {
        List<T> list = new ArrayList<>();
        String query = "SELECT * FROM " + tableName;
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                list.add(mapper.apply(resultSet)); // Mapping-Funktion wird verwendet
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Ein einzelnes Objekt per ID abrufen
    public T getById(int id) {
        String query = "SELECT * FROM " + tableName + " WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return mapper.apply(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Ein neues Objekt hinzufügen (Beispiel-Implementierung, muss erweitert werden)
    public void save(String insertSQL, Object... params) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(insertSQL)) {
            for (int i = 0; i < params.length; i++) {
                statement.setObject(i + 1, params[i]);
            }
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Ein Objekt löschen
    public void delete(int id) {
        String query = "DELETE FROM " + tableName + " WHERE id = ?";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {

            System.err.println("SQL Fehler: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Fehler bei der SQL-Abfrage: " + e.getMessage(), e);
        }
    }
}
