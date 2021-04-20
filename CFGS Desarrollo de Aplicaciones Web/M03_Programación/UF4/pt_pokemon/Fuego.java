import java.util.Random;

public class Fuego extends Pokemon {
    // Constructores

    public Fuego(String nom)  {
        super(nom, 16, 9, 82, atacFoc());
    }

    // Métodos

    public static String atacFoc() {
        int atacAleatori = (int) (Math.random() * (2)) + 1;
        switch (atacAleatori) {
            case 1:
                return "Ascuas";
            case 2:
                return "Lanzallamas";
        }
        return null;
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
                return String.format("|%-107s|", " El ataque es poco eficaz. Se ha redicuido en " + "\u001B[31m" + danyoRecibido + "\u001B[0m la salud del pokémon " + getNom() + ".");
            } else if (enemic instanceof Agua) {
                danyoRecibido = (3 * atacEnemic) - (getDefensa() * 2);
                setVida(getVida() - danyoRecibido);
                return String.format("|%-107s|", " Ataque critico. Se ha reducido en " + "\u001B[31m" + danyoRecibido + "\u001B[0m la salud del pokémon " + getNom() + ".");
            } else if (enemic instanceof Electrico) {
                danyoRecibido = atacEnemic - getDefensa();
                setVida(getVida() - danyoRecibido);
                return String.format("|%-107s|", " Se ha reducido en " + "\u001B[31m" + danyoRecibido + "\u001B[0m la salud del pokémon " + getNom() + ".");
            }
        }

        else {
            return String.format("|%-98s|", " El Pokemon " + enemic.getNom() + " ha fallado el ataque.");
        }

        return null;
    }

    @Override
    public int getAtac(String atac) {
        if (getAtaque().equalsIgnoreCase("Ascuas")) {
            int danyo = getDanyBase() + ((int)(Math.random() * (90 - 30) + 30) + 12);

            if (getEnergia() < danyo) {
                setEnergia(0);
                return 0;
            }

            else {
                setEnergia(getEnergia() - danyo);
                return danyo;
            }
        }

        else if (getAtaque().equalsIgnoreCase("Lanzallamas")) {
            int danyo = getDanyBase() + ((int)(Math.random() * (90 - 30) + 30) + 4);
            if (getEnergia() < danyo) {
                setEnergia(0);
                return 0;
            }

            else {
                setEnergia(getEnergia() - danyo);
                return danyo;
            }
        }

        return -1;
    }

	@Override
	public void resetStats() {
		setEnergia(100);
        setVida(getVidaMax());
	}
}
