public class Pokemon {
    private String nom_pokemon;
    private float pes;
    private int ataque;
    private int defensa;
    private int idespecies;

    // Constructores

    public Pokemon(String nom_pokemon, float pes, int ataque, int defensa, int idespecies) {
        this.nom_pokemon = nom_pokemon;
        this.pes = pes;
        this.ataque = ataque;
        this.defensa = defensa;
        this.idespecies = idespecies;
    }

    // Setters y Getters

    public String getNom_pokemon() {
        return nom_pokemon;
    }
    public void setNom_pokemon(String nom_pokemon) {
        this.nom_pokemon = nom_pokemon;
    }

    public float getPes() {
        return pes;
    }
    public void setPes(float pes) {
        this.pes = pes;
    }

    public int getAtaque() {
        return ataque;
    }
    public void setAtaque(int ataque) {
        this.ataque = ataque;
    }

    public int getDefensa() {
        return defensa;
    }
    public void setDefensa(int defensa) {
        this.defensa = defensa;
    }

    public int getIdespecies() {
        return idespecies;
    }
    public void setIdespecies(int idespecies) {
        this.idespecies = idespecies;
    }

    // Metodos

    @Override
    public String toString() {
        return "Pokemon{" +
                "nom_pokemon='" + nom_pokemon + '\'' +
                ", pes=" + pes +
                ", ataque=" + ataque +
                ", defensa=" + defensa +
                ", idespecies=" + idespecies +
                '}';
    }
}
