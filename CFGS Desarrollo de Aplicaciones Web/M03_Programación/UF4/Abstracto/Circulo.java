package Abstracto;

public class Circulo extends Figura {
	private int radi;
	
	public Circulo() {
		super();
	}
	
	public Circulo(int radi) {
		super();
		this.radi = radi;
	}

	public Circulo(int x, int y, int radi) {
		super(x, y);
		this.radi = radi;
	}

	@Override
	public float calcularArea() {
		// Ejemplo para castear variables
		return (float) (Math.PI*Math.pow((double)radi, 2));
	}

	@Override
	public float calcularPerimetro() {
		// TODO Auto-generated method stub
		return 0;
	}

}
