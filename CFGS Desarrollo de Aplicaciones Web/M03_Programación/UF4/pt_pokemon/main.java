import java.util.Scanner;

public class main {
    public static void main(String[] args) {
        Scanner sn = new Scanner(System.in);
        GeneradorPokemon equipoPokemon = new GeneradorPokemon();
        Usuario jugador = new Usuario("placeholder", "Jugador");
        Usuario maquina = new Usuario(jugador.GeneradorNombres(), equipoPokemon.listaPokemons(), "Maquina");
        CombatePokemon combate = new CombatePokemon();
        boolean salir = false;
        int opcion;
        String nombre;

        // Pedimos el nombre del jugador

        System.out.print("=".repeat(91) + "\n" + String.format("|%-89s|" , " Hola Entrenador, bienvenido al Coliseo Pokemon. Antes de comenzar, dime como te llamas.") +
                "\n" + "=".repeat(91) + "\n" + "    > Introduce tu nombre: ");
        nombre = sn.nextLine();
        jugador.setNom(nombre);

        System.out.println("\n" + "=".repeat(65) + "\n" + String.format("|%-63s|", " Bienvenido al coliseo " + jugador.getNom() + ", disfruta de tu estadia.") + "\n" + "=".repeat(65) + "\n");

        // Creamos el menu del programa

        while (!salir) {
            System.out.print("=".repeat(45) + "\n" + String.format("|%-43s|", "         <~> Coliseo Pokemon <~>") + "\n" + "=".repeat(45) + "\n" +
                    String.format("|%-43s|", " Titulo: " + jugador.getTitulo()) + "\n" + "=".repeat(45) + "\n" +
                    String.format( "|%-43s|", " 1.- Crea tu equipo Pokemon") + "\n" + String.format( "|%-43s|", " 2.- Crea un equipo Pokemon aleatorio") + "\n" +
                    String.format("|%-43s|", " 3.- Lucha contra un entrenador") + "\n" + String.format("|%-43s|", " 4.- Revancha") + "\n" +
                    String.format("|%-43s|", " 5.- Sal del Coliseo") + "\n" + "=".repeat(45) + "\n    > Escribe una opcion: ");

            opcion = sn.nextInt();

            switch (opcion) {
                case 1: // Aqui generamos el equipo pokemon del jugador a mano
                    System.out.println("\n" + "=".repeat(36) + "\n" + String.format("|%-34s|", " Vamos a crear tu equipo Pokemon! ") + "\n" + "=".repeat(36));
                    equipoPokemon.generarPokemonHumano(jugador);
                    break;
                case 2: // Aqui generamos el equipo pokemon del jugador aleatoriamente
                    System.out.println("\n" + "=".repeat(26) + "\n" + String.format("|%-24s|", " Equipo Pokemon creado! ") + "\n" + "=".repeat(26));
                    jugador.setPokemons(equipoPokemon.listaPokemons());
                    System.out.println(jugador);
                    break;
                case 3: // Aqui luchamos contra un nuevo entrenador
                    if (jugador.getPokemons().size() == 0) {
                        System.out.println("\n" + "=".repeat(35) + "\n" + String.format("|%-33s|", " Crea primero tu equipo Pokemon! ") + "\n" + "=".repeat(35));
                    }
                    else {
                        maquina.setNom(maquina.GeneradorNombres());
                        maquina.setPokemons(equipoPokemon.listaPokemons());
                        System.out.println("\n" + "=".repeat(40) + "\n" + String.format("|%-38s|", " " + maquina.getNom() + " quiere luchar!") + "\n" + "=".repeat(40));
                        System.out.println(maquina);
                        combate.LuchaPokemon(jugador, maquina);
                    }
                    break;
                case 4: // Aqui luchamos contra el anterior entrenador que habiamos luchado
                    if (jugador.getPokemons().size() == 0) {
                        System.out.println("\n" + "=".repeat(35) + "\n" + String.format("|%-33s|", " Crea primero tu equipo Pokemon! ") + "\n" + "=".repeat(35));
                    }
                    else {
                        System.out.println("\n" + "=".repeat(23) + "\n" + String.format("|%-21s|", " Empieza el combate! ") + "\n" + "=".repeat(23));
                        System.out.println(maquina);
                        combate.LuchaPokemon(jugador, maquina);
                    }
                    break;
                case 5:
                    salir = true;
                    break;
                default:
                    System.out.println("\nERROR: Introduce un numero entre 1 y 5\n");
            }
        }
    }
}

