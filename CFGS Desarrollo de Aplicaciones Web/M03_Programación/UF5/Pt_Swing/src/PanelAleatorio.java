import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;

public class PanelAleatorio extends JPanel {
    private JLabel jl[] = new JLabel[6];
    private JTextArea jta[] = new JTextArea[6];
    private JButton button[] = new JButton[3];

    public PanelAleatorio() {
        iniciarComponentes();

        for (int i = 0; i < jta.length; i++) {
            add(jl[i]);
            add(jta[i]);
            if (i != 2) {
                jta[i].setEditable(false);
            }
        }
        for (int i = 0; i < button.length; i++) {
            add(button[i]);
        }
    }

    public void iniciarComponentes() {
        jl[0] = new JLabel("Número 1:");
        jl[1] = new JLabel("Número 2:");
        jl[2] = new JLabel("= Resultado");
        jl[3] = new JLabel("Intentos:");
        jl[4] = new JLabel("Aciertos:");
        jl[5] = new JLabel("Fallas:");
        for (int i = 0; i < 6; i++) {
            jta[i] = new JTextArea(1, 7);
        }

        button[0] = new JButton("Activar");
        button[1] = new JButton("Comprobar");
        button[2] = new JButton("Salir");
    }

    public JLabel[] getJl() {
        return jl;
    }

    public void setJl(JLabel[] jl) {
        this.jl = jl;
    }

    public JTextArea[] getJta() {
        return jta;
    }

    public void setJta(JTextArea[] jta) {
        this.jta = jta;
    }

    public JButton[] getButton() {
        return button;
    }

    public void setButton(JButton[] button) {
        this.button = button;
    }
}
