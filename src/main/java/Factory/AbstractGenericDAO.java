package Factory;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public abstract class AbstractGenericDAO<T> implements GenericDAO<T> {
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsounds";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    protected abstract T mapResultSetToEntity(ResultSet resultSet) throws Exception;

    protected abstract String getTableName();

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


    @Override
    public T getById(int id) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM " + getTableName() + " WHERE ID = ?")) {

            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToEntity(resultSet);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }





    @Override
    public void save(T entity) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            Field[] fields = entity.getClass().getDeclaredFields();

            List<String> columnNames = new ArrayList<>();
            List<Object> values = new ArrayList<>();

            for (Field field : fields) {
                field.setAccessible(true);

                try {
                    Object value = field.get(entity);
                    if (value != null) {
                        columnNames.add(field.getName());
                        values.add(value);
                    }

                } catch (IllegalAccessException e) {
                    System.err.println("Couldnt access field: " + field.getName());
                }
            }
            String columns = String.join(",", columnNames);
            String placeholders = columnNames.stream()
                    .map(col -> "?")
                    .collect(Collectors.joining(", "));

            String insertQuery = "INSERT INTO " + getTableName() + " (" + columns + ") VALUES (" + placeholders + ")";

            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                for (int i = 0; i < values.size(); i++) {
                    preparedStatement.setObject(i + 1, values.get(i));
                }

                preparedStatement.executeUpdate();

            }

        } catch (SQLException e) {
            System.err.println("Database Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private String getTableName(Class<?> entityClass) {
        return entityClass.getSimpleName().toLowerCase();
    }

    @Override
    public void update(T entity) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            // Primärschlüsselfeld finden
            Field primaryKeyField = findPrimaryKeyField(entity.getClass());

            System.out.println("Erfolg: " + primaryKeyField);
            if (primaryKeyField == null) {
                throw new IllegalArgumentException("Kein Primärschlüsselfeld gefunden");
            }

            // Listen für Update-Spalten vorbereiten
            List<String> updateColumns = new ArrayList<>();
            List<Object> updateValues = new ArrayList<>();
            Object primaryKeyValue = null;

            // Durch Felder iterieren
            for (Field field : entity.getClass().getDeclaredFields()) {
                field.setAccessible(true);

                try {
                    Object value = field.get(entity);

                    // Null-Werte und Primärschlüsselfeld überspringen
                    if (value != null && !field.equals(primaryKeyField)) {
                        updateColumns.add(field.getName() + " = ?");
                        updateValues.add(value);
                    }

                    // Primärschlüsselwert erfassen
                    if (field.getName().equals(primaryKeyField.getName())) {
                        primaryKeyValue = value;
                    }


                } catch (IllegalAccessException e) {
                    System.err.println("Konnte nicht auf Feld zugreifen: " + field.getName());
                }
            }

            // Primärschlüssel prüfen
            if (primaryKeyValue == null) {
                throw new IllegalArgumentException("Primärschlüsselwert muss für Update gesetzt sein");
            }

            // Update-Abfrage konstruieren
            String updateQuery = "UPDATE " + getTableName() +
                    " SET " + String.join(", ", updateColumns) +
                    " WHERE " + primaryKeyField.getName() + " = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                // Update-Werte setzen
                int parameterIndex = 1;
                for (Object value : updateValues) {
                    preparedStatement.setObject(parameterIndex++, value);
                }

                // Primärschlüsselwert am Ende setzen
                preparedStatement.setObject(parameterIndex, primaryKeyValue);

                // Update ausführen
                int betroffeneZeilen = preparedStatement.executeUpdate();

                if (betroffeneZeilen == 0) {
                    throw new SQLException("Update fehlgeschlagen, keine Zeilen betroffen");
                }
            }

        } catch (SQLException e) {
            System.err.println("Datenbankfehler: " + e.getMessage());
            e.printStackTrace();
        }


    }

    @Override
    public void delete(T entity) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            // Primärschlüsselfeld finden
            Field primaryKeyField = findPrimaryKeyField(entity.getClass());

            if (primaryKeyField == null) {
                throw new IllegalArgumentException("Kein Primärschlüsselfeld für Löschvorgang gefunden");
            }

            // Den Wert des Primärschlüssels ermitteln
            primaryKeyField.setAccessible(true);
            Object primaryKeyValue = primaryKeyField.get(entity);

            if (primaryKeyValue == null) {
                throw new IllegalArgumentException("Primärschlüsselwert muss für Löschvorgang gesetzt sein");
            }

            // Manuelles Löschen der abhängigen Einträge in richtiger Reihenfolge
            // 1. Einträge aus firmenrechnung löschen
            try (PreparedStatement deleteFirmenrechnung = connection.prepareStatement(
                    "DELETE FROM firmenrechnung WHERE Nachbestellung_ID IN (SELECT Nachbestellung_ID FROM nachbestellung WHERE Produkte_ID = ?)")) {
                deleteFirmenrechnung.setObject(1, primaryKeyValue);
                int rowsAffected = deleteFirmenrechnung.executeUpdate();
                System.out.println("Abhängige Firmenrechnungen gelöscht: " + rowsAffected + " Zeilen");
            }

            // 2. Einträge aus nachbestellung löschen
            try (PreparedStatement deleteNachbestellung = connection.prepareStatement(
                    "DELETE FROM nachbestellung WHERE Produkte_ID = ?")) {
                deleteNachbestellung.setObject(1, primaryKeyValue);
                int rowsAffected = deleteNachbestellung.executeUpdate();
                System.out.println("Abhängige Nachbestellungen gelöscht: " + rowsAffected + " Zeilen");
            }

            // 3. Den Hauptdatensatz (Produkt) löschen
            String deleteQuery = "DELETE FROM " + getTableName() +
                    " WHERE " + primaryKeyField.getName() + " = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery)) {
                // Primärschlüsselwert setzen
                preparedStatement.setObject(1, primaryKeyValue);

                // Löschvorgang ausführen
                int betroffeneZeilen = preparedStatement.executeUpdate();

                if (betroffeneZeilen == 0) {
                    System.err.println("Löschvorgang fehlgeschlagen: Keine Zeilen betroffen");
                } else {
                    System.out.println("Entität erfolgreich gelöscht: " + betroffeneZeilen + " Zeilen");
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }


    // Helper method to find primary key field
    private Field findPrimaryKeyField(Class<?> clazz) {
        for (Field field : clazz.getDeclaredFields()) {
            // Überprüfen, ob der Feldname mit "ID" endet (z.B. "kunden_ID" oder "produkte_ID")
            if (field.getName().toUpperCase().endsWith("ID")) {
                return field;
            }
        }
        return null;
    }

}