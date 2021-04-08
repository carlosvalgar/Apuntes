package Abstracto;

public abstract class Figura {
	// De las clases abstractas no puede tener clases de Figura, aunque si pueda tener arrays de figuras
	// "static" para no generar un objeto para usar uan constante, "final" para que no se pueda modificar ejemplo:
	// public static final double PI = 3.14156;
	private int x, y;
	
	public Figura () {
		
	}
	
	public Figura (int x, int y) {
		this.x = x;
		this.y = y;
	}
	
	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	@Override
	public String toString() {
		return "Figura [x=" + x + ", y=" + y + "]";
	}

	public abstract float calcularArea();
	
	public abstract float calcularPerimetro();
	
}
