package Pt_ArrayList_Exe2;

public class Cercle extends Figura {
	private double radi;
	
	// Constructores	
	
	public Cercle() {
		super();
	}

	public Cercle(double radi, String color) {
		super(color);
		this.radi = radi;
		calcularArea();
	}

	// Setters y Getters
	
	public double getRadi() {
		return radi;
	}

	public void setRadi(double radi) {
		this.radi = radi;
	}
	
	// Métodos
	
	@Override
	public String toString() {
		return super.toString() + "Cercle [radi=" + radi + "]";
	}
	
	@Override
	public void calcularArea() {
		double area;
		area = (Math.PI * Math.pow(this.radi, 2));
		super.setArea(area);
	}
}