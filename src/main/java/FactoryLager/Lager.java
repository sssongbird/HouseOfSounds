package FactoryLager;

public class Lager {
    private String Lager_ID;
    private int Anzahl_Produkte_Im_Lager;
    private String Standortname;
    private String Straße;
    private String Hausnummer;
    private int PLZ;
    private String Ort;
    private int Produkt_ID;

    // Getter und Setter
    public String getLager_ID() { return Lager_ID; }
    public void setLager_ID(String lager_ID) { this.Lager_ID = lager_ID; }

    public int getAnzahl_Produkte_Im_Lager() { return Anzahl_Produkte_Im_Lager; }
    public void setAnzahl_Produkte_Im_Lager(int anzahl_Produkte_Im_Lager) { this.Anzahl_Produkte_Im_Lager = anzahl_Produkte_Im_Lager; }

    public String getStandortname() { return Standortname; }
    public void setStandortname(String standortname) { this.Standortname = standortname; }

    public String getStraße() { return Straße; }
    public void setStraße(String straße) { this.Straße = straße; }

    public String getHausnummer() { return Hausnummer; }
    public void setHausnummer(String hausnummer) { this.Hausnummer = hausnummer; }

    public int getPLZ() { return PLZ; }
    public void setPLZ(int PLZ) { this.PLZ = PLZ; }

    public String getOrt() { return Ort; }
    public void setOrt(String ort) { this.Ort = ort; }

    public int getProdukt_ID() { return Produkt_ID; }
    public void setProdukt_ID(int produkt_ID) { this.Produkt_ID = produkt_ID; }
}
