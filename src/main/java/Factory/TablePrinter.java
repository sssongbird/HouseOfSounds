package Factory;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class TablePrinter {
    private static final int MIN_COLUMN_WIDTH = 10;

    public static <T> void printTable(String title, List<T> items) {
        if (items == null || items.isEmpty()) {
            System.out.println("Keine Daten verfügbar für: " + title);
            return;
        }

        // Hole alle Getter-Methoden der Klasse
        Method[] methods = items.get(0).getClass().getMethods();
        List<Method> getters = new ArrayList<>();
        List<String> headers = new ArrayList<>();

        // Filtere die Getter-Methoden
        for (Method method : methods) {
            if (isGetter(method)) {
                getters.add(method);
                // Konvertiere "getPropertyName" zu "Property Name"
                String headerName = method.getName().substring(3)
                        .replaceAll("_", " ")
                        .replaceAll("([A-Z])", " $1")
                        .trim();
                headers.add(headerName);
            }
        }

        // Berechne die optimale Spaltenbreite für jede Spalte
        int[] columnWidths = calculateColumnWidths(items, getters, headers);

        // Erstelle das Format für die Zeilen
        String format = createFormatString(columnWidths);

        // Drucke Titel
        System.out.println("\n=== " + title + " ===\n");

        // Drucke Trennlinie
        printDivider(columnWidths);

        // Drucke Header
        System.out.printf(format, headers.toArray());

        // Drucke Trennlinie
        printDivider(columnWidths);

        // Drucke Daten
        for (T item : items) {
            Object[] rowData = new Object[getters.size()];
            for (int i = 0; i < getters.size(); i++) {
                try {
                    rowData[i] = getters.get(i).invoke(item);
                } catch (Exception e) {
                    rowData[i] = "N/A";
                }
            }
            System.out.printf(format, rowData);
        }

        // Drucke abschließende Trennlinie
        printDivider(columnWidths);
    }

    private static boolean isGetter(Method method) {
        return method.getName().startsWith("get")
                && method.getParameterCount() == 0
                && !method.getName().equals("getClass");
    }

    private static <T> int[] calculateColumnWidths(List<T> items, List<Method> getters, List<String> headers) {
        int[] widths = new int[getters.size()];

        // Initialisiere mit Header-Längen
        for (int i = 0; i < headers.size(); i++) {
            widths[i] = Math.max(MIN_COLUMN_WIDTH, headers.get(i).length());
        }

        // Überprüfe Datenlängen
        for (T item : items) {
            for (int i = 0; i < getters.size(); i++) {
                try {
                    String value = String.valueOf(getters.get(i).invoke(item));
                    widths[i] = Math.max(widths[i], value.length());
                } catch (Exception e) {
                    // Ignoriere Fehler beim Zugriff
                }
            }
        }

        // Füge Padding hinzu
        for (int i = 0; i < widths.length; i++) {
            widths[i] += 2; // Padding links und rechts
        }

        return widths;
    }

    private static String createFormatString(int[] columnWidths) {
        StringBuilder format = new StringBuilder("|");
        for (int width : columnWidths) {
            format.append(" %-").append(width - 1).append("s |");
        }
        format.append("%n");
        return format.toString();
    }

    private static void printDivider(int[] columnWidths) {
        System.out.print("+");
        for (int width : columnWidths) {
            System.out.print("-".repeat(width));
            System.out.print("+");
        }
        System.out.println();
    }
}