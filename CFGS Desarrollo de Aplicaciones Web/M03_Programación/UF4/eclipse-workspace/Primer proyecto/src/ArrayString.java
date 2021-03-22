import java.util.Scanner;

public class ArrayString {

	public static void main(String[] args) {
		String [] nombres = {"Sandra", "Aida", "Adrian", "Guillem", "Carlos", "Mart�", "David", "Jesus", "Pau", "Alex", "Andreu"};
		System.out.print("Introduce el nombre a buscar: ");
		String nombreBuscar = "";
		int var_bool = 0;
		Scanner lector = new Scanner(System.in);
		int num = lector.nextInt();
		lector.nextLine(); // Sirve para limpiar el buffer, solo como linea de comandos.
		// next te coje solo una palabra, para pillar mas de uno tienes que pillar con nextLine cuidado porque nextLine() si pilla \n residuales de input hay que limpiarlo
		nombreBuscar = lector.nextLine();
		for(int i = 0; i < nombres.length; i++) {
			var_bool = nombreBuscar.compareToIgnoreCase(nombres[i]);
			System.out.println(var_bool == 0? nombreBuscar + " existe en la posici�n: " + i : nombreBuscar + " no existe en la posici�n: " + i);
		}
		boolean encontrado = false;
		for(int i = 0; i < nombres.length; i++) {
			if(nombreBuscar.equalsIgnoreCase(nombres[i])) {
				System.out.print("Encontrado");
				encontrado = true;
				break;
			}
		}
		if (encontrado == false) {
			System.out.println("No encontrado");
		}
	}
}
