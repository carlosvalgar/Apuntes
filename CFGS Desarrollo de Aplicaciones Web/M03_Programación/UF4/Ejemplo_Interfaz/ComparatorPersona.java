import java.util.Comparator;

public class ComparatorPersona implements Comparator<Persona> {
    @Override
    public int compare(Persona o1, Persona o2) {
        return o1.getDireccion().compareToIgnoreCase(o2.getDireccion());
    }
}

class ComparatorPersonaNombre implements Comparator<Persona> {
    @Override
    public int compare(Persona o1, Persona o2) {
        return o1.getNombre().compareToIgnoreCase(o2.getNombre());
    }
}
