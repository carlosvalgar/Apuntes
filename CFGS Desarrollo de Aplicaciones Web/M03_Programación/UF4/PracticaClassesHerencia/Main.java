package PracticaClassesHerencia;

public class Main {

	public static void main(String[] args) {
		Electrodomestic electrodomestics[] = new Electrodomestic [10];
		double preuFinalElectrodomestics = 0;
		double preuFinalRentadores = 0;
		double preuFinalTelevisions = 0;
		
		electrodomestics[0] = new Televisio((float)200.00, "Negre", 'A', 5, 15, false);
		electrodomestics[1] = new Electrodomestic((float)100.00, "Verd", 'B', 10);
		electrodomestics[2] = new Rentadora((float)160.00, "Vermell", 'C', 15, 15);
		electrodomestics[3] = new Televisio((float)1000.00, "Blau", 'D', 20, 25, true);
		electrodomestics[4] = new Rentadora((float)130.00, "Marró", 'E', 25, 30);
		electrodomestics[5] = new Electrodomestic((float)30.00, "Blanc", 'F', 30);
		electrodomestics[6] = new Televisio((float)100.00, "Groc", 'G', 35, 35, true);
		electrodomestics[7] = new Televisio((float)200.00, "Gris", 'H', 40, 27, false);
		electrodomestics[8] = new Rentadora((float)300.00, "Taronja", 'I', 45, 45);
		electrodomestics[9] = new Televisio((float)500.00, "Lila", 'J', 50, 40, true);
		
		
		
		
		for (Electrodomestic electrodomestic:electrodomestics) {
			if(electrodomestic instanceof Rentadora) {
				electrodomestic.preuFinal();
				preuFinalRentadores += electrodomestic.getPreuBase();
				preuFinalElectrodomestics += electrodomestic.getPreuBase();
			}
			
			else if (electrodomestic instanceof Televisio) {
				electrodomestic.preuFinal();
				preuFinalTelevisions += electrodomestic.getPreuBase();
				preuFinalElectrodomestics += electrodomestic.getPreuBase();
			}
			
			else {
				electrodomestic.preuFinal();
				preuFinalElectrodomestics += electrodomestic.getPreuBase();
			}
		}
		
		System.out.println("El preu total dels electrodomestics es: " + preuFinalElectrodomestics + "\nEl preu total de les rentadores es: " + preuFinalRentadores + "\nEl preu total dels televisors es: " + preuFinalTelevisions);
		
	}

}
