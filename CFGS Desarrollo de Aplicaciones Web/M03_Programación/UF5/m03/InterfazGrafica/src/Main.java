import javax.swing.*;
import java.awt.*;

public class Main {
    public static void main(String[] args) {
        new Marco(); // Marco ventana = new Marco();
    }
}

class Marco extends JFrame {
    // Por defecto: Tiene tamaño 0, no es visible (deberia ser de las ultimas lineas), se puede estirar, se situa arriba a la izquierda
    JButton botones[] = new JButton[5];
    public Marco() {
        this.setTitle("Mi primera ventanita uwu"); // super("Mi primera ventanita uwu"); Dan el mismo resultado
        this.setSize(1000, 1000);// Cambia el tamaño si hay un set bounds u otro no setSize el anterior queda obsoleto
        this.setDefaultCloseOperation(EXIT_ON_CLOSE); // Para cuando cierre la ventana, exit_on_close nos servira para que se acabe el proceso en el pc
        initComponent();
        this.add(botones[0], BorderLayout.NORTH);
        this.add(botones[1], BorderLayout.SOUTH);
        this.add(botones[2], BorderLayout.CENTER);
        this.add(botones[3], BorderLayout.EAST);
        this.add(botones[4], BorderLayout.WEST);
        this.setVisible(true); // Hacemos que sea visible o no
        this.setResizable(false); // Hacemos que podamos modificar el tamaño de la pantalla
        this.setBounds(50, 100, 1000, 1000); // Te posiciona la pantalla en un lugar y te cambia el tamaño de la pantalla

        // Cambiar el icono de la ventana
        Toolkit pantalla = Toolkit.getDefaultToolkit();
        Image imagen = pantalla.getImage("src/pinguinito.PNG");
        this.setIconImage(imagen);

        // Centramos la ventana
        Dimension grandaria = pantalla.getScreenSize();
        setLocation((grandaria.width / 2) - (this.getWidth() / 2), (grandaria.height / 2) - (this.getHeight() /2));
        // Layouts: Flowlayout (Uno detras de otro), Boxlayout(Uno detras de otro, horizontal o vertical), gridlayout() te genera un layout en formato grid
    }

    public void initComponent() {
        botones[0] = new JButton("Boton");
        // Cojemos una imagen
        ImageIcon imagen = new ImageIcon("src/pinguinito.PNG");
        // La escalamos
        ImageIcon imagen2 = new ImageIcon(imagen.getImage().getScaledInstance(100, 100, Image.SCALE_DEFAULT));
        botones[1] = new JButton("Pinguinito", imagen2);
        botones[1].setPreferredSize(new Dimension(500,500));
        botones[2] = new JButton(imagen2);
        botones[3] = new JButton("Super Pinguinito", imagen2);
        botones[4] = new JButton("Mega Pinguinito", new ImageIcon(imagen2.getImage().getScaledInstance(500, 500, Image.SCALE_DEFAULT)));
    }
}