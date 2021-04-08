package Clases;
import java.util.ArrayList;
import java.util.Scanner;

public class FrmPersona {
    public static void main(String[] args) {
       ArrayList<Persona> Personas = new ArrayList<Persona>();
       int opcion, edat;
       String nom, dni;
       float altura;
       char sexe;
       boolean casat, flagBorrar;
       Scanner scan = new Scanner(System.in);


       do {
           System.out.print("1.- Introducir datos para una persona\n2.- Mostrar los datos de las personas almacenadas\n3.- Eliminar una persona de la lista\n4.- Salir\n    > ");
           opcion = scan.nextInt();
           scan.nextLine();

       switch(opcion){
           case 1:
               System.out.print("\nIntroduce los datos de la persona a añadir:\n    Nombre: ");
               nom = scan.nextLine();
               System.out.print("    DNI: ");
               dni = scan.nextLine();
               System.out.print("    Edad: ");
               edat = scan.nextInt();
               System.out.print("    Altura: ");
               altura = scan.nextFloat();
               System.out.print("    Sexo (Una letra): ");
               sexe = scan.next().charAt(0);
               System.out.print("    Casado (): ");
               casat = scan.nextBoolean();
               Personas.add(new Persona(dni, nom, edat, altura, sexe, casat));
               System.out.println("\n" + "=".repeat(30) + "\nPersona introducida con éxito\n" + "=".repeat(30) + "\n");
               break;

           case 2:
               if (Personas.size() == 0) {
                   System.out.println("\n" + "=".repeat(40) + "\nNo hay personas en la base de datos.\n" + "=".repeat(40) + "\n");
               }
               else {
                   System.out.println("\n" + "=".repeat(75));
                   for (Persona persona:Personas) {
                       System.out.println(persona.toString());
                   }
                   System.out.println("=".repeat(75) + "\n");
               }
               break;

           case 3:
               System.out.print("\nIntroduce el DNI de la persona a eliminar:\n    > ");
               dni = scan.nextLine();
               flagBorrar = false;

               for (Persona persona:Personas) {
                   if (persona.getDni().equalsIgnoreCase(dni)) {
                       Personas.remove(persona);
                       flagBorrar = true;
                       System.out.println("\n" + "=".repeat(30) + "\nPersona eliminada con éxito\n" + "=".repeat(30) + "\n");
                       break; // He puesto este break para cuando queda solo 1 elemento en la lista y lo elimina ya que sino al salir del if y aun estar en el for da error, hay una mejor forma de hacerlo?
                   }
               }

               if (!flagBorrar) {
                   System.out.println("\n" + "=".repeat(40) + "\nNo hay ninguna persona con el dni: " + dni + ".\n" + "=".repeat(40) + "\n");
               }

               break;

           case 4:
               System.out.println("\n" + "=".repeat(15) + "\n¡Hasta pronto!\n" + "=".repeat(15) + "\n");
               break;

           default:
               System.out.println("\n" + "=".repeat(25) + "\nERROR: Opción inválida.\n" + "=".repeat(25) + "\n");
               break;
       }

       }while(opcion != 4);

    }
}
