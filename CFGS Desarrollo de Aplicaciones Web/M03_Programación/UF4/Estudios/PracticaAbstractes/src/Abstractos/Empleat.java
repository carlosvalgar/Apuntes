package Abstractos;

public abstract class Empleat {
	private String nom, ciutatOrigen, lloc;
	
	// Constructors
	
	public Empleat() {}
	
	public Empleat (String nom) {
		this.nom = nom;
	}
	public Empleat (String nom, String ciutatOrigen) {
		this.nom = nom;
	}
	
	public Empleat (String nom, String ciutatOrigen, String lloc) {
		this.nom = nom;
		this.ciutatOrigen = ciutatOrigen(ciutatOrigen);
		this.lloc = lloc(lloc);
	}
	
	// Getters y Setters
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getCiutatOrigen() {
		return ciutatOrigen;
	}
	public void setCiutatOrigen(String ciutatOrigen) {
		this.ciutatOrigen = ciutatOrigen;
	}
	public String getLloc() {
		return lloc;
	}
	public void setLloc(String lloc) {
		this.lloc = lloc;
	}
	
	// Métodes
	
		@Override
	public String toString() {
		return "Empleat [nom=" + nom + ", ciutatOrigen=" + ciutatOrigen + ", lloc=" + lloc;
	}
		
	// El enunciado no especifica como tiene que ser el metodo asi que imagino que sera los 3 tipos de empleados que hay (lloc de treball)
		
	public String lloc(String lloc) {
		if (lloc.toLowerCase().equals("caixer")) {
			return "Caixer";
		}
		
		else if (lloc.toLowerCase().equals("neteja")) {
			return "Neteja";
		}
		
		else if (lloc.toLowerCase().equals("mostrador")) {
			return "Mostrador";
		}
		
		else {
			System.out.println("ERROR: Només accepta llocs de treball de caixer, neteja o mostrador.");
			return null;
		}
	
	}
	
	// El enunciado no deja claro como tiene que ser el metodo asi que implementare que haya 3 lugares posibles de origen para comprobar
	
	public String ciutatOrigen(String ciutatOrigen) {
		if (ciutatOrigen.toLowerCase().equals("cornella")) {
			return "Cornella";
		}
		
		else if (ciutatOrigen.toLowerCase().equals("hospitalet")) {
			return "Hospitalet";
		}
		
		else if (ciutatOrigen.toLowerCase().equals("sant boi")) {
			return "Sant Boi";
		}
		
		else {
			System.out.println("ERROR: Només accepta llocs de treball de cornella, hospitalet o sant boi.");
			return null;
		}
	}
	
	public abstract float salariDiari();
	
	
}
