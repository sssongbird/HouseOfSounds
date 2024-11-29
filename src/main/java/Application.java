import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.util.List;


import Factory.Kunden;
import Factory.Produkte;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpServer;

public class Application {
    private static final Gson gson = new GsonBuilder().setPrettyPrinting().create();
    private static volatile boolean isRuntimeActive = false;

    public static void main(String[] args) throws IOException {
        // Starten des Dataloaders
        Main.startDataLoader();
        isRuntimeActive = true;

        int serverPort = 8000;
        HttpServer server = HttpServer.create(new InetSocketAddress(serverPort), 0);


        server.createContext("/api/items/kunden", exchange -> {
            if ("GET".equals(exchange.getRequestMethod())) {
                List<Kunden> kunden;


                if (!isRuntimeActive) {
                    Main.clearKundenList();
                    Main.clearProdukteList();
                }

                kunden = Main.getKundenList();


                if (kunden.isEmpty()) {
                    sendResponse(exchange, 404, "Keine Kunden-Daten verfügbar");
                } else {
                    System.out.println("Daten für Kunden-API: " + gson.toJson(kunden));
                    sendJsonResponse(exchange, 200, kunden);
                }
            } else if ("POST".equals(exchange.getRequestMethod())) {
                try {
                    String requestBody = new String(exchange.getRequestBody().readAllBytes());
                    Kunden newKunde = gson.fromJson(requestBody, Kunden.class);
                    Main.kundenDAO.save(newKunde);

                    sendJsonResponse(exchange, 201, "Kunde erfolgreich hinzugefügt");

                } catch (Exception e) {
                    sendResponse(exchange, 400, "Fehler beim Hinzufügen des Kunden: " + e.getMessage());

                }


            } else {
                sendResponse(exchange, 405, "Method Not Allowed");
            }
        });

        server.createContext("/api/items/produkte", exchange -> {
            /**
             * Check if subpath  or Filter
             *  if yes => route to Filter/getBy... Logic
             *  if not => run normal logic
             */


            if ("GET".equals(exchange.getRequestMethod())) {
                List<Produkte> produkte;

                if (!isRuntimeActive) {
                    Main.clearProdukteList();
                    Main.clearKundenList();
                }

                produkte = Main.getProdukteList();

                if (produkte.isEmpty()) {
                    sendResponse(exchange, 404, "Keine Produkte-Daten verfügbar");
                } else {
                    System.out.println("Daten für Produkte-API: " + gson.toJson(produkte));
                    sendJsonResponse(exchange, 200, produkte);
                }
            } else if ("POST".equals(exchange.getRequestMethod())) {
                try {
                    String requestBody = new String(exchange.getRequestBody().readAllBytes());
                    Produkte newProdukte = gson.fromJson(requestBody, Produkte.class);
                    Main.produkteDAO.save(newProdukte);

                    sendJsonResponse(exchange, 201, "Produkt erfolgreich hinzugefügt");

                } catch (Exception e) {
                    sendResponse(exchange, 400, "Fehler beim Hinzufügen des Kunden: " + e.getMessage());

                }
            } else {
                sendResponse(exchange, 405, "Method Not Allowed");
            }
        });

        server.createContext("/api/items/produkte/id/", exchange -> {
            if ("GET".equals(exchange.getRequestMethod())) {
                // Extrahiere die ID aus dem Pfad
                String path = exchange.getRequestURI().getPath();
                String[] pathParts = path.split("/");
                if (pathParts.length > 5) {
                    String idString = pathParts[5];

                    System.out.println("Extrahierte Pfad: " + path);
                    System.out.println("Extrahierte ID: " + idString);


                    try {
                        int id = Integer.parseInt(idString);

                        if (!isRuntimeActive) {
                            Main.clearProdukteList();
                            Main.clearKundenList();
                        }

                        Produkte produkt = Main.produkteDAO.getById(id);

                        System.out.println("Gefundenes Produkt: " + produkt);

                        if (produkt != null) {
                            System.out.println("Daten für Produkt-ID " + id + ": " + gson.toJson(produkt));
                            sendJsonResponse(exchange, 200, produkt);
                        } else {
                            sendResponse(exchange, 404, "Produkt mit ID " + id + " nicht gefunden");
                        }
                    } catch (NumberFormatException e) {
                        sendResponse(exchange, 400, "Ungültige Produkt-ID");
                    }
                } else {
                    sendResponse(exchange, 400, "ID fehlt im Pfad");
                }
            } else {
                sendResponse(exchange, 405, "Method Not Allowed");
            }
        });

        server.createContext("/api/items/kunden/id/", exchange -> {
            if ("GET".equals(exchange.getRequestMethod())) {
                // Extrahiere die ID aus dem Pfad
                String path = exchange.getRequestURI().getPath();
                String[] pathParts = path.split("/");
                if (pathParts.length > 5) {
                    String idString = pathParts[5];

                    System.out.println("Extrahierte Pfad: " + path);
                    System.out.println("Extrahierte ID: " + idString);


                    try {
                        int id = Integer.parseInt(idString);

                        if (!isRuntimeActive) {
                            Main.clearProdukteList();
                            Main.clearKundenList();
                        }

                        Produkte produkt = Main.produkteDAO.getById(id);

                        System.out.println("Gefundenes Produkt: " + produkt);

                        if (produkt != null) {
                            System.out.println("Daten für Produkt-ID " + id + ": " + gson.toJson(produkt));
                            sendJsonResponse(exchange, 200, produkt);
                        } else {
                            sendResponse(exchange, 404, "Produkt mit ID " + id + " nicht gefunden");
                        }
                    } catch (NumberFormatException e) {
                        sendResponse(exchange, 400, "Ungültige Produkt-ID");
                    }
                } else {
                    sendResponse(exchange, 400, "ID fehlt im Pfad");
                }
            } else {
                sendResponse(exchange, 405, "Method Not Allowed");
            }
        });


        server.createContext("/api/items/kunden/update", exchange -> {
            if ("PUT".equals(exchange.getRequestMethod())) {
                try {
                    // Request Body auslesen
                    String requestBody = new String(exchange.getRequestBody().readAllBytes());

                    // JSON in Kunden-Objekt umwandeln
                    Kunden updateKunde = gson.fromJson(requestBody, Kunden.class);

                    // Überprüfen, ob eine ID vorhanden ist
                    if (updateKunde.getKunden_ID() == -1) {
                        sendResponse(exchange, 400, "Keine Kunden-ID für Update angegeben");
                        return;
                    }

                    // Versuch des Updates über DAO
                    Main.kundenDAO.update(updateKunde);


                    sendJsonResponse(exchange, 200, "Kunde erfolgreich aktualisiert");

                } catch (Exception e) {
                    sendResponse(exchange, 500, "Fehler beim Update des Kunden: " + e.getMessage());
                }
            } else {
                sendResponse(exchange, 405, "Method Not Allowed");
            }
        });

        server.createContext("/api/items/produkte/update", exchange -> {
            if ("PUT".equals(exchange.getRequestMethod())) {
                try {

                    String requestBody = new String(exchange.getRequestBody().readAllBytes());


                    Produkte updateProdukt = gson.fromJson(requestBody, Produkte.class);


                    if (updateProdukt.getProdukte_ID() == -1) {
                        sendResponse(exchange, 400, "Keine Produkt-ID für Update angegeben");
                        return;
                    }


                    Main.produkteDAO.update(updateProdukt);

                    sendJsonResponse(exchange, 200, "Produkt erfolgreich aktualisiert");

                } catch (Exception e) {
                    sendResponse(exchange, 500, "Fehler beim Update des Produkts: " + e.getMessage());
                }
            } else {
                sendResponse(exchange, 405, "Method Not Allowed");
            }
        });

        server.createContext("/api/items/kunden/delete", exchange -> {
            if ("DELETE".equals(exchange.getRequestMethod())) {
                try {
                    String requestBody = new String(exchange.getRequestBody().readAllBytes());

                    Kunden deleteKunde = gson.fromJson(requestBody, Kunden.class);

                    if (deleteKunde.getKunden_ID() == -1) {
                        sendResponse(exchange, 400, "Keine Kunden-ID für Delete angegeben");
                        return;
                    }

                    Main.kundenDAO.delete(deleteKunde);

                    sendJsonResponse(exchange, 200, "Kunde erfolgreich gelöscht");

                } catch (Exception e) {
                    sendResponse(exchange, 500, "Fehler beim Löschen des Kunden: " + e.getMessage());
                }
            } else {
                sendResponse(exchange, 405, "Method not allowed");
            }
        });

        server.createContext("/api/items/produkte/delete", exchange -> {
            if ("DELETE".equals(exchange.getRequestMethod())) {

                try {
                    String requestBody = new String(exchange.getRequestBody().readAllBytes());

                    Produkte deleteProdukt = gson.fromJson(requestBody, Produkte.class);

                    if (deleteProdukt.getProdukte_ID() == -1) {
                        sendResponse(exchange, 400, "Keine Produkt-ID für Delete angegeben");
                        return;
                    }

                    Main.produkteDAO.delete(deleteProdukt);

                    sendJsonResponse(exchange, 200, "Produkt erfolgreich gelöscht");
                } catch (Exception e) {
                    sendJsonResponse(exchange, 500, "Fehler beim Löschen des Produkt: " + e.getMessage());
                }
            } else {
                sendResponse(exchange, 405, "Method not allowed");
            }

        });

        server.setExecutor(null);
        server.start();
        System.out.println("REST-API läuft auf Port " + serverPort);
    }

    private static void sendJsonResponse(HttpExchange exchange, int statusCode, Object data) {
        try {
            String jsonResponse = gson.toJson(data);
            exchange.getResponseHeaders().set("Content-Type", "application/json; charset=UTF-8");
            exchange.sendResponseHeaders(statusCode, jsonResponse.getBytes().length);
            try (OutputStream output = exchange.getResponseBody()) {
                output.write(jsonResponse.getBytes());
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            exchange.close();
        }
    }

    private static void sendResponse(HttpExchange exchange, int statusCode, String responseText) {
        try {
            byte[] responseBytes = responseText.getBytes();
            exchange.sendResponseHeaders(statusCode, responseBytes.length);
            try (OutputStream output = exchange.getResponseBody()) {
                output.write(responseBytes);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            exchange.close();
        }
    }
}