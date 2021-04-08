package PracticaClassesHerencia;

public class Televisio extends Electrodomestic {
	int polzades;
	boolean sintonitzador;
	
	// Constructores
	
	public Televisio () {
		super();
		this.polzades = 20;
		this.sintonitzador = false;
	}
	
	public Televisio(float preuBase, int pes) {
		super(preuBase, pes);
		this.polzades = 20;
		this.sintonitzador = false;
	}
	
	public Televisio(float preuBase, String color, char consum, int pes, int polzades, boolean sintonitzador) {
		super(preuBase, color,  consum, pes);
		this.polzades = 20;
		this.sintonitzador = false;
	}

	// Setters y Getters
	
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
	
	// Metodos
	
	@Override
	public String toString() {
		return super.toString() + "Televisio [polzades=" + polzades + ", sintonitzador=" + sintonitzador + "]";
	}

	public void preuFinal () {
		super.preuFinal();
		if (polzades > 40) {
			super.setPreuBase(super.getPreuBase() * 1.3f);
		}
		if (sintonitzador == true) {
			super.setPreuBase(super.getPreuBase() + 50);
		}
	}
	
}
