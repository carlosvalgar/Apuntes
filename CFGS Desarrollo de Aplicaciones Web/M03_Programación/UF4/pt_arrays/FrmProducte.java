package pt_arrays;

import java.util.Scanner;

public class FrmProducte {
	public static void main(String[] args) {
		ArrayProducte array = new ArrayProducte();
		Scanner s = new Scanner(System.in);
		int opcion;
		
		
		do {
			System.out.println("1. afegir productes evitant repetits\n2. Augmentar el preu dels productes tipus Oficina en un 10%\n3. Eliminar els productes que tinguin estocs zero\n4. Mostrar tots el productes que hi ha a l'ArrayList");
			opcion=s.nextInt();
			switch (opcion) {
			case 1:
				System.out.println("codigo: ");
				array.agregar(s.nextInt());
				break;
				
			case 2:
				for (Producto item : array.a) {
					if (item.getTipus().equalsIgnoreCase("Oficina")) {
						item.setPreu(item.getPreu() * 1.1f);
					}
				}
				
				break;
			case 3:
				for (Producto item : array.a) {
					if (item.getStock() == 0) {
						array.a.remove(item);
					}
				}
				
				
				break;
			case 4:
				for (Producto item : array.a) {
					System.out.println(item.getNombre());
					}
				break;
				}
			
			
		} while (opcion>0 && opcion<5);
	}
}
