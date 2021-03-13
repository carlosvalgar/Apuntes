import java.util.Scanner;

public class PrimeraClase {

	public static void main(String[] args) {
		/*
		System.out.println("Hola mundo!!");
		// enteros byte, short, int, long
		// decimales float, double
		// boolean (true y false)
		// letras char
		// "a" -> es una string, 'a' -> es un char
		
		int numero = 99;
		float preu = 58.4f; // Por defecto un decimal es un double, y como un double no cabe en un float da a error, por ello hay que indicar que es un float
		double preuGran = 78.5;
		boolean pregunta = true;
		char letra = 'a';
		String frase = "Hola mundo";
		System.out.print(numero+preu);
		*/

		Scanner lector = new Scanner(System.in);
		
		/*
		System.out.println("Entra un número: ");
		numero = lector.nextInt();
		
		if (numero > 0 && numero < 10) {
			System.out.println("Mayor que cero entre 0 y 10");
		}
		
		else if (numero >= 10 && numero < 20) {
			System.out.println("Mayor o igual a 10 y menor que 20");
		}
		
		else if (numero >= 20) {
			System.out.println("Mayor o igual que 20");
		}
		
		else 
			System.out.println("Menor o igual que cero");
	
		int opcion = lector.nextInt();
		switch(opcion) {
		case 1:
			int suma = 6 + 3;
			System.out.println(suma);
			break;
			
		case 2:
			int producto = 6 * 3;
			System.out.println(producto);
			break;
			
		case 3:
			float division = 6 / 3;
			System.out.println(division);
			break;
			
		default:
			System.out.println("Que peresita.");
			break;
		
		}
		*/
		/*
		// Estructuras repetitivas i++ = i + 1 = i += 1, i-- = i -1 = i -= 1 
		// las variables que se declaran para un bloque se quedan dentro del bloque, no vas a poder usarla fuera
		for(int i = 0; i < 20; i++) {
			System.out.println(i + 1 + ".- Hola");
		}

		// El while se tiene que declarar fuera y aumentar el valor dentro del bucle

		int i = 0;
		while(i < 20) {
			System.out.println(i + 1 + ".- Hola");
			i++;
		}

		int numero = 0;
		do {
			System.out.println("Entra un número: ");
			numero = lector.nextInt();
		}while(numero < 0);
		
		System.out.println(numero);
		*/
		

	}
}
