
public class Discos extends Materiales{
	private String nomDiscografica;
	
	// Constructores
	
	Discos() {}
	
	Discos(int codigo, String titulo) {
		super(codigo, titulo);
	}
	
	Discos(int codigo, String titulo, String autor) {
		super(codigo, titulo, autor);
	}
	
	Discos(int codigo, String titulo, String autor, String nomDiscografica) {
		super(codigo, titulo, autor);
		this.nomDiscografica = nomDiscografica;
	}
	
	// Setters
	
	public void SetNomDiscografica(String nomDiscografica) {
		this.nomDiscografica = nomDiscografica;
	}
	
	// Getters
	
	public String GetNomDiscografica() {
		return this.nomDiscografica;
	}
	
	@Override
	public String toString(){
		String cadena = super.toString() + "\nNombre de la Discográfica: " + this.nomDiscografica;
		return cadena;
	}
	
}
