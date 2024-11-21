package FactoryProdukte;

import Factory.Rabatt;

public class Produkte {
    private int Produkte_ID;
    private double Preis;
    //private int Rabatt_ID; //Foreign Key from table rabatt
    private String Rabattcode;
    private double Hoehe_Rabatt;
    private Integer Dauer;


    public int getProdukte_ID() {
        return Produkte_ID;
    }

    public void setProdukte_ID(int Produkte_ID) {
        this.Produkte_ID = Produkte_ID;
    }

    public double getPreis() {
        return Preis;
    }

    public void setPreis(int Preis) {
        this.Preis = Preis;
    }
    /*
    public int getRabatt_ID() {
        return Rabatt_ID;
    }

    public void setRabatt_ID(int Rabatt_ID) {
        this.Rabatt_ID = Rabatt_ID;
    }
    */
    public String getRabattcode() {
        return Rabattcode;
    }

    public void setRabattcode(String Rabattcode) {
        this.Rabattcode = Rabattcode;
    }

    public Double getHoehe_Rabatt() {
        return Hoehe_Rabatt;
    }

    public void setHoehe_Rabatt(double Hoehe_Rabatt) {
        this.Hoehe_Rabatt = Hoehe_Rabatt;
    }

    public Integer getDauer() {
        return Dauer;
    }

    public void setDauer(Integer Dauer) {
        this.Dauer = Dauer;
    }


}
