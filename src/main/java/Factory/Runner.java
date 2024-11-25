package Factory;

import FactoryLager.Lager;
import FactoryLager.LagerDaoImplement;

import java.sql.SQLException;
import java.util.List;

public class Runner {
    public static void main(String[] args) {
        LagerDaoImplement lagerDao = new LagerDaoImplement() {
            @Override
            public void add(Lager item) {

            }

            @Override
            public Lager get(int id) {
                return null;
            }

            @Override
            public void update(Lager item) {

            }

            @Override
            public void delete(int id) {

            }
        };
        TablePrinter.printTable("Lagerbestand House of Sounds", lagerDao.getAll());


    }
}
