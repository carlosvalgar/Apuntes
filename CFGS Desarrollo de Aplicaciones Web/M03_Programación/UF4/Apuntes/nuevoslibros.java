import java.util.Scanner;

public class nuevoslibros {

	public static void main(String[] args) {
		Materiales vectorMat[] = new Materiales[3];
		int i = 0, opcion;
		Scanner scan = new Scanner(System.in);
		String autor, titol, nomDiscografica;
		int codi, numeroPaginas;
		
		do {
			System.out.println("1.- Libros\n2.- Discos\nElige una opción: ");
			opcion = scan.nextInt();
			scan.nextLine();
			switch(opcion) {
			case 1:
				System.out.println("Autor: ");
				autor = scan.nextLine();
				System.out.println("Títol: ");
				titol = scan.nextLine();
				System.out.println("Codi: ");
				codi = scan.nextInt();
				System.out.println("Numero de páginas: ");
				numeroPaginas = scan.nextInt();
				scan.nextLine();
				vectorMat[i] = new Libros(codi, autor, titol, numeroPaginas);
				i++;
				break;
				
			case 2:
				System.out.println("Autor: ");
				autor = scan.nextLine();
				System.out.println("Títol: ");
				titol = scan.nextLine();
				System.out.println("Codi: ");
				codi = scan.nextInt();
				scan.nextLine();
				System.out.println("Nom Discografica: ");
				nomDiscografica = scan.nextLine();
				vectorMat[i] = new Discos(codi, autor, titol, nomDiscografica);
				i++;
			break;
			}
			
		}while(i<= 2);
		
		for(Materiales objeto:vectorMat) {
			System.out.println(objeto);
		}
	}

}
