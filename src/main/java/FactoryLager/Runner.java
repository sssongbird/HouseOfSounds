package FactoryLager;

import java.util.List;

public class Runner {
    public static void main(String[] args) {
        LagerDAO lagerDAO = new LagerDaoImplement();
        List<Lager> lagerList = lagerDAO.getAllLager();

        for (Lager lager : lagerList) {
            System.out.println("Lager ID: " + lager.getLager_ID());
            System.out.println("Anzahl Produkte im Lager: " + lager.getAnzahl_Produkte_Im_Lager());
            System.out.println("Standortname: " + lager.getStandortname());
            System.out.println("Straße: " + lager.getStraße());
            System.out.println("Hausnummer: " + lager.getHausnummer());
            System.out.println("PLZ: " + lager.getPLZ());
            System.out.println("Ort: " + lager.getOrt());
            System.out.println("Produkt ID: " + lager.getProdukt_ID());
            System.out.println("---------------------------");
        }
    }
}
