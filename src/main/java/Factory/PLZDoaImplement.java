package Factory;
import java.sql.ResultSet;


public class PLZDoaImplement extends AbstractGenericDAO<PLZ> {
    @Override
    protected PLZ mapResultSetToEntity(ResultSet resultSet) throws Exception {
        PLZ plz = new PLZ();
        plz.setPLZ_ID(resultSet.getInt("PLZ_ID"));
        plz.setPLZ(resultSet.getInt("PLZ"));
        plz.setORT(resultSet.getString("ORT"));
        return plz;
    }

    @Override
    protected String getTableName() {
        return "PLZ";
    }
}