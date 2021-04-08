package Pt_ArrayList_Exe2;

import java.util.ArrayList;
import java.util.Scanner;

public class FrmFigures {

	public static void main(String[] args) {
		ArrayList<Figura> Figuras = new ArrayList<Figura>();
		int opcion, triangle, cercle, quadrat;
		String color;
		double base, altura, radi, costat, areaCercles;
		Scanner scan = new Scanner(System.in);
		
		do {
			System.out.println("1.- Afegir Triangle\n2.- Afegir Cercle\n3.- Afegir Quadrat\n4.- Contar Figures\n5.- Suma de àrees dels cercles\n6.- Sortir\n    > ");
			opcion = scan.nextInt();
			scan.nextLine();
			switch(opcion) {
			case 1:
				System.out.print("Afegeix el color del triangle:\n    > ");
				color = scan.nextLine();
				System.out.print("Afegeix la base del triangle:\n    > ");
				base = scan.nextInt();
				System.out.print("Afegeix l'altura del triangle:\n    > ");
				altura = scan.nextInt();
				Figuras.add(new Triangle(base, altura, color));
				System.out.println("\n====================\nTriangle afegit.\n====================\n");
				break;
				
			case 2:
				System.out.print("Afegeix el color del cercle:\n    > ");
				color = scan.nextLine();
				System.out.print("Afegeix el radi del cercle:\n    > ");
				radi = scan.nextInt();
				Figuras.add(new Cercle(radi, color));
				System.out.println("\n====================\nCercle afegit.\n====================\n");
				break;
				
			case 3:
				System.out.print("Afegeix el color del quadrat:\n    > ");
				color = scan.nextLine();
				System.out.print("Afegeix el costat del quadrat:\n    > ");
				costat = scan.nextInt();
				Figuras.add(new Quadrat(costat, color));
				System.out.println("\n====================\nQuadrat afegit.\n====================\n");
				break;
				
			case 4:
				triangle = 0;
				cercle = 0;
				quadrat = 0;
				
				for (Figura item:Figuras) {
					if (item instanceof Triangle) {
						triangle++;
					}
					
					else if (item instanceof Cercle) {
						cercle++;
					}
					
					else if (item instanceof Quadrat) {
						quadrat++;
					}
				}
				System.out.println("\n=========================\nHi ha " + triangle + " triangles.\nHi ha " + cercle + " cercles.\nHi ha " + quadrat + " quadrats.\n=========================\n");
				break;
				
			case 5:
				areaCercles = 0;
				for (Figura item:Figuras)
					if (item instanceof Cercle) {
						areaCercles += item.getArea();
					}
				System.out.println("\n==================================================\nLa suma del àrea de tots els cercles es de: " + String.format("%.2f", areaCercles) + ".\n==================================================\n");
				break;
				
			case 6:
				break;
				
			default:
				System.out.println("ERROR: Opció invàlida.");
				break;			
			}
		} while(opcion != 6);
		scan.close();
	}
}