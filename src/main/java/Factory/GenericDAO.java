package Factory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public abstract class GenericDAO<T> implements InterGenericDAO<T> {
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsounds";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    protected abstract T mapResultSetToEntity(ResultSet resultSet) throws Exception;

    protected abstract String getTableName();

    // CRUD-Operationen

    // Alle Einträge aus der Tabelle abrufen
    @Override
    public List<T> getAll() {
        List<T> entities = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM " + getTableName())) {

            while (resultSet.next()) {
                T entity = mapResultSetToEntity(resultSet);
                entities.add(entity);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return entities;
    }
    /*
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
    */
}
