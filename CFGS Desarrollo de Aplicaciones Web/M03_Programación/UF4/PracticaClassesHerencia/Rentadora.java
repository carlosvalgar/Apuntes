package PracticaClassesHerencia;

public class Rentadora extends Electrodomestic{
	int carrega;
	
	// Constructores
	
	public Rentadora () {
		super();
		this.carrega = 5;
	}
	
	public Rentadora(float preuBase, int pes) {
		super(preuBase, pes);
		this.carrega = 5;
	}
	
	public Rentadora(float preuBase, String color, char consum, int pes, int carrega) {
		super(preuBase, color,  consum, pes);
		this.carrega = carrega;
	}

	// Setters y Getters
	
	public int getCarrega() {
		return carrega;
	}

	public void setCarrega(int carrega) {
		this.carrega = carrega;
	}

	// toString
	
	@Override
	public String toString() {
		return super.toString() + "Rentadora [carrega=" + carrega + "]";
	}
	
	// Metodos
	
	@Override
	public void preuFinal() {
		super.preuFinal();
		if (carrega > 30) {
			super.setPreuBase(super.getPreuBase() + 50);
		}
	}
}
