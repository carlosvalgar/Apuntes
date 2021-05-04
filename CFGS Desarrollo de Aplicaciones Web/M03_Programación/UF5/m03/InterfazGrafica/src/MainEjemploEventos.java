import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Random;

public class MainEjemploEventos {
    public static void main(String[] args) {
        new VentanaEvento();
    }

}
class VentanaEvento extends JFrame {
    JPanel panel;
    JButton button;
    public VentanaEvento() {
        panel = new JPanel();
        setSize(400,400);
        button = new JButton("Cambiar color");
        panel.add(button);
        button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                panel.setBackground(new Color((int) (Math.random() * 256), (int) (Math.random() * 256), (int) (Math.random() * 256)));
            }
        });
        add(panel, BorderLayout.CENTER);
        setVisible(true);
    }
}