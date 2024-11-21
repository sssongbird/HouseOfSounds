import Factory.DAOFactory;
import Factory.GenericDAO;

import java.util.List;


public class Main {
    public static void main(String[] args) {
        GenericDAO<GenericDAO.Lager> lagerDAO = DAOFactory.getDAO(GenericDAO.Lager.class);
        List<GenericDAO.Lager> lagerList = lagerDAO.getAll();

        for (GenericDAO.Lager lager : lagerList) {
            System.out.println("Lager ID: " + lager.getLager_ID());
            System.out.println("Anzahl Produkte im Lager: " + lager.getAnzahl_Produkte_Im_Lager());
            System.out.println("Standort_ID: " + lager.getStandort_ID());
            /*
            System.out.println("Straße: " + lager.getStraße());
            System.out.println("Hausnummer: " + lager.getHausnummer());
            System.out.println("PLZ: " + lager.getPLZ());
            System.out.println("Ort: " + lager.getOrt());

             */
            System.out.println("Produkt ID: " + lager.getProdukt_ID());
            System.out.println("---------------------------");
        }
    }
}