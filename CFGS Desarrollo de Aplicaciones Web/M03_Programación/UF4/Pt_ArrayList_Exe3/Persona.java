package Clases;

public class Persona {
    String nom, dni; // Añado ya el dni porque me lo pide para el punto 3
    int edat;
    float altura;
    char sexe;
    boolean casat;

    // Constructors

    public Persona() {
    }

    public Persona(String dni, String nom, int edat, float altura, char sexe) {
        this.dni = dni;
        this.nom = nom;
        this.edat = edat;
        this.altura = altura;
        this.sexe = sexe;
        this.casat = false;
    }

    public Persona(String dni, String nom, int edat, float altura, char sexe, boolean casat) {
        this.dni = dni;
        this.nom = nom;
        this.edat = edat;
        this.altura = altura;
        this.sexe = sexe;
        this.casat = casat;
    }

    // Getters y Setters

    public String getDni() {
        return dni;
    }

    public String getNom() {
        return nom;
    }

    public int getEdat() {
        return edat;
    }

    public float getAltura() {
        return altura;
    }

    public char getSexe() {
        return sexe;
    }

    public boolean isCasat() {
        return casat;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setEdat(int edat) {
        this.edat = edat;
    }

    public void setAltura(float altura) {
        this.altura = altura;
    }

    public void setSexe(char sexe) {
        this.sexe = sexe;
    }

    public void setCasat(boolean casat) {
        this.casat = casat;
    }

    // Métodes

    @Override
    public String toString() {
        return "Persona {" +
                "nom = '" + nom + '\'' +
                ", dni = " + dni +
                ", edat = " + edat +
                ", altura = " + altura +
                ", sexe = " + sexe +
                ", casat = " + casat +
                '}';
    }
}
