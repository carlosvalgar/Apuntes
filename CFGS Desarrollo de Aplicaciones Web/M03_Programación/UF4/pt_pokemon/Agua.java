import java.util.Random;

public class Agua extends Pokemon {
	// Constructores

	public Agua() {
		super();
	}

	public Agua(String nom) {
		super(nom, 15, 10, 80,AtacAigua());
		}

	// Métodos

	public static String AtacAigua() {
	int i = (int) (Math.floor(Math.random()*(3))+1);
		switch  (i) {
		case 1:
			return "Pistola agua";
		case 2:
			return "Hidrobomba";
		case 3:
			return "Rayo burbuja";
		}
		return null;
	}

	@Override
	public int getAtac(String atac) {
		if (getAtaque().equalsIgnoreCase("Pistola agua")) {
			int dany = getDanyBase() +  ((int)(Math.random()*(90-30)+30)+7);
			 if (getEnergia()<dany) {
	                setEnergia(0);
	                return 0;
	            }
	            else {
	                setEnergia(getEnergia()-dany);
	                return dany;
	            }
		}
		
		else if  (getAtaque().equalsIgnoreCase("Hidrobomba")) {
            int dany = getDanyBase() + ((int)(Math.random()*(90-30)+30)+13);
            if (getEnergia()<dany) {
                setEnergia(0);
                return 0;
            }

            else {
                setEnergia(getEnergia()-dany);
                return dany;
            }
        }
		
		else if (getAtaque().equalsIgnoreCase("Rayo Burbuja")) {
			int dany = getDanyBase() + ((int)(Math.random()*(90-30)+30)+5);
			if (getEnergia()<dany) {
				setEnergia (0);
				return 0;
			}
			else {
                setEnergia(getEnergia()-dany);
                return dany;
			}
		}
		return -1;
	}
	
	@Override
	public String getDefensa(Pokemon enemic, int atacEnemic) {
        int danyoRecibido;
		int porcentajeAcierto = new Random().nextInt(100);
		if (porcentajeAcierto <= enemic.getPrecisio()) {
			if (atacEnemic == 0) {
				return String.format("|%-98s|", " El Pokemon " + enemic.getNom() + " no tiene energia para atacar.");
			} else if (enemic instanceof Fuego) {
				danyoRecibido = atacEnemic - (getDefensa() * 2);
				setVida(getVida() - danyoRecibido);
				return String.format("|%-107s|", " El ataque es poco eficaz. Se ha redicuido en " + "\u001B[31m" + danyoRecibido + "\u001B[0m la salud del pokemon " + getNom() + ".");
			} else if (enemic instanceof Electrico) {
				danyoRecibido = (3 * atacEnemic) - (getDefensa() * 2);
				setVida(getVida() - danyoRecibido);
				return String.format("|%-107s|", " Ataque critico. Se ha reducido en " + "\u001B[31m" + danyoRecibido + "\u001B[0m la salud del pokémon " + getNom() + ".");
			} else if (enemic instanceof Agua) {
				danyoRecibido = atacEnemic - getDefensa();
				setVida(getVida() - danyoRecibido);
				return String.format("|%-107s|", " Se ha reducido en " + "\u001B[31m" + danyoRecibido + "\u001B[0m la salud del pokémon " + getNom() + ".");
			}
		}

		else {
			return String.format("|%-98s|",  " El Pokemon " + enemic.getNom() + " ha fallado el ataque.");
		}

		return null;
	}

	@Override
	public void resetStats() {
		setEnergia(100);
		setVida(getVidaMax());
	}
	
	
}
