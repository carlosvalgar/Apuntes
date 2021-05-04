import javax.swing.*;
import java.awt.*;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

public class VentanaCheckboxes extends JFrame {
    private Checkboxes checkboxes;
    private JLabel texto;
    public VentanaCheckboxes(){
        checkboxes = new Checkboxes();
        texto = new JLabel("Jugem amb checkBoxes....", SwingConstants.CENTER);
        texto.setFont(new Font("Arial", Font.PLAIN, 16));
        texto.setOpaque(true);
        texto.setBackground(Color.WHITE);
        setTitle("Checkboxes");
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        setSize(540, 140);
        Toolkit pantalla = Toolkit.getDefaultToolkit();
        setIconImage(pantalla.getImage("src/checkbox_verde.png"));
        setLocation(pantalla.getScreenSize().width / 2 - getWidth() / 2, pantalla.getScreenSize().height / 2 - getHeight() / 2);
        checkboxes.checkBoxes[0].addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == 1) {
                    texto.setBackground(Color.PINK);
                } else {
                    texto.setBackground(Color.WHITE);
                }
            }
        });
        checkboxes.checkBoxes[1].addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == 1) {
                    texto.setFont(new Font("Arial", Font.BOLD, 16));
                } else {
                    texto.setFont(new Font("Arial", Font.PLAIN, 16));
                }
            }
        });
        checkboxes.checkBoxes[2].addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == 1) {
                    texto.setFont(new Font("Arial", Font.ITALIC, 16));
                } else {
                    texto.setFont(new Font("Arial", Font.PLAIN, 16));
                }
            }
        });
        checkboxes.checkBoxes[3].addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == 1) {
                    texto.setFont(new Font("Arial", Font.PLAIN, 32));
                } else {
                    texto.setFont(new Font("Arial", Font.PLAIN, 16));
                }
            }
        });

        add(checkboxes, BorderLayout.EAST);

        add(texto, BorderLayout.CENTER);
        setResizable(false);
        setVisible(true);
    }



}
