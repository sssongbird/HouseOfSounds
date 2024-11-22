package Factory;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RabattMapper {
    public static Rabatt map(ResultSet resultSet) {
        try {
            Rabatt rabatt = new Rabatt();
            rabatt.setRabatt_ID(resultSet.getInt("Rabatt_ID"));
            rabatt.setRabattcode(resultSet.getString("Rabattcode"));
            rabatt.setHoehe_Rabatt(resultSet.getDouble("Hoehe_Rabatt"));
            rabatt.setDauer(resultSet.getInt("Dauer"));
            return rabatt;
        } catch (SQLException e) {
            // Fehlerbehandlung, SQLException in eine RuntimeException umwandeln
            throw new RuntimeException("Fehler beim Mappen des ResultSets: " + e.getMessage(), e);
        }
    }
}
