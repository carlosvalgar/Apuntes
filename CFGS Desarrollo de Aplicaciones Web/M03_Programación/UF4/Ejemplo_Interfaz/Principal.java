package Ejemplo_Interfaz;

import java.util.ArrayList;
import java.util.Collections;

public class Principal {

    public static void main(String[] args) {
        ArrayList<Persona> Personas = new ArrayList<Persona>();
        Personas.add(new Persona("Pepe1", "Calle de la piruleta1", 23));
        Personas.add(new Persona("Pepe2", "Calle de la piruleta2", 22));
        Personas.add(new Persona("Pepe3", "Calle de la piruleta3", 21));

        Collections.sort(Personas);
        System.out.println(Personas);
        Collections.sort(Personas, new ComparatorPersona());
        System.out.println(Personas);
        Collections.sort(Personas);
        System.out.println(Personas);
        Collections.sort(Personas, new ComparatorPersonaNombre());
        System.out.println(Personas);
    }
}
