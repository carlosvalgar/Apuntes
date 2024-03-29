import java.util.Arrays;
import java.util.Scanner;

public class ejemplosArrays {

	public static void main(String[] args) {
		// Estos son arrays estáticos por lo que tienes que declarar la cantidad de elementos
		Scanner vector = new Scanner(System.in);
		int [] vectorNum; //Declaración
		vectorNum = new int[10]; //Inicialización
		//En un paso:
		int num[] = new int[5];
		int numeros[]= {1, 2, 3, 4, 5, 6};
		
		numeros[3] = 5000;
		
		for (int i = 0; i < numeros.length; i++) {
			System.out.println("Numero en la posición " + i + " es: " + numeros[i]);
		}
		
		for (int i = 0; i < vectorNum.length; i++) {
			System.out.print("Introduce un número:");
			vectorNum[i] = vector.nextInt();
		}
		
		// Este seria el for normal
		// Que seria como for i in range(len(array))
		for (int i = 0; i < vectorNum.length; i++) {
			System.out.println(vectorNum[i]);
		}
		
		// Este seria el for each
		// Que seria como for i in array
		for(int elemento:vectorNum) {
			System.out.println(elemento);
		}
		
		int SumaNumeros = 0;
		
		for (int i = 0; i < vectorNum.length; i++) {
			SumaNumeros += vectorNum[i];
		}
		System.out.println("El total es: " + SumaNumeros);
		System.out.println(Arrays.toString(vectorNum));
	}
}
