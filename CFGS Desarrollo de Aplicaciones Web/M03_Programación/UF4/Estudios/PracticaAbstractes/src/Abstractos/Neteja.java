package Abstractos;

public class Neteja extends Empleat {
	
	// Constructors
	
	public Neteja() {
		super();
	}

	public Neteja(String nom, String ciutatOrigen) {
		super(nom, ciutatOrigen, "Neteja");
	}

	public Neteja(String nom) {
		super(nom);
	}

	// Métodes
	
	@Override
	public float salariDiari() {
		return 35.00f;
	}

	@Override
	public String toString() {
		return super.toString() + "]";
	}

}
