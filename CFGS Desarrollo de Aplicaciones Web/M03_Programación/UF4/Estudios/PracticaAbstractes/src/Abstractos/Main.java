package Abstractos;

public class Main {

	public static void main(String[] args) {
		Nomina nomina = new Nomina();
		nomina.insereixEmpleat(new Neteja("Carolina", "Cornella"));
		nomina.insereixEmpleat(new Neteja("Carolina", "Hospitalet"));
		nomina.insereixEmpleat(new Neteja("Carolina", "Sant Boi"));
		nomina.insereixEmpleat(new Caixer("Carolina", "Cornella", 8));
		nomina.insereixEmpleat(new Mostrador("Carolina", "Hospitalet", 1000));
		nomina.insereixEmpleat(new Neteja("Carolina", "Sant Boi"));
		nomina.insereixEmpleat(new Neteja("Carolina", "Cornella"));
		nomina.insereixEmpleat(new Neteja("Carolina", "Hospitalet"));
		nomina.insereixEmpleat(new Neteja("Carolina", "Sant Boi"));
		nomina.insereixEmpleat(new Neteja("Carolina", "Cornella"));
		nomina.insereixEmpleat(new Neteja("Carolina", "Hospitalet"));
		nomina.insereixEmpleat(new Neteja("Carolina", "Sant Boi"));
		System.out.println(nomina.toString());
		System.out.println(nomina.souPromig());
		System.out.println(nomina.costNomina());
		System.out.println(nomina.quantsCornella());
		nomina.eliminaNeteja();
		System.out.println(nomina.toString());
		System.out.println(nomina.costNomina());
		System.out.println(nomina.quantitatCaixers());
	}
}