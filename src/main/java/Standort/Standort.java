package Standort;

public class Standort {
    private int Standort_ID;
    private String Standortname;
    private String Straße;
    private String Hausnummer;
    private int PLZ;
    private String Ort;

    // Getter und Setter
    public int getStandort_ID() { return Standort_ID; }
    public void setStandort_ID(int standort_ID) { this.Standort_ID = standort_ID; }

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
}