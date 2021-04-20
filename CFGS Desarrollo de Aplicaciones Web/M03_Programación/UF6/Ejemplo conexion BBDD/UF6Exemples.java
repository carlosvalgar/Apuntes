import java.sql.*;
import java.util.Scanner;

public class UF6Exemples {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/habitants?serverTimezone=UTC"; //Añadir ?serverTimezone=UTC si aparece error de time zone
        String user = "root";
        String password = "t32i6zcf9893715";
        Scanner scan = new Scanner(System.in);
        // Instanciar objeto
        Connection conexion = null;
        String query = "SELECT * from habitants";
        // Cargar el driver (Se hace en cada proyecto >> File >> Project Structure >>libreries >> + >> java >> escojes .jar >> modules >> dependencies y ver que esta
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Crear conexion con la BBDD
            conexion = DriverManager.getConnection(url, user, password);

            // Crear consulta Statement o PreparedStatement
            // Statement
            // Ejecutar consulta
            Statement stm = conexion.createStatement();
            ResultSet rs = stm.executeQuery(query);

            while(rs.next()) {
                System.out.println("DNI: " + rs.getString(1));
                System.out.println("Nom: " + rs.getString(2));
                System.out.println("Fecha de nacimiento: " + rs.getDate(3));
                System.out.println("Direccion: " + rs.getString(4));
                System.out.println("Telefono: " + rs.getString(5));
            }

            // INSERT

            PreparedStatement pstm = conexion.prepareStatement("INSERT INTO habitants(dni, nombre, fecnac, dir, tfno) VALUES(?, ?, ?, ?, ?)");

            System.out.println("DNI:\n    > ");
            String dni = scan.nextLine();
            System.out.println("Nombre:\n    > ");
            String nom = scan.nextLine();
            System.out.println("Direccion:\n    > ");
            String dir = scan.nextLine();
            System.out.println("Telefono:\n    > ");
            int tlf = scan.nextInt();

            java.util.Date date = new java.util.Date();

            pstm.setString(1, dni);
            pstm.setString(2, nom);
            pstm.setDate(3, new java.sql.Date(date.getTime()));
            pstm.setString(4, dir);
            pstm.setInt(5, tlf);

            pstm.executeUpdate();


        }
        catch (ClassNotFoundException error){
            error.printStackTrace();
            System.out.println("No se ha podido cargar el driver");
        }
        catch (SQLException error) {
            error.printStackTrace();
            System.out.println("No se ha podido acceder a la base de datos");
        }
        finally {
            try {
                conexion.close();
            }

            catch (SQLException error){
                error.printStackTrace();
                System.out.println("No se ha podido cerrar la base de datos");
            }
        }
    }
}
