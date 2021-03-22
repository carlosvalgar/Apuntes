import java.util.Scanner;

public class SegundaClase {
    public static void main(string[] args) {
        Scanner lector = new Scanner(System.in);
        
        int opcio = 0;
        int digit1 = 0;
        int digit2 = 0;

        while(opcio != 5){
            System.out.print("CALCULADORA\nMenu Principal\n\n1.- Sumar\n2.- Restar\n3.- Multiplicar\n4.- Dividir\n5.- Sortir\n\nOpció: ");
            opcio = lector.nextInt();
            switch(opcio){
                case 1:
                    System.out.print("Introdueix el primer número: ");
                    digit1 = lector.nextInt();
                    System.out.print("Introdueix el segon número: ");
                    digit2 = lector.nextInt();
                    System.out.print("Suma: ");
                    System.out.println(digit1 + digit2);
                    break;

                case 2:
                    System.out.print("Introdueix el primer número: ");
                    digit1 = lector.nextInt();
                    System.out.print("Introdueix el segon número: ");
                    digit2 = lector.nextInt();
                    System.out.print("Resta: ");
                    System.out.println(digit1 - digit2);
                    break;

                case 3:
                    System.out.print("Introdueix el primer número: ");
                    digit1 = lector.nextInt();
                    System.out.print("Introdueix el segon número: ");
                    digit2 = lector.nextInt();
                    System.out.print("Multiplicación: ");
                    System.out.println(digit1 * digit2);
                    break;
                    
                case 4:
                    System.out.print("Introdueix el primer número: ");
                    digit1 = lector.nextInt();
                    System.out.print("Introdueix el segon número: ");
                    digit2 = lector.nextInt();
                    System.out.print("División: ");
                    System.out.println((double) digit1 / digit2);
                    break;
                    
                case 5:
                    System.out.println("¡Hasta luego!");
                    break;

                default:
                    System.out.println("Introduce una de las opciones válidas");
                    break;
            }
        }

    }
}
