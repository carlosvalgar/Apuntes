package Estudios;

public class Televisio extends Electrodomestic {
	int polzades;
	boolean sintonitzador;
	
	Televisio () {
		super();
		this.polzades = 20;
		this.sintonitzador = false;
	}
	
	Televisio(float preuBase, int pes) {
		super(preuBase, pes);
		this.polzades = 20;
		this.sintonitzador = false;
	}
	Televisio(float preuBase, String color, char consum, int pes, int polzades, boolean sintonitzador) {
		super(preuBase, color,  consum, pes);
		this.polzades = 20;
		this.sintonitzador = false;
	}

	public int getPolzades() {
		return polzades;
	}

	public void setPolzades(int polzades) {
		this.polzades = polzades;
	}

	public boolean isSintonitzador() {
		return sintonitzador;
	}

	public void setSintonitzador(boolean sintonitzador) {
		this.sintonitzador = sintonitzador;
	}
	
	public void preuFinal (int polzades, boolean sintonitzador) {
		if (polzades > 40) {
			super.setPreuBase(super.getPreuBase() * 1.3f);
		}
		if (sintonitzador == true) {
			super.setPreuBase(super.getPreuBase() + 50);
		}
	}
	
}
