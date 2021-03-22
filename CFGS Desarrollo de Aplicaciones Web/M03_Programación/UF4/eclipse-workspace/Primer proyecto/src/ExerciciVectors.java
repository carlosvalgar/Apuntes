import java.util.Scanner;

public class ExerciciVectors {

	public static void main(String[] args) {
		int numeroDNI;
		int residuDNI;
		char lletraDNI[] = {'T', 'R', 'W', 'A', 'G', 'H', 'Y', 'F', 'P', 'D', 'X', 'B', 'N', 'J', 'Z', 'S', 'Q', 'V', 'H', 'L', 'L', 'C', 'K', 'E'};
		Scanner lector = new Scanner(System.in);
		System.out.print("Introduce el número de tu DNI: ");
		numeroDNI = lector.nextInt();
		residuDNI = numeroDNI % 23;
		System.out.println("La letra de tu DNI es: " + lletraDNI[residuDNI]);

	}

}
