import java.sql.*;
import java.util.ArrayList;

public class Ejemplo {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/farmville?serverTimezone=UTC"; //Añadir ?serverTimezone=UTC si aparece error de time zone
        String user = "root";
        String password = "t32i6zcf9893715";
        ArrayList<Construcciones> construcciones = new ArrayList<>();

        construcciones.add(new Construcciones(101, "Establo", 344, 35));
        construcciones.add(new Construcciones(102, "Establo", 344, 25));
        construcciones.add(new Construcciones(103, "Establo", 344, 15));
        String update = "";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            Statement stm = con.createStatement();
            // statement
            // Insert
            for(Construcciones c:construcciones){
                update = "INSERT INTO construcciones(id, nombre, precio, id_granjero)" + "VALUES (" + c.getId() + ", \"" + c.getNombre() + "\", " + c.getPrecio() + ", " + c.getId_granjero() + ");";
                System.out.println(update);
                stm.executeUpdate(update);
            }

            // Hacer una query
            String query = "SELECT * FROM construcciones WHERE id > 100";
            ResultSet rs = stm.executeQuery(query);
            while(rs.next()){
                System.out.println("ID: " + rs.getInt(1));
                System.out.println("Nombre: " + rs.getString(2));
                System.out.println("Precio: " + rs.getInt(1));
                System.out.println("id_granjero: " + rs.getInt(1));
            }

            // Borrar
            for (Construcciones c:construcciones){
                update = "DELETE FROM construcciones WHERE id = " + c.getId() + ";";
                stm.executeUpdate(update);
            }

            // prepared statement
            update = "INSERT INTO construcciones(id, nombre, precio, id_granjero) VALUES " + "(?, ?, ?, ?)" ;
            PreparedStatement pstm = con.prepareCall(update);
            for (Construcciones c:construcciones) {
                pstm.setInt(1, c.getId());
                pstm.setString(2, c.getNombre());
                pstm.setInt(3, c.getPrecio());
                pstm.setInt(4, c.getId_granjero());
            }
            // Hacer una query
            query = "SELECT * FROM construcciones where id > " + "?";
            pstm = con.prepareStatement(query);
            pstm.setInt(1, 100);
            rs = pstm.executeQuery(query);
            while(rs.next()){
                System.out.println("ID: " + rs.getInt(1));
                System.out.println("Nombre: " + rs.getString(2));
                System.out.println("Precio: " + rs.getInt(1));
                System.out.println("id_granjero: " + rs.getInt(1));
            }
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
