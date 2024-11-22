package Factory;

import java.sql.ResultSet;

public class RabattDAOImpl extends AbstractGenericDAO<Rabatt> {
    @Override
    protected Rabatt mapResultSetToEntity(ResultSet resultSet) throws Exception {
        Rabatt rabatt = new Rabatt();
        rabatt.setRabatt_ID(resultSet.getInt("Rabatt_ID"));
        rabatt.setRabattcode(resultSet.getString("Rabattcode"));
        rabatt.setHoehe_Rabatt(resultSet.getDouble("Hoehe_Rabatt"));
        rabatt.setDauer(resultSet.getInt("Dauer"));
        return rabatt;
    }

    @Override
    protected String getTableName() {
        return "Rabatt";
    }
}