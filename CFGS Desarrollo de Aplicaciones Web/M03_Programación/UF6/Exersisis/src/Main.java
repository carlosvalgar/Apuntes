import java.sql.*;
import java.util.Timer;
import java.util.TimerTask;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/farmville?serverTimezone=UTC";
        String user = "root";
        String password = "";
        String query = "select * from construcciones";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stm = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            // TYPE_FORWARD_ONLY: por defecto (Solo te permite ir hacia delante)
            // TYPE_SCROLL_INSENSITIVE (Te permite ir hacia delante o hacia detras, no te permite ver cambios en live)
            // TYPE_SCROLL_SENSITIVE (Te permite ir hacia delante o hacia detras, te permite ver cambios en live)
            // CONCUR_READ_ONLY (Solo te permite leer)
            // CONCUR_UPDATABLE (Te permite updatear la tabla)
            ResultSet rs = stm.executeQuery(query);
            // comprobarActualizacion(rs);

            // miramos si la BBDD que utilizamos puede usar la combinacion que le ponemos
            DatabaseMetaData obj = con.getMetaData();
            boolean soporta = obj.supportsResultSetType(ResultSet.TYPE_SCROLL_INSENSITIVE);
            soporta = obj.supportsResultSetConcurrency(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            if (soporta){
                System.out.println("SI");
            }
            else {
                System.out.println("NO");
            }
            query = "select * from construcciones where id = 104;";
            rs = stm.executeQuery(query);
            rs.next();
            // insertarFila(rs);
            // eliminarFila(rs);
            ResultSetMetaData rsmt = rs.getMetaData();
            for (int i = 1; i <= rsmt.getColumnCount();i++){
                System.out.println(rsmt.getColumnName(i) + " " + rsmt.getColumnTypeName(i));
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
    public static void comprobarActualizacion(ResultSet rs) {
        Timer t = new Timer();
        // task, tendriamos que tener una clase que implementa timer task
        t.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                try {
                    rs.absolute(2); // Te mira la row 2
                    System.out.println("ID: " + rs.getInt(1) + " Nombre: " + rs.getString(2));
                }
                catch (SQLException error) {
                    error.printStackTrace();
                    System.out.println("No se ha podido acceder a la base de datos");
                }
            }
        }, 10000, 10000);
    }
    public static void insertarFila (ResultSet rs) {
        //situarme en la fila a insertar
        try {
            rs.moveToInsertRow();
            rs.updateInt(1, 104);
            rs.updateString(2, "bichobicho");
            rs.updateInt(3, 76567);
            rs.updateInt(4, 63);
            //rs.rowUpdated(); dependiendo del rs que hemos creado usaremos rowUpdated o insertRow
            rs.insertRow();
        }
        catch (SQLException error) {
            error.printStackTrace();
            System.out.println("No se ha podido acceder a la base de datos");
        }
    }

    public static void eliminarFila(ResultSet rs) {
        try{

            // rs.absolute(104); // rs.last()
            rs.deleteRow();


        }
        catch (SQLException error) {
            error.printStackTrace();
            System.out.println("No se ha podido acceder a la base de datos");
        }
    }

}
