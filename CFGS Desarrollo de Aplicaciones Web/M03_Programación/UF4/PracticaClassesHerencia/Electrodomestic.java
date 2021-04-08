package PracticaClassesHerencia;

public class Electrodomestic {
	float preuBase;
	String color;
	char consum;
	int pes;
	
	// Constructores
	
	public Electrodomestic () {
		this.preuBase = 100;
		this.color = "Blanc";
		this.consum = 'F';
		this.pes = 5;
	}
	
	public Electrodomestic (float preuBase, int pes){
		this.preuBase = preuBase;
		this.color = "Blanc";
		this.consum = 'F';
		this.pes = pes;
	}
	
	public Electrodomestic (float preuBase, String color, char consum, int pes){
		this.preuBase = preuBase;
		comprovarConsumoElectrico(consum);
		comprovarColor(color);
		this.pes = pes;
		
	}

	// Setters y Getters
	
	public float getPreuBase() {
		return preuBase;
	}

	public void setPreuBase(float preuBase) {
		this.preuBase = preuBase;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public char getConsum() {
		return consum;
	}

	public void setConsum(char consum) {
		this.consum = consum;
	}

	public int getPes() {
		return pes;
	}

	public void setPes(int pes) {
		this.pes = pes;
	}
	
	// toString
	
	@Override
	public String toString() {
		return "Electrodomestic [preuBase=" + preuBase + ", color=" + color + ", consum=" + consum + ", pes=" + pes
				+ "]";
	}
	
	// Metodos
	
	public void comprovarConsumoElectrico(char consum) {
		consum = Character.toUpperCase(consum);
		if (consum != 'A' && consum != 'B' && consum != 'C' && consum != 'D' && consum != 'E' && consum != 'F') {
			consum = 'F';
		}
		setConsum(consum);
	}
	
	public void comprovarColor(String color) {
		color = color.substring(0, 1).toUpperCase() + color.substring(1).toLowerCase();
		if (color != "Blanc" && color != "Negre" && color != "Vermell" && color != "Blau" && color != "Gris") {
			color = "Blanc";
		}
		setColor(color);	
	}
	
	public void preuFinal() {
		switch(consum) {
			case 'A':
				setPreuBase(getPreuBase() + 100);
				break;
				
			case 'B':
				setPreuBase(getPreuBase() + 80);
				break;
				
			case 'C':
				setPreuBase(getPreuBase() + 60);
				break;
				
			case 'D':
				setPreuBase(getPreuBase() + 50);
				break;
				
			case 'E':
				setPreuBase(getPreuBase() + 30);
				break;
				
			case 'F':
				setPreuBase(getPreuBase() + 10);
				break;
		}
		
		if (pes >= 80) {
			setPreuBase(getPreuBase() + 100);
		}
		
		else if (pes >= 50) {
			setPreuBase(getPreuBase() + 80);
		}
		
		else if (pes >= 20) {
			setPreuBase(getPreuBase() + 50);
		}
		
		else if (pes >= 0) {
			setPreuBase(getPreuBase() + 10);
		}
	}
}
		

