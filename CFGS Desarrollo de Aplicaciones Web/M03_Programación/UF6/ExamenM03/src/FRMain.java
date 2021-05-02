import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;

public class FRMain {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/joc?serverTimezone=UTC";
        String user = "root";
        String password = "t32i6zcf9893715";
        int opcionMenu = 0;
        int id = 0;
        int varBool = 0;
        String nom_pokemon = "";
        float pes = 0;
        int ataque = 0, defensa = 0, idespecies = 0;
        ArrayList<Pokemon> pokemons = new ArrayList<Pokemon>();
        Scanner scan = new Scanner(System.in);
        String query = "SELECT * FROM especies";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stm = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stm.executeQuery(query);
            ResultSetMetaData rsmt = rs.getMetaData();

            do {
                System.out.print("Menú examen\n\n1.- Introducir especies Raton, Hada, Taladro y Hada forta\n2.- Introducir 4 Pokemons\n3.- Mostrar Pokemons y Mostrar Pokemons que pesen mas de 35 kg" +
                        "\n4.- Introducir 2 pokemon con prepared statement\n5.- Mostrar pokemons Hada con mas de 60 de ataque con prepared statement, insertar" +
                        "resultado con el result set y cambiar tipo a hada forta\n6.- Salir\nElige tu opcion:\n    > ");
                opcionMenu = scan.nextInt();
                scan.nextLine();
                switch(opcionMenu){
                    case 1:
                        query = "SELECT COUNT(*) FROM especies WHERE nomEspecies = \"Taladro\"";
                        rs = stm.executeQuery(query);
                        while (rs.next()) {
                            varBool = rs.getInt(1);
                        }
                        if (varBool >= 1) {
                            System.out.println("Ya has introducido las especies Raton, Hada y Taladro.");
                        }

                        else {
                            query = "SELECT max(id) FROM especies;";
                            rs = stm.executeQuery(query);
                            while (rs.next()) {
                                id = rs.getInt(1) + 1;
                            }
                            query = "INSERT INTO especies(id, nomEspecies) VALUES (" + id + ", \"Raton\" )";
                            stm.executeUpdate(query);
                            System.out.println("Añadido Raton con id: " + id);
                            id++;
                            query = "INSERT INTO especies(id, nomEspecies) VALUES (" + id + ", \"Hada\" )";
                            stm.executeUpdate(query);
                            System.out.println("Añadido Hada con id: " + id);
                            id++;
                            query = "INSERT INTO especies(id, nomEspecies) VALUES (" + id + ", \"Taladro\" )";
                            System.out.println("Añadido Taladro con id: " + id);
                            stm.executeUpdate(query);
                            id++;
                            query = "INSERT INTO especies(id, nomEspecies) VALUES (" + id + ", \"Hada forta\" )";
                            stm.executeUpdate(query);
                            System.out.println("Añadido Hada forta con id: " + id);

                        }
                        break;

                    case 2:
                        pokemons = new ArrayList<Pokemon>();
                        System.out.println("Vamos a añadir 4 pokemon!");
                        for (int i = 1; i <= 4; i++){
                            System.out.println("Pokemon " + i);
                            System.out.print("Introduce el nombre del pokemon: ");
                            nom_pokemon = scan.nextLine();
                            System.out.print("Introduce el peso del pokemon: ");
                            pes = scan.nextFloat();
                            System.out.print("Introduce el ataque del pokemon: ");
                            ataque = scan.nextInt();
                            System.out.print("Introduce la defensa del pokemon: ");
                            defensa = scan.nextInt();
                            System.out.print("Introduce la id especies del pokemon: ");
                            idespecies = scan.nextInt();
                            scan.nextLine();
                            pokemons.add(new Pokemon(nom_pokemon, pes, ataque, defensa, idespecies));
                        }

                        query = "SELECT max(id) FROM pokemon";
                        rs = stm.executeQuery(query);
                        while (rs.next()) {
                            id = rs.getInt(1) + 1;
                        }

                        for (Pokemon pokemon:pokemons){
                            query = "INSERT INTO pokemon (id, nom_pokemon, pes, ataque, defensa, idespecies) VALUES (" + id + ", \"" + pokemon.getNom_pokemon() + "\", " +
                        pokemon.getPes() + ", " + pokemon.getAtaque() + ", " + pokemon.getDefensa() + ", " + pokemon.getIdespecies() + ")";
                            stm.executeUpdate(query);
                            System.out.println("Pokemon " + pokemon.getNom_pokemon() + " insertado en la BBDD.");
                            id++;
                        }
                        break;

                    case 3:
                        query = "SELECT * FROM pokemon";
                        rs = stm.executeQuery(query);
                        rsmt = rs.getMetaData();
                        while (rs.next()){
                            System.out.println(rsmt.getColumnName(1) + ": " + rs.getInt(1) + ", " + rsmt.getColumnName(2) + ": " + rs.getString(2) + ", " +
                                    rsmt.getColumnName(3) + ": " + rs.getFloat(3) + ", " + rsmt.getColumnName(4) + ": " + rs.getInt(4) + ", " +
                                    rsmt.getColumnName(5) + ": " + rs.getInt(5) + ", " + rsmt.getColumnName(6) + ": " + rs.getInt(6));
                        }
                        rs.absolute(0);
                        System.out.println("Pokemon que pesan mas de 35 kg:");
                        while(rs.next()){
                            if (rs.getFloat(3) > 35) {
                                System.out.println(rsmt.getColumnName(2) + ": " + rs.getString(2));
                            }
                        }
                        break;

                    case 4:
                        pokemons = new ArrayList<Pokemon>();
                        System.out.println("Vamos a añadir 2 pokemon!");
                        for (int i = 1; i <= 2; i++){
                            System.out.println("Pokemon " + i);
                            System.out.print("Introduce el nombre del pokemon: ");
                            nom_pokemon = scan.nextLine();
                            System.out.print("Introduce el peso del pokemon: ");
                            pes = scan.nextFloat();
                            System.out.print("Introduce el ataque del pokemon: ");
                            ataque = scan.nextInt();
                            System.out.print("Introduce la defensa del pokemon: ");
                            defensa = scan.nextInt();
                            System.out.print("Introduce la id especies del pokemon: ");
                            idespecies = scan.nextInt();
                            scan.nextLine();
                            pokemons.add(new Pokemon(nom_pokemon, pes, ataque, defensa, idespecies));
                        }

                        query = "SELECT max(id) FROM pokemon";
                        rs = stm.executeQuery(query);
                        while (rs.next()) {
                            id = rs.getInt(1) + 1;
                        }
                        query = "INSERT INTO pokemon (id, nom_pokemon, pes, ataque, defensa, idespecies) VALUES(?, ?, ?, ?, ?, ?)";
                        PreparedStatement pstm = con.prepareCall(query);
                        for (Pokemon pokemon:pokemons) {
                            pstm.setInt(1, id);
                            pstm.setString(2, pokemon.getNom_pokemon());
                            pstm.setFloat(3, pokemon.getPes());
                            pstm.setInt(4, pokemon.getAtaque());
                            pstm.setInt(5, pokemon.getDefensa());
                            pstm.setInt(6, pokemon.getIdespecies());
                            pstm.executeUpdate();
                            System.out.println("Pokemon " + pokemon.getNom_pokemon() + " introducido.");
                            id++;
                        }

                        break;

                    case 5:
                        query = "SELECT max(id) FROM pokemon";
                        rs = stm.executeQuery(query);
                        while (rs.next()) {
                            id = rs.getInt(1) + 1;
                        }
                        query = "SELECT * FROM pokemon WHERE ataque > 60 AND idespecies = 14 ";
                        pstm = con.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        rs = pstm.executeQuery(query);
                        rsmt = rs.getMetaData();
                        while (rs.next()){
                            System.out.println(rsmt.getColumnName(1) + ": " + rs.getInt(1) + ", " + rsmt.getColumnName(2) + ": " + rs.getString(2) + ", " +
                                    rsmt.getColumnName(3) + ": " + rs.getFloat(3) + ", " + rsmt.getColumnName(4) + ": " + rs.getInt(4) + ", " +
                                    rsmt.getColumnName(5) + ": " + rs.getInt(5) + ", " + rsmt.getColumnName(6) + ": " + rs.getInt(6));
                        }

                        rs.moveToInsertRow();
                        System.out.print("Introduce el nombre del pokemon: ");
                        nom_pokemon = scan.nextLine();
                        System.out.print("Introduce el peso del pokemon: ");
                        pes = scan.nextFloat();
                        System.out.print("Introduce el ataque del pokemon: ");
                        ataque = scan.nextInt();
                        System.out.print("Introduce la defensa del pokemon: ");
                        defensa = scan.nextInt();
                        System.out.print("Introduce la id especies del pokemon: ");
                        idespecies = scan.nextInt();
                        scan.nextLine();
                        rs.updateInt(1, id);
                        rs.updateString(2, nom_pokemon);
                        rs.updateFloat(3, pes);
                        rs.updateInt(4, ataque);
                        rs.updateInt(5, defensa);
                        rs.updateInt(6, idespecies);
                        rs.insertRow();
                        System.out.println("Pokemon " + nom_pokemon + " insertado");

                        rs.absolute(0);
                        while (rs.next()) {
                            if (rs.getInt(5) > 67 && rs.getInt(6) ==  14) {
                                rs.updateInt(6,16);
                                rs.updateRow();
                                System.out.println("Pokemon" + rs.getString(2) + " canvia su tipo a hada forta.");
                            }
                        }
                        break;

                    case 6:
                        break;

                    default:
                        System.out.println("ERROR: Introduce una opción válida.");
                }
            }while(opcionMenu != 6);
        }

        catch (ClassNotFoundException error){
            error.printStackTrace();
            System.out.println("No se ha podido cargar el driver");
        }

        catch (SQLException error) {
            error.printStackTrace();
            System.out.println("No se ha podido acceder a la base de datos");
        }
    }
}
