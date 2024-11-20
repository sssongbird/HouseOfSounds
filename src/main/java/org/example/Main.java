package org.example;
import Factory.Rabatt;
import Factory.RabattDAO;
import Factory.RabattDAOImpl;

import java.util.List;


public class Main {
    public static void main(String[] args) {

        RabattDAO rabattDAO = new RabattDAOImpl();
        List<Rabatt> rabatte = rabattDAO.getAllRabatt();

        for (Rabatt rabatt : rabatte) {
            System.out.println("ID: " + rabatt.getRabatt_ID());
            System.out.println("Rabattcode: " + rabatt.getRabattcode());
            System.out.println("Höhe des Rabattes: " + rabatt.getHoehe_Rabatt());
            System.out.println("Dauer: " + rabatt.getDauer());
            System.out.println("--------------------------------------------------------------");
        }
    }
}