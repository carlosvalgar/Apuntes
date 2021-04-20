import java.util.ArrayList;
import java.util.Random;

public class CombatePokemon {
    public void LuchaPokemon(Usuario combatiente1, Usuario combatiente2) {
        Usuario luchador1;
        Usuario luchador2;
        Pokemon pokemonLuchador1;
        Pokemon pokemonLuchador2;
        int ronda = 1;
        boolean flagCombatePokemon = false;
        if (ControlarVidaEquipo(combatiente1.getPokemons()) > ControlarVidaEquipo(combatiente2.getPokemons())) {
            luchador1 = combatiente2;
            luchador2 = combatiente1;
        }
        else {
            luchador1 = combatiente1;
            luchador2 = combatiente2;
        }

        pokemonLuchador1 = SeleccionarPokemon(luchador1.getPokemons());
        pokemonLuchador2 = SeleccionarPokemon(luchador2.getPokemons());

        do {
            if (pokemonLuchador1.getVida() <= 0) {
                System.out.println(String.format("|%-38s|", " " + pokemonLuchador1.getNom() + " se ha debilitado!"));
                pokemonLuchador1 = SeleccionarPokemon(luchador1.getPokemons());
                System.out.println(String.format("|%-38s|", " Adelante " + pokemonLuchador1.getNom() + "!") + "\n" + "=".repeat(40));
            }

            else if (pokemonLuchador2.getVida() <= 0) {
                System.out.println(String.format("|%-38s|", " " + pokemonLuchador2.getNom() + " se ha debilitado!"));
                pokemonLuchador2 = SeleccionarPokemon(luchador2.getPokemons());
                System.out.println(String.format("|%-38s|", " Adelante " + pokemonLuchador2.getNom() + "!") + "\n" + "=".repeat(40));
            }

            System.out.println("\n" + "=".repeat(12) + "\n" + String.format("|%-10s|", " Ronda " + ronda));
            System.out.println("=".repeat(100));
            System.out.println(pokemonLuchador2.getDefensa(pokemonLuchador1, pokemonLuchador1.getAtac(pokemonLuchador1.getAtaque())));
            System.out.println(pokemonLuchador1.getDefensa(pokemonLuchador2, pokemonLuchador2.getAtac(pokemonLuchador2.getAtaque())));
            System.out.println("=".repeat(100));
            pokemonLuchador1.recuperarEnergia();
            pokemonLuchador2.recuperarEnergia();


            if(ControlarVidaEquipo(luchador1.getPokemons()) <= 0 || ControlarVidaEquipo(luchador2.getPokemons()) <= 0){
                flagCombatePokemon = true;
            }

            ronda++;

        } while(!flagCombatePokemon);

        System.out.println("\n" + "=".repeat(52));

        if (ControlarVidaEquipo(luchador1.getPokemons()) <= 0 && ControlarVidaEquipo(luchador2.getPokemons()) <= 0) {
            if (ControlarEnergiaEquipo(luchador1.getPokemons()) > ControlarEnergiaEquipo(luchador2.getPokemons())) {
                System.out.println(String.format("|%-50s|", " Ganador del combate Pokemon: " + luchador1.getNom() + "!"));
                System.out.println("=".repeat(52) + "\n");
                luchador1.setVictorias(luchador1.getVictorias() + 1);
                luchador1.MejoraTitulo(luchador1);
            }
            else if (ControlarEnergiaEquipo(luchador1.getPokemons()) < ControlarEnergiaEquipo(luchador2.getPokemons())) {
                System.out.println(String.format("|%-50s|", " Ganador del combate Pokemon: " + luchador2.getNom() + "!"));
                System.out.println("=".repeat(52) + "\n");
                luchador2.setVictorias(luchador2.getVictorias() + 1);
                luchador2.MejoraTitulo(luchador2);
            }
            else {
                System.out.println(String.format("|%-50s|", " El resultado del combate resulta en empate."));
                System.out.println("=".repeat(52) + "\n");
            }
        }

        else if (ControlarVidaEquipo(luchador1.getPokemons()) <= 0) {
            System.out.println(String.format("|%-50s|", " Ganador del combate Pokemon: " + luchador2.getNom() + "!"));
            System.out.println("=".repeat(52) + "\n");
            luchador2.setVictorias(luchador2.getVictorias() + 1);
            luchador2.MejoraTitulo(luchador2);
        }

        else if (ControlarVidaEquipo(luchador2.getPokemons()) <= 0) {
            System.out.println(String.format("|%-50s|", " Ganador del combate Pokemon: " + luchador1.getNom() + "!"));
            System.out.println("=".repeat(52) + "\n");
            luchador1.setVictorias(luchador1.getVictorias() + 1);
            luchador1.MejoraTitulo(luchador1);
        }

        CentroPokemon(combatiente1.getPokemons());
        CentroPokemon(combatiente2.getPokemons());
    }

    public Pokemon SeleccionarPokemon(ArrayList<Pokemon> pokemons){
        boolean flagPokemon = false;
        Pokemon pokemonElegido;
        do {
            pokemonElegido = pokemons.get(new Random().nextInt(pokemons.size()));
            if (pokemonElegido.getVida() > 0) {
                flagPokemon = true;
            }
        }
        while (!flagPokemon);
        return pokemonElegido;
    }

    public int ControlarVidaEquipo(ArrayList<Pokemon> pokemons){
        int vidaTotal = 0;
        for (int i = 0; i <pokemons.size(); i++) {
            vidaTotal += pokemons.get(i).getVida();
        }
        return vidaTotal;
    }

    public int ControlarEnergiaEquipo(ArrayList<Pokemon> pokemons) {
        int energiaTotal = 0;
        for (Pokemon pokemon : pokemons) {
            energiaTotal += pokemon.getEnergia();
        }
        return energiaTotal;
    }

    public void CentroPokemon(ArrayList<Pokemon> pokemons){
        for (Pokemon pokemon : pokemons) {
            pokemon.resetStats();
        }
    }

}
