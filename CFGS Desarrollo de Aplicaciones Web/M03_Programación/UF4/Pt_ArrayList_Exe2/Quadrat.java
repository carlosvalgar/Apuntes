package Pt_ArrayList_Exe2;

public class Quadrat extends Figura {
	private double costat;
	
	// Constructores
	
	public Quadrat() {
		super();
	}
	
	public Quadrat(double costat, String color) {
		super(color);
		this.costat = costat;
		calcularArea();
	}
	
	// Getters y Setters
	
	public double getCostat() {
		return costat;
	}

	public void setCostat(double costat) {
		this.costat = costat;
	}
	
	// Métodes
	
	@Override
	public String toString() {
		return super.toString() + "Quadrat [costat=" + costat + "]";
	}
	
	@Override
	public void calcularArea() {
		double area;
		area = (Math.pow(this.costat, 2));
		super.setArea(area);
	}
}