import java.sql.SQLOutput;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Random;

public class GeneradorPokemon {
    // Metodos
	
    public static ArrayList<Pokemon> listaPokemons() {
        ArrayList<Pokemon> pokemons = new ArrayList<Pokemon>(6);
        int pokemonAleatorio;

        for (int i = 0; i <= 5; i++){
            pokemonAleatorio = new Random().nextInt(3);
            switch(pokemonAleatorio + 1){
                case 1: // Genera un pokemon de Fuego;
                    pokemons.add(generarPokemonFuegoMaquina());
                    break;
                case 2: // Genera un pokemon de Agua
                    pokemons.add(generarPokemonAguaMaquina());
                    break;
                case 3: // Genera un pokemon Electrico
                    pokemons.add(generarPokemonElectricoMaquina());
                    break;
            }
        }
        return pokemons;
    }

    public static Fuego generarPokemonFuegoMaquina() {
        String arrayNombresPokemon[] = {"Charmander", "Charmeleon", "Charizard", "Vulpix", "Ninetales", "Growlithe", "Arcanine", "Ponyta", "Rapidash"};
        int nombreAleatorio = new Random().nextInt(arrayNombresPokemon.length);
        return new Fuego(arrayNombresPokemon[nombreAleatorio]);
    }

    public static Agua generarPokemonAguaMaquina() {
        String arrayNombresPokemon[] = {"Squirtle", "Wartortle", "Blastoise", "Psyduck", "Golduck", "Poliwag", "Magikarp", "Gyarados", "Lapras"};
        int nombreAleatorio = new Random().nextInt(arrayNombresPokemon.length);
        return new Agua(arrayNombresPokemon[nombreAleatorio]);
    }

    public static Electrico generarPokemonElectricoMaquina() {
        String arrayNombresPokemon[] = {"Pikachu", "Raichu", "Magnemite", "Magneton", "Voltorb", "Electrode", "Electabuzz", "Jolteon", "Zapdos"};
        int nombreAleatorio = new Random().nextInt(arrayNombresPokemon.length);
        return new Electrico(arrayNombresPokemon[nombreAleatorio]);
    }
    
    public void generarPokemonHumano(Usuario humano) {
    	ArrayList<Pokemon> pokemons = new ArrayList<Pokemon>(6);
    	Scanner sn = new Scanner(System.in);
    	String nombre;
    	int contador = 0;
        int opcion;
        while (contador < 6) {
        	System.out.print("=".repeat(50) + "\n" + String.format("|%-48s|", " Equipo de: " + humano.getNom() + "    Pokemons: " + contador + " / 6") + "\n" +
                    "=".repeat(50) + "\n" + String.format("|%-48s|", " 1.- Obten un Pokemon de tipo Fuego") + "\n" +
                    String.format("|%-48s|", " 2.- Obten un Pokemon de tipo Agua") + "\n" +
                    String.format("|%-48s|", " 3.- Obten un Pokemon de tipo Electrico") + "\n" +
                    String.format("|%-48s|", " 4.- Vuelve al Coliseo") + "\n" +
                    "=".repeat(50) + "\n" + "    > Escribe una opcion: ");

            opcion = sn.nextInt();
            sn.nextLine();
            
        	 switch (opcion) {
             case 1:
                 System.out.print("\n    > Escribe el nombre de tu Pokemon: ");
            	 nombre = sn.nextLine();
                 pokemons.add(new Fuego(nombre));
                 System.out.println("\n" + "=".repeat(40) + "\n" + String.format("|%-38s|"," Has obtenido a " + pokemons.get(contador).getNom()) + "\n" + "=".repeat(40));
                 System.out.println(pokemons.get(contador).toString() + "\n");
                 contador++;
                 break;
             case 2:
                 System.out.print("\n    > Escribe el nombre de tu Pokemon: ");
                 nombre = sn.nextLine();
                 pokemons.add(new Agua(nombre));
                 System.out.println("\n" + "=".repeat(40) + "\n" + String.format("|%-38s|"," Has obtenido a " + pokemons.get(contador).getNom()) + "\n" + "=".repeat(40));
                 System.out.println(pokemons.get(contador).toString() + "\n");
                 contador++;
                 break;
             case 3:
                 System.out.print("\n    > Escribe el nombre de tu Pokemon: ");
                 nombre = sn.nextLine();
                 pokemons.add(new Electrico(nombre));
                 System.out.println("\n" + "=".repeat(40) + "\n" + String.format("|%-38s|"," Has obtenido a " + pokemons.get(contador).getNom()) + "\n" + "=".repeat(40));
                 System.out.println(pokemons.get(contador).toString() + "\n");
                 contador++;
                 break;
             case 4:
            	 contador = 6;
                 break;
             default:
                 System.out.println("\nERROR: Introduce un numero entre 1 y 4\n");
         }
        humano.setPokemons(pokemons);
        }
    }
    
}
