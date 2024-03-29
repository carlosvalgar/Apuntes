
public class Persona {
	//Atributos: Caracteristicas de la persona (las variables)
	private String nombre;
	private int edad;
	private String ciudad;
	
	//M�todos: Las cosas que puede hacer la clase persona (las funciones)
	//Constructor/es Siempre tiene el nombre de la clase, El constructor en blanco es base, pero desaparece si se hace un constructor nuevo por lo que hay que volver a hacerlo
	Persona() {
	
	}
	
	Persona(String nombre) {
		this.nombre = nombre;
	}
	
	Persona(String nombre, int edad){
		this.nombre = nombre;
		this.edad = edad;
	}
	
	Persona(String nombre, int edad, String ciudad) {
		this.nombre = nombre;
		this.edad = edad;
		this.ciudad = ciudad;
	}
	
	//Setters
	public void SetNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public void SetEdad(int edad) {
		this.edad = edad;
	}
	
	public void SetCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	
	//Getters
	public String GetNombre() {
		return this.nombre;
	}
	
	public int GetEdad() {
		return this.edad;
	}
	
	public String GetCiudad() {
		return this.ciudad;
	}
	
	@Override
	public String toString(){
		String cadena = "Nombre: " + this.nombre + "\nEdad: " + this.edad + "\nCiudad: " + this.ciudad;
		return cadena;
	}
	
	void cantar() {
		System.out.println("Laaaaaaa lala laaaaaa lala laaaaaaa lala laaaaaaa ~~ ");
	}
	
}
