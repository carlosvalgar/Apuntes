public abstract class Figura {
	private String color;
	private double area;
	
	// Constructores
	
	public Figura() {}
	
	public Figura(String color) {
		this.color = color;
	}

	// Getters y Setters
	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	// Métodos
	
	@Override
	public String toString() {
		return "Figura [color=" + color + ", area=" + area + "]";
	}
	
	public abstract void calcularArea();
}