package FactoryLager;

public class Lager {
    private String Lager_ID;
    private int Anzahl_Produkte_Im_Lager;
    private int Standort_ID;
    private int Produkt_ID;

    // Getter und Setter
    public String getLager_ID() {
        return Lager_ID;
    }

    public void setLager_ID(String lager_ID) {
        this.Lager_ID = lager_ID;
    }

    public int getAnzahl_Produkte_Im_Lager() {
        return Anzahl_Produkte_Im_Lager;
    }

    public void setAnzahl_Produkte_Im_Lager(int anzahl_Produkte_Im_Lager) {
        this.Anzahl_Produkte_Im_Lager = anzahl_Produkte_Im_Lager;
    }

    public int getStandort_ID() {
        return Standort_ID;
    }

    public void setStandort_ID(int standort_ID) {
        this.Standort_ID = standort_ID;
    }

    public int getProdukt_ID() {
        return Produkt_ID;
    }

    public void setProdukt_ID(int produkt_ID) {
        this.Produkt_ID = produkt_ID;
    }
}
