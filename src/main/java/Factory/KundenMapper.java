package Factory;

import java.sql.ResultSet;
import java.sql.SQLException;

public class KundenMapper {
    public static Kunden map(ResultSet resultSet) throws SQLException {
        try {
            Kunden kunden = new Kunden();
            kunden.setVorname(resultSet.getString("vorname"));
            kunden.setNachname(resultSet.getString("nachname"));
            kunden.setStraße(resultSet.getString("straße"));
            kunden.setHausnummer(resultSet.getString("hausnummer"));
            kunden.setPLZ(resultSet.getInt("PLZ"));
            kunden.setOrt(resultSet.getString("Ort"));
            return kunden;
        }
        catch (SQLException e) {
            // Fehlerbehandlung, SQLException in eine RuntimeException umwandeln
            throw new RuntimeException("Fehler beim Mappen des ResultSets: " + e.getMessage(), e);
        }

    }
}
