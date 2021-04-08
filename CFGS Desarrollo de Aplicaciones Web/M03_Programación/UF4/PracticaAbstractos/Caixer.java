package Abstractos;

public class Caixer extends Empleat {
	private int horesTreballades;
	
	// Constructors
	
	public Caixer() {
		super();
	}
	
	public Caixer(String nom, String ciutatOrigen, int horesTreballades) {
		super(nom, ciutatOrigen, "Caixer");
		this.horesTreballades = horesTreballades(horesTreballades);
	}

	public Caixer(String nom, String ciutatOrigen) {
		super(nom, ciutatOrigen, "Caixer");
	}

	public Caixer(String nom) {
		super(nom);
	}

	// Getters y Setters

	public int getHoresTreballades() {
		return horesTreballades;
	}

	public void setHoresTreballades(int horesTreballades) {
		this.horesTreballades = horesTreballades;
	}
	
	// Métodes
	
	@Override
	public String toString() {
		return super.toString() + ", horesTreballades=" + horesTreballades + "]";
	}
	
	@Override
	public float salariDiari() {
		float salari;
		salari = horesTreballades * 15.00f;
		return salari;
	}
	
	// El enunciado no especifica que es una jornada o si es algo que fuese a ser total, asi que haré que sean diarias
	
	public int horesTreballades (int horesTreballades) {
		if (horesTreballades < 0) {
			horesTreballades = 0;
			System.out.println("Cambiando el valor de horas a 0.");
		}
		else if (horesTreballades > 8) {
			horesTreballades = 8;
			System.out.println("Cambiando el valor de horas a 8.");
		}
		
		return horesTreballades;
	}
}
