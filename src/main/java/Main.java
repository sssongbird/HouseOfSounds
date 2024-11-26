import Factory.*;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class Main {
    private static final CopyOnWriteArrayList<Kunden> kundenList = new CopyOnWriteArrayList<>();
    private static final CopyOnWriteArrayList<Produkte> produkteList = new CopyOnWriteArrayList<>();

    private static final GenericDAO<Kunden> kundenDAO = DAOFactory.getDAO(Kunden.class);
    private static final GenericDAO<Produkte> produkteDAO = DAOFactory.getDAO(Produkte.class);

    private static volatile boolean isRunning = false;
    private static Thread dataLoaderThread;

    public static void startDataLoader() {
        if (isRunning) return;

        isRunning = true;
        dataLoaderThread = new Thread(() -> {
            while (isRunning) {
                try {
                    // Alte Daten löschen
                    kundenList.clear();
                    produkteList.clear();

                    // Neue Daten laden
                    kundenList.addAll(kundenDAO.getAll());
                    produkteList.addAll(produkteDAO.getAll());

                    System.out.println("Daten aktualisiert: " +
                            kundenList.size() + " Kunden, " +
                            produkteList.size() + " Produkte");

                    // Wartezeit zwischen Updates
                    Thread.sleep(5000); // Alle 5 Sekunden updaten
                } catch (Exception e) {
                    e.printStackTrace();
                    isRunning = false;
                }
            }
        });

        dataLoaderThread.setDaemon(true);
        dataLoaderThread.start();
    }

    public static void stopDataLoader() {
        isRunning = false;
        if (dataLoaderThread != null) {
            dataLoaderThread.interrupt();
        }
    }

    // Neue Methoden zum manuellen Leeren der Listen
    public static void clearKundenList() {
        kundenList.clear();
    }

    public static void clearProdukteList() {
        produkteList.clear();
    }

    // Getter für andere Klassen
    public static List<Kunden> getKundenList() {
        return kundenList;
    }

    public static List<Produkte> getProdukteList() {
        return produkteList;
    }

    // Hauptmethode zum separaten Ausführen
    public static void main(String[] args) {
        System.out.println("Runtime Data Loader gestartet");
        startDataLoader();

        // Halten des Programms offen
        try {
            // Warten, bis der Thread unterbrochen wird
            while (isRunning) {
                Thread.sleep(1000);
            }
        } catch (InterruptedException e) {
            System.out.println("Runtime Data Loader wurde gestoppt");
        } finally {
            stopDataLoader();
        }
    }
}