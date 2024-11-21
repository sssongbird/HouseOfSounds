package FactoryPLZ;

import Factory.Rabatt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PLZDAOImpl implements PLZDAO{
    private static final String URL = "jdbc:mysql://localhost:3306/houseofsounds";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    @Override
    public List<PLZ> getAllPLZ() {
        List<PLZ> plzs = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM plz")) {

            while (resultSet.next()) {
                PLZ plz = new PLZ();
                plz.setPLZ_ID(resultSet.getInt("PLZ_ID"));
                plz.setPLZ(resultSet.getInt("PLZ"));
                plz.setORT(resultSet.getString("ORT"));
                plzs.add(plz);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return plzs;
    }


}
