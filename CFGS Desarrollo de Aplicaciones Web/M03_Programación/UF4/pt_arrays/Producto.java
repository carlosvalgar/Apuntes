package pt_arrays;

public class Producto {

	protected int codigo;
	protected String nombre;
	protected String tipus;
	protected double preu;
	protected int stock;
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTipus() {
		return tipus;
	}
	public void setTipus(String tipus) {
		this.tipus = tipus;
	}
	public double getPreu() {
		return preu;
	}
	public void setPreu(double preu) {
		this.preu = preu;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Producto() {}
	public Producto(int codigo, String nombre, String tipus, double preu, int stock) {
		super();
		this.codigo = codigo;
		this.nombre = nombre;
		this.tipus = tipus;
		this.preu = preu;
		this.stock = stock;
	}
	@Override
	public String toString() {
		return "Producto [codigo=" + codigo + ", nombre=" + nombre + ", tipus=" + tipus + ", preu=" + preu + ", stock="
				+ stock + "]";
	}
	
	
}
