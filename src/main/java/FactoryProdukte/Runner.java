package FactoryProdukte;

import java.util.List;

public class Runner {
    public static void main(String[] args) {
        ProdukteDAO produkteDAO = new ProdukteDAOImpl();
        List<Produkte> produkt = produkteDAO.getAllProdukte();



        for (Produkte produkte : produkt) {
            System.out.println("ID: " + produkte.getProdukte_ID());
            System.out.println("Preis: " + produkte.getPreis());
            //System.out.println("Rabatt_ID " + produkte.getRabatt_ID());
            System.out.println("Rabattcode: " + produkte.getRabattcode());
            System.out.println("Höhe des Rabattes: " + produkte.getHoehe_Rabatt());
            System.out.println("Dauer: " + produkte.getDauer() + " Tage");


            System.out.println("--------------------------------------------------------------");
        }
    }
}
