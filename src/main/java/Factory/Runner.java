package Factory;

import FactoryLager.Lager;
import FactoryLager.LagerDaoImplement;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

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
        Scanner scanner = new Scanner(System.in);
        boolean continueProgram = true;



        while (continueProgram) {
            // Menü anzeigen
            System.out.println("\n=== House of Sounds Datenbankabfrage ===");
            System.out.println("Bitte wählen Sie eine Tabelle zur Anzeige:");
            System.out.println("1. Lagerbestand");
            System.out.println("2. Produkte");
            System.out.println("3. Kunden");
            System.out.println("0. Programm beenden");
            System.out.print("\nIhre Wahl: ");

            // Benutzereingabe einlesen
            String choice = scanner.nextLine().trim();

            // Eingabe verarbeiten
            switch (choice) {
                case "1":
                    System.out.println("\nLade Lagerbestand...");
                    TablePrinter.printTable("Lagerbestand House of Sounds", lagerDao.getAll());
                    break;

                case "2":
                    System.out.println("\nFunktion noch nicht implementiert.");
                    // Sobald ProduktDao implementiert ist:
                    // TablePrinter.printTable("Produkte House of Sounds", produktDao.getAll());
                    break;

                case "3":
                    System.out.println("\nFunktion noch nicht implementiert.");
                    // Sobald KundeDao implementiert ist:
                    // TablePrinter.printTable("Kunden House of Sounds", kundeDao.getAll());
                    break;

                case "0":
                    continueProgram = false;
                    System.out.println("\nProgramm wird beendet. Auf Wiedersehen!");
                    break;

                default:
                    System.out.println("\nUngültige Eingabe! Bitte wählen Sie eine Zahl zwischen 0 und 3.");
                    break;
            }

            if (continueProgram) {
                System.out.println("\nDrücken Sie ENTER, um fortzufahren...");
                scanner.nextLine();
            }
        }

        scanner.close();
    }


    }

