package Standort;

import java.util.List;

public class Runner {
    public static void main(String[] args) {
        StandortDAO standortDAO = new StandortDaoImplement();
        List<Standort> standorte = standortDAO.getAllStandorte();

        for (Standort standort : standorte) {
            System.out.println("Standort ID: " + standort.getStandort_ID());
            System.out.println("Standortname: " + standort.getStandortname());
            System.out.println("Straße: " + standort.getStraße());
            System.out.println("Hausnummer: " + standort.getHausnummer());
            System.out.println("PLZ: " + standort.getPLZ());
            System.out.println("Ort: " + standort.getOrt());
            System.out.println("---------------------------");
        }
    }
}
