package Estudios;

public class Rentadora extends Electrodomestic{
	int carrega;
	
	Rentadora () {
		super();
		this.carrega = 5;
	}
	
	Rentadora(float preuBase, int pes) {
		super(preuBase, pes);
		this.carrega = 5;
	}
	
	Rentadora(float preuBase, String color, char consum, int pes, int carrega) {
		super(preuBase, color,  consum, pes);
		this.carrega = carrega;
	}

	public int getCarrega() {
		return carrega;
	}

	public void setCarrega(int carrega) {
		this.carrega = carrega;
	}

	@Override
	public String toString() {
		return super.toString() + "Rentadora [carrega=" + carrega + "]";
	}
	
	public void preuFinal(int carrega) {
		if (carrega > 30) {
			super.setPreuBase(super.getPreuBase() + 50);
		}
	}
	
	
}
