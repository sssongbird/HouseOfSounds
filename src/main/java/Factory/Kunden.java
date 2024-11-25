package Factory;

public class Kunden {
        private String Vorname;
        private String Nachname;
        private String Straße;
        private String Hausnummer;
        private int PLZ;
        private String Ort;



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
        public int getPLZ() {
            return PLZ;
        }
        public void setPLZ(int PLZ) {
            this.PLZ = PLZ;
        }

        public String getOrt() {
            return Ort;
        }

        public void setOrt(String Ort) {
            this.Ort = Ort;
        }

    public String toString() {
        return "Rabatt{" +
                "\nVorname: " + Vorname +
                ", \nNachname: '" + Nachname + '\'' +
                ", \nHoehe_Rabatt: " + Straße +
                ", \nHausnummer: " + Hausnummer +
                ", \nHausnummer: " + Hausnummer + "\n---------------------------";

    }



/*
        public int getPLZ_ID() {
            return PLZ_ID;
        }

        public void setPLZ_ID(int PLZ_ID) {
            this.PLZ_ID = PLZ_ID;
        }
*/


}
