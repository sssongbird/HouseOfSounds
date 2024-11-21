package FactoryKunden;

import java.util.List;

public class Runner {
    public static void main(String[] args) {
        KundenDAO kundenDAO = new KundenDaoImplement();
        List<Kunden> kunden = kundenDAO.getAllKunden();

        for (Kunden kunde : kunden) {
            System.out.println("Vorname: " + kunde.getVorname());
            System.out.println("Nachname: " + kunde.getNachname());
            System.out.println("Straße: " + kunde.getStraße());
            System.out.println("Hausnummer: " + kunde.getHausnummer());
            // System.out.println("PLZ_ID: " + kunde.getPLZ_ID());

            System.out.println("PLZ: " + kunde.getPLZ());
            System.out.println("Ort: " + kunde.getOrt());


            System.out.println("---------------------------");
        }
    }
}