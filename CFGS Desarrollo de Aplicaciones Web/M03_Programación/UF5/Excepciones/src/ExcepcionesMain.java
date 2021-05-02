import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class ExcepcionesMain {
    public static void main(String[] args) {
        // Excepcion de no obligada captura
        int num1 = 9, num2 = 0;
        String mail;
        // System.out.println(num1/num2);

        // Excepcion de obligada captura
        try { // Podemos utilizar try / catch en metodos sin problema, trata el error que se genera
            accederFichero();
            // System.out.println("La division es: " + num1 / num2); // Aqui generamos una división entre 0
            Scanner sc = new Scanner(System.in);
            System.out.print("Mail: ");
            mail = sc.nextLine();
            comprobarMail(mail);

        } catch (FileNotFoundException e) {
            e.printStackTrace(); // Cuando se acabe de realizar el programa esto deberia eliminarse de todos los try / catch
            System.out.println(e.getMessage());

        } catch (ArithmeticException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());

        } catch (MailException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());

        } catch (Exception e) {
            System.out.println("Error 2");

        } finally {
            // Este trozo de código siempre se va a ejecutar
            System.out.println("Finally");

        }
    }

    public static void accederFichero() throws FileNotFoundException /*, Siguiente error, siguiente error... etc */ { // Indica que este metodo es suceptible de lanzar un error, en este caso un FileNotFoundException, no lo trata
        Scanner sc = new Scanner(new File("src/numeros.txt")); // El objeto File nos sirve para leer un archivo
        // sc = new Scanner(new File("src/nmeros.txt")); // Este la ruta esta mal aposta
        for (int i = 0; i < 4; i++) {
            System.out.println(sc.nextInt());
        }
    }

    public static void comprobarMail(String mail) throws MailException {
        int punto = 0, arroba = 0;
        for (int i = 0; i < mail.length(); i++) {
            if (mail.charAt(i) == '.') punto++;
            else if (mail.charAt(i) == '@') arroba++;

        }
        if (punto == 1 && arroba == 1) System.out.println("Correcto");
        else /* System.out.println("Incorrecto") */ throw new MailException("Has introducido un mail incorrecto");

    }

}
class MailException extends Exception /* Puede estar en el mismo archivo o en una clase aparte */{
    public MailException() { // Al llamar el constructor vacio el mensaje cuando utilicemos el getMessage es null

    }
    public MailException(String texto) {
        super(texto); // Al llamar el constructor de Exception (Clase padre) al pasarle el texto, sera el que nos printara cuando utilicemos el printStackTrace o el getMessage al tratar un error

    }
}
