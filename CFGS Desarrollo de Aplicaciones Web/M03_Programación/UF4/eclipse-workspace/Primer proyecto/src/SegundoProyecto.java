import java.util.Scanner;

public class SegundoProyecto {

	public static void main(String[] args) {
		Scanner lector = new Scanner(System.in);
		int opcio = 0;
        float digit1 = 0;
        float digit2 = 0;
        
        do {
        	opcio = menu();
            switch(opcio){
                case 1:
                    System.out.println("Suma: " + suma());
                    break;
                    
                case 2:
                    System.out.println("Resta: " + resta());
                    break;

                case 3:
                    System.out.println("Multiplicación: " + multiplicacion());
                    break;
                    
                case 4:
                	System.out.println("División: " + division());
                    break;
                    
                case 5:
                    System.out.println("¡Hasta luego!");
                    break;

                default:
                    System.out.println("Introduce una de las opciones válidas");
                    break;
            }
            
        } while(opcio != 5); 
	}
	
	public static int menu() {
        int opcio = 0;
		Scanner lector = new Scanner(System.in);
		
        System.out.print("CALCULADORA\nMenu Principal\n\n1.- Sumar\n2.- Restar\n3.- Multiplicar\n4.- Dividir\n5.- Sortir\n\nOpció: ");
        opcio = lector.nextInt();
        
        return opcio;
	}
	
	public static float suma() {
		Scanner lector = new Scanner(System.in);
        float digit1 = 0;
        float digit2 = 0;
        System.out.print("Introdueix el primer número: ");
        digit1 = lector.nextFloat();
        System.out.print("Introdueix el segon número: ");
        digit2 = lector.nextFloat();
        return (digit1 + digit2);
	}
	
	public static float resta() {
		Scanner lector = new Scanner(System.in);
        float digit1 = 0;
        float digit2 = 0;
        System.out.print("Introdueix el primer número: ");
        digit1 = lector.nextFloat();
        System.out.print("Introdueix el segon número: ");
        digit2 = lector.nextFloat();
        return (digit1 - digit2);
	}
	
	public static float multiplicacion() {
		Scanner lector = new Scanner(System.in);
        float digit1 = 0;
        float digit2 = 0;
        System.out.print("Introdueix el primer número: ");
        digit1 = lector.nextFloat();
        System.out.print("Introdueix el segon número: ");
        digit2 = lector.nextFloat();
        return (digit1 * digit2);
	}
	
	public static float division() {
		Scanner lector = new Scanner(System.in);
        float digit1 = 0;
        float digit2 = 0;
        System.out.print("Introdueix el primer número: ");
        digit1 = lector.nextFloat();
        System.out.print("Introdueix el segon número: ");
        digit2 = lector.nextFloat();
        if(digit2 == 0) {
        	System.out.println("No se puede dividir entre 0");
        	return 0;
        }
        else {
            System.out.print("División: ");
            return (digit1 / digit2);
        }
	}
}
