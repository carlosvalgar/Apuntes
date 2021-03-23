package Estudios;

public class Electrodomestic {
	float preuBase;
	String color;
	char consum;
	int pes;
	
	Electrodomestic () {
		this.preuBase = 100;
		this.color = "Blanc";
		this.consum = 'F';
		this.pes = 5;
	}
	
	Electrodomestic (float preuBase, int pes){
		this.preuBase = preuBase;
		this.color = "Blanc";
		this.consum = 'F';
		this.pes = pes;
	}
	
	Electrodomestic (float preuBase, String color, char consum, int pes){
		this.preuBase = preuBase;
		comprovarConsumoElectrico(consum);
		comprovarColor(color);
		this.pes = pes;
		
	}

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
	
	
	
	@Override
	public String toString() {
		return "Electrodomestic [preuBase=" + preuBase + ", color=" + color + ", consum=" + consum + ", pes=" + pes
				+ "]";
	}
	
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
		
}
