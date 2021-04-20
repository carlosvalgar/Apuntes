import java.util.ArrayList;
import java.util.Random;

public class Usuario {
    private String nom, titulo = "Novato", tipo;
    int victorias = 0;
    private ArrayList<Pokemon> pokemons = new ArrayList<Pokemon>(6);

    // Constructores

    public Usuario(String nom, String tipo) {
        this.nom = nom;
        this.tipo = tipo;
    }

    public Usuario(String nom, ArrayList pokemons, String tipo){
        this.nom = nom;
        this.pokemons = pokemons;
        this.tipo = tipo;
    }

    // Setters y Getters

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public ArrayList<Pokemon> getPokemons() {
        return pokemons;
    }

    public void setPokemons(ArrayList<Pokemon> pokemons) {
        this.pokemons = pokemons;
    }

    public String getTitulo() {
        return titulo;
    }

    public int getVictorias() {
        return victorias;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setVictorias(int victorias) {
        this.victorias = victorias;
    }

    // Métodos

    @Override
    public String toString() {
        String entrenador = "=".repeat(40) + "\n" + String.format("|%-38s|", " Entrenador: " + nom) + "\n" + "=".repeat(40);
        if (pokemons.size() == 0){
            entrenador += "\n" + String.format("|%-38s|", " No hay ningun Pokemon en tu equipo.") + "\n" + "=".repeat(40);
        }
        else {
            for (int i = 0; i < pokemons.size(); i++) {
                entrenador += "\n" + String.format("|%-38s|", " Pokemon " + (i + 1) + ": " + pokemons.get(i).getNom() + " (" + pokemons.get(i).getClass().getName() + ")")
                        + "\n" + String.format("|%-38s|", "-".repeat(38)) + "\n" +
                        String.format("|%-56s|", " ".repeat(4) + "Vida:   " + "\u001B[32m" + pokemons.get(i).getVida() + "\u001B[0m  Energia: " + "\u001B[33m" + pokemons.get(i).getEnergia() + "\u001B[0m") + "\n" +
                        String.format("|%-56s|", " ".repeat(4) + "Ataque: " + "\u001B[31m" +  pokemons.get(i).getDanyBase() + "\u001B[0m   Defensa: " + "\u001B[36m" +  pokemons.get(i).getDefensa() + "\u001B[0m ") + "\n" +
                        String.format("|%-38s|", "-".repeat(38)) + "\n" +
                        String.format("|%-38s|", " ".repeat(4) + "Movimiento: " + pokemons.get(i).getAtaque()) + "\n" + "=".repeat(40);
            }
        }
        return entrenador;
    }

    public String GeneradorNombres(){
        String arrayCategorias[] = {"Artista", "Camara", "Campista", "Cazabichos", "Ciclista", "Criapokemon", "Escolar", "Guitarrista", "Karateka", "Medium",
                "Pokefan", "Policia", "Periodista", "Lider de gimnasio", "Alto mando", "Campeon"};
        String arrayNombres[] = {"Guillem", "Marti", "Carlos", "Pau", "Jesus", "Adrian", "David", "Aida", "Sandra", "Belen", "Rafa", "Leandro", "Jenni", "Xavi"};
        String nombrePokemon = arrayCategorias[new Random().nextInt(arrayCategorias.length)] + " " + arrayNombres[new Random().nextInt(arrayNombres.length)];
        return nombrePokemon;
    }

    public void MejoraTitulo(Usuario user){
        if (user.getTipo().equalsIgnoreCase("Jugador")) {
            if (user.getVictorias() == 3 && !user.getTitulo().equalsIgnoreCase("Entrenador")) {
                setTitulo("Entrenador");
                System.out.println("=".repeat(54) + "\n" + String.format("|%-52s|", " Tienes 3 victorias, tu titulo cambia a Entrenador!") + "\n" + "=".repeat(54) + "\n");
            } else if (user.getVictorias() == 6 && !user.getTitulo().equalsIgnoreCase("Lider de Gimnasio")) {
                setTitulo("Lider de Gimnasio");
                System.out.println("=".repeat(61) + "\n" + String.format("|%-59s|", " Tienes 6 victorias, tu titulo cambia a Lider de Gimnasio!") + "\n" + "=".repeat(61) + "\n");
            } else if (user.getVictorias() == 9 && !user.getTitulo().equalsIgnoreCase("Alto Mando")) {
                setTitulo("Alto Mando");
                System.out.println("=".repeat(54) + "\n" + String.format("|%-52s|", " Tienes 9 victorias, tu titulo cambia a Alto Mando!") + "\n" + "=".repeat(54) + "\n");
            } else if (user.getVictorias() == 12 && !user.getTitulo().equalsIgnoreCase("Campeon")) {
                setTitulo("Campeon");
                System.out.println("=".repeat(52) + "\n" + String.format("|%-50s|", " Tienes 12 victorias, tu titulo cambia a Campeon!") + "\n" + "=".repeat(52) + "\n");
            }
        }
    }

}
