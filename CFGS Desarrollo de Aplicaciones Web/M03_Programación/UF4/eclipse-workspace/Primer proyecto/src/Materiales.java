
public class Materiales {
	private int codigo;
	private String titulo;
	private String autor;
	
	// Constructores
	
	Materiales() {}
	
	Materiales(int codigo, String titulo) {
		this.codigo = codigo;
		this.titulo = titulo;		
	}
	
	Materiales(int codigo, String titulo, String autor) {
		this.codigo = codigo;
		this.titulo = titulo;	
		this.autor = autor;
	}
	
	// Setters
	
	public void SetCodigo(int codigo) {
		this.codigo = codigo;
	}
	
	public void SetTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public void SetAutor(String autor) {
		this.autor = autor;
	}

	// Getters
	
	public int GetCodigo() {
		return this.codigo;
	}
	
	public String GetTitulo() {
		return this.titulo;
	}
	
	public String GetAutor() {
		return this.autor;
	}
	
	@Override
	public String toString(){
		String cadena = "Codigo: " + this.codigo + "\nTitulo: " + this.titulo + "\nAutor: " + this.autor;
		return cadena;
	}
}
