package FactoryPLZ;


import java.util.List;

public class Runner {
    public static void main(String[] args) {


        PLZDAO plzdao = new PLZDAOImpl();
        List<PLZ> plzs = plzdao.getAllPLZ();

        for (PLZ plz : plzs) {
            System.out.println("ID: " + plz.getPLZ_ID());
            System.out.println("PLZ: " + plz.getPLZ());
            System.out.println("Ort: " + plz.getORT());
            System.out.println("--------------------------------------------------------------");
        }
    }
}
