package FactoryLager;

import Factory.*;
import java.sql.*;

public abstract class LagerDaoImplement extends GenericDAO<Lager> {


    @Override

    protected Lager mapResultSetToEntity(ResultSet resultSet) throws Exception {
        Lager lager = new Lager();
        lager.setLager_ID(resultSet.getString("Lager_ID"));
        lager.setAnzahl_Produkte_Im_Lager(resultSet.getInt("Anzahl_Produkte_im_Lager"));
        lager.setStandort_ID(resultSet.getInt("Standort_ID"));
        lager.setProdukt_ID(resultSet.getInt("Produkt_ID"));

        /*
        lager.setPLZ(resultSet.getInt("PLZ"));
        lager.setOrt(resultSet.getString("Ort"));
        lager.setStraße(resultSet.getString("Straße"));
        lager.setHausnummer(resultSet.getString("Hausnummer"));


         */

        return lager;

    }
    @Override
    protected String getTableName() {
        return "Lager";
    }


}



