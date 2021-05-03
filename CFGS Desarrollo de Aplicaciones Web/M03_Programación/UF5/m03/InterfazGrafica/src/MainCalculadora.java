import javax.swing.*;
import java.awt.*;

public class MainCalculadora {
    public static void main(String[] args) {
        new VentanaCalculadora();
    }
}

class PanelSuperior extends JPanel {
    JTextArea jTextArea;
    public PanelSuperior() {
        jTextArea = new JTextArea();
        add(jTextArea);
    }
}

class PanelInferior extends JPanel {
    JButton botones[] = new JButton[12];
    public PanelInferior() {
        initComponent();
        setLayout(new GridLayout(4, 3));
        for (int i = 0; i < botones.length; i++) {
            add(botones[i]);
        }
    }
    public void initComponent() {
        for (int i = 1; i < 10; i++) {
            botones[i - 1] = new JButton("" + i);
        }
        botones[9] = new JButton("+");
        botones[10] = new JButton("" + 0);
        botones[11] = new JButton("-");
    }
}

class VentanaCalculadora extends JFrame {
    PanelInferior pi;
    PanelSuperior ps;

    public VentanaCalculadora() {
        pi = new PanelInferior();
        ps = new PanelSuperior();
        this.setTitle("MyCalc"); // super("Mi primera ventanita uwu"); Dan el mismo resultado
        this.setDefaultCloseOperation(EXIT_ON_CLOSE); // Para cuando cierre la ventana, exit_on_close nos servira para que se acabe el proceso en el pc
        this.setResizable(false); // Hacemos que podamos modificar el tamaño de la pantalla
        this.setBounds(50, 100, 500, 500); // Te posiciona la pantalla en un lugar y te cambia el tamaño de la pantalla

        add(ps, BorderLayout.NORTH);
        add(pi, BorderLayout.CENTER);

        this.setVisible(true); // Hacemos que sea visible o no
    }
}