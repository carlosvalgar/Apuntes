package Pt_ArrayList_Exe2;

public class Triangle extends Figura {
	private double base, altura;
	
	// Constructores
	
	public Triangle() {
		super();
	}

	public Triangle(double base, double altura, String color) {
		super(color);
		this.base = base;
		this.altura = altura;
		calcularArea();
	}
	
	// Setters y Getters
	
	public double getBase() {
		return base;
	}

	public void setBase(double base) {
		this.base = base;
	}

	public double getAltura() {
		return altura;
	}

	public void setAltura(double altura) {
		this.altura = altura;
	}
	
	
	// Métodos
	
	@Override
	public String toString() {
		return super.toString() + "Triangle [base=" + base + ", altura=" + altura + "]";
	}
	
	@Override
	public void calcularArea() {
		double area;
		area = (this.base * this.altura) / 2;
		super.setArea(area);
	}
}