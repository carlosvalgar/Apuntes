package Abstracto;

public class Rectangulo extends Figura {
	private int base, altura;
	
	public Rectangulo() {
		super();
	}

	public Rectangulo(int base, int altura) {
		super();
		this.base = base;
		this.altura = altura;
	}

	@Override
	public String toString() {
		return "Rectangulo [base=" + base + ", altura=" + altura + "]";
	}

	@Override
	public float calcularArea() {
		return (base * altura) / 2;
	}

	@Override
	public float calcularPerimetro() {
		// TODO Auto-generated method stub
		return 0;
	}

}
