public class Persona implements Comparable<Persona>{
    String nombre, direccion;
    int edad;

    // Constructores

    public Persona() {
    }

    public Persona(String nombre, String direccion, int edad) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.edad = edad;
    }

    // Setters y getters

    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public int getEdad() {
        return edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    // Métodos

    @Override
    public String toString() {
        return "Persona{" +
                "nombre='" + nombre + '\'' +
                ", direccion='" + direccion + '\'' +
                ", edad=" + edad +
                '}';
    }


    @Override
    public int compareTo(Persona o) {
        if (this.edad < o.getEdad()) {
            return -1;
        }
        else if (this.edad > o.getEdad()) {
            return 1;
        }
        // return this.getEdad() - o.getEdad(); Este sirve solo para enteros
        return 0;
    }
}
