public abstract class Pokemon implements Atacable, Defensable{
	private String nom, ataque;
	private int energia, vida, vidaMax, danyBase, defensa, precisio;

	// Constructores

	public Pokemon() {}

	public Pokemon(String nom, int danyBase, int defensa, int precisio, String ataque) {
		super();
		this.nom = nom;
		this.energia = 100;
		this.vida = (int)(Math.random() * (500 - 300)) + 300;
		this.vidaMax = this.vida;
		this.danyBase = danyBase;
		this.defensa = defensa;
		this.precisio = precisio;
		this.ataque = ataque;
	}

	// Setters y Getters

	public String getNom() {
			return nom;
	}
	public void setNom(String nom) {
			this.nom = nom;
	}

	public int getEnergia() {
			return energia;
	}
	public void setEnergia(int energia) {
		this.energia = energia;
	}

	public int getVida() {
		return vida;
	}
	public void setVida(int vida) {
		this.vida = vida;
	}

	public int getVidaMax() {
		return vidaMax;
	}

	public int getDanyBase() {
		return danyBase;
	}
	public void setDanyBase(int danyBase) {
		this.danyBase = danyBase;
	}

	public int getDefensa() {
		return defensa;
	}
	public void setDefensa(int defensa) {
		this.defensa = defensa;
	}

	public int getPrecisio() {
		return precisio;
	}
	public void setPrecisio(int precisio) {
		this.precisio = precisio;
	}

	public String getAtaque() {
		return ataque;
	}
	public void setAtaque(String ataque) {
		this.ataque = ataque;
	}
	
	// Métodos
	
	@Override
	public String toString() {
		return "=".repeat(40) + "\n" +
				String.format("|%-38s|", " Pokemon: "+ nom + " (" + this.getClass().getName() + ")") + "\n" +
				String.format("|%-38s|", "-".repeat(38)) + "\n" +
				String.format("|%-56s|", " ".repeat(4) + "Vida:   " + "\u001B[32m" + vida + "\u001B[0m  Energia: " + "\u001B[33m" + energia + "\u001B[0m") + "\n" +
				String.format("|%-56s|", " ".repeat(4) + "Ataque: " + "\u001B[31m" +  danyBase + "\u001B[0m   Defensa: " + "\u001B[36m" +  defensa + "\u001B[0m ") + "\n" +
				String.format("|%-38s|", "-".repeat(38)) + "\n" +
				String.format("|%-38s|", " ".repeat(4) + "Movimiento: " + ataque) + "\n" + "=".repeat(40);
	}

	@Override
	public abstract String getDefensa(Pokemon enemic, int atacEnemic);

	@Override
	public abstract int getAtac(String atac);

	public abstract void resetStats();

	public void recuperarEnergia(){
		setEnergia(getEnergia() + 100);
	}

}

