import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.util.List;

import Factory.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import Factory.Kunden;
import com.sun.net.httpserver.HttpServer;
/*
erstellt einen Kontext für den Pfad /api/hello und definiert einen Handler für eingehende Anfragen
sendet die http-Statuszeile und die Header. 200 ist der Statuscode für OK
holt den Antwortstrom / schreibt die Antwortnachricht in den Antwortstrom / stellt sicher das alle Daten gesendet werden
schließt danach den Austausch und beendet die Antwort
startet den Server im letzten Schritt
 */
class Application {

    //private static GenericDAO<Kunden> dao = DAOFactory.getDAO(Kunden.class);
    //private static GenericDAO<Produkte> dao2 = DAOFactory.getDAO(Produkte.class);
    static GenericDAO<Kunden> dao = DAOFactory.getDAO(Kunden.class);
    static GenericDAO<Produkte> dao2 = DAOFactory.getDAO(Produkte.class);



    public static void main(String[] args) throws IOException {
        int serverPort = 8000;
        HttpServer server = HttpServer.create(new InetSocketAddress(serverPort), 0);
        server.createContext("/api/hello", (exchange -> {
            String respText = "Hello!";
            exchange.sendResponseHeaders(200, respText.getBytes().length);
            OutputStream output = exchange.getResponseBody();
            output.write(respText.getBytes());
            output.flush();
            exchange.close();
        }));

        server.createContext("/api/items/kunden", (exchange -> {
            if ("GET".equals(exchange.getRequestMethod())) {
                List<Kunden> kunden = dao.getAll();
                Gson gson = new GsonBuilder().setPrettyPrinting().create();
                String response = gson.toJson(kunden);
                exchange.getResponseHeaders().set("Content-Type", "application/json; charset=UTF-8");
                exchange.sendResponseHeaders(200, response.getBytes().length);
                OutputStream output = exchange.getResponseBody();
                output.write(response.getBytes());
                output.flush();
                exchange.close();
            } else {
                exchange.sendResponseHeaders(405, -1); // Method Not Allowed
            }
        }));

        server.createContext("/api/items/produkte", (exchange -> {
            if ("GET".equals(exchange.getRequestMethod())) {
                List<Produkte> produkte = dao2.getAll();
                Gson gson = new GsonBuilder().setPrettyPrinting().create();
                String response = gson.toJson(produkte);
                exchange.getResponseHeaders().set("Content-Type", "application/json; charset=UTF-8");
                exchange.sendResponseHeaders(200, response.getBytes().length);
                OutputStream output = exchange.getResponseBody();
                output.write(response.getBytes());
                output.flush();
                exchange.close();
            } else {
                exchange.sendResponseHeaders(405, -1); // Method Not Allowed
            }
        }));
        server.setExecutor(null); // creates a default executor
        server.start();
    }
}