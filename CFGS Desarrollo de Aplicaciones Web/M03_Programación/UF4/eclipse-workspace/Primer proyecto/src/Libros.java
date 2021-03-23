
public class Libros extends Materiales {
	private int numeroPaginas;
	
	// Constructores
	
	Libros() {}
	
	Libros(int codigo, String titulo) {
		super(codigo, titulo);
	}
	
	Libros(int codigo, String titulo, String autor) {
		super(codigo, titulo, autor);
	}
	
	Libros(int codigo, String titulo, String autor, int numeroPaginas) {
		super(codigo, titulo, autor);
		this.numeroPaginas = numeroPaginas;
	}
	
	// Setters
	public void SetNumeroPaginas(int numeroPaginas) {
		this.numeroPaginas = numeroPaginas;
	}
	
	// Getters
	public int GetNumeroPaginas() {
		return this.numeroPaginas;
	}
	
	@Override
	public String toString(){
		String cadena = super.toString() + "\nNumero de Páginas: " + this.numeroPaginas;
		return cadena;
	}
	
}
