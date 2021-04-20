public class Construcciones {
    private int id, precio, id_granjero;
    private String nombre;

    // Constructores


    public Construcciones() {
    }

    public Construcciones(int id, String nombre, int precio, int id_granjero) {
        this.id = id;
        this.precio = precio;
        this.id_granjero = id_granjero;
        this.nombre = nombre;
    }

    // Setters y Getters


    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getPrecio() {
        return precio;
    }
    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getId_granjero() {
        return id_granjero;
    }
    public void setId_granjero(int id_granjero) {
        this.id_granjero = id_granjero;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    // Metodos

    @Override
    public String toString() {
        return "Construcciones{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", id_granjero=" + id_granjero +
                ", precio=" + precio +
                '}';
    }
}
