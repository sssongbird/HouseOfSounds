package Factory;

public class Kunden {
        private String Vorname;
        private String Nachname;
        private String Straße;
        private String Hausnummer;
        private int PLZ_ID;

        // private int PLZ_ID;

        // Getter und Setter
        public String getVorname() {
            return Vorname;
        }

        public void setVorname(String Vorname) {
            this.Vorname = Vorname;
        }

        public String getNachname() {
            return Nachname;
        }

        public void setNachname(String Nachname) {
            this.Nachname = Nachname;
        }

        public String getStraße() {
            return Straße;
        }

        public void setStraße(String Straße) {
            this.Straße = Straße;
        }

        public String getHausnummer() {
            return Hausnummer;
        }

        public void setHausnummer(String Hausnummer) {
            this.Hausnummer = Hausnummer;
        }


        public int getPLZ_ID(){
            return PLZ_ID;
        }

        public void setPLZ_ID(int PLZ_ID) {
            this.PLZ_ID = PLZ_ID;
        }

    @Override
    public String toString() {
        return  "Vorname: " + Vorname +
                ", Nachname: " + Nachname +
                ", Straße: " + Straße +
                ", Hausnummer: " + Hausnummer +
                ", PLZ: " + PLZ_ID;
    }
}

