import java.util.ArrayList;
import java.util.Collections;

public class Principal {

    public static void main(String[] args) {
        ArrayList<Persona> personas = new ArrayList<Persona>();
        personas.add(new Persona("Pepe1", "Calle de la piruleta1", 23));
        personas.add(new Persona("Pepe2", "Calle de la piruleta2", 22));
        personas.add(new Persona("Pepe3", "Calle de la piruleta3", 21));

        Collections.sort(personas);
        System.out.println(personas);
        Collections.sort(personas, new ComparatorPersona());
        System.out.println(personas);
        Collections.sort(personas);
        System.out.println(personas);
        Collections.sort(personas, new ComparatorPersonaNombre());
        System.out.println(personas);

        Collections.sort(personas);
    }
}
