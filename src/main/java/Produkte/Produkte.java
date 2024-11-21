package Produkte;

public class Produkte {
    private int Produkte_ID;
    private double Preis;
    private int Dauer;
    private double Hoehe_Rabatt;
    private String Rabattcode;

    // Getter und Setter
    public int getProdukte_ID() { return Produkte_ID; }
    public void setProdukte_ID(int produkte_ID) { this.Produkte_ID = produkte_ID; }

    public double getPreis() { return Preis; }
    public void setPreis(double preis) { this.Preis = preis; }

    public int getDauer() { return Dauer; }
    public void setDauer(int dauer) { this.Dauer = dauer; }

    public double getHoehe_Rabatt() { return Hoehe_Rabatt; }
    public void setHoehe_Rabatt(double hoehe_Rabatt) { this.Hoehe_Rabatt = hoehe_Rabatt; }

    public String getRabattcode() { return Rabattcode; }
    public void setRabattcode(String rabattcode) { this.Rabattcode = rabattcode; }
}