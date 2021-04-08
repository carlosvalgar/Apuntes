package Abstractos;

public class Mostrador extends Empleat{
	float vendes;
	
	// Constructors
	
	public Mostrador() {
		super();
	}

	public Mostrador(String nom, String ciutatOrigen, float vendes) {
		super(nom, ciutatOrigen, "Mostrador");
		this.vendes = vendes(vendes);
	}
	
	public Mostrador(String nom, String ciutatOrigen) {
		super(nom, ciutatOrigen, "Mostrador");
	}

	public Mostrador(String nom) {
		super(nom);
	}
	
	// Getters y Setters
	
	public float getVendes() {
		return vendes;
	}

	public void setVendes(float vendes) {
		this.vendes = vendes;
	}
	
	// Métodes
	
	public float vendes(float vendes) {
		if (vendes < 0) {
			vendes = 0;
		}
		
		return vendes;
	}
		
	@Override
	public float salariDiari() {
		float salari;
		salari = 50 + (this.vendes * 0.15f);
		return salari;
	}

	@Override
	public String toString() {
		return super.toString() + ", vendes=" + vendes + "]";
	}
	
}
