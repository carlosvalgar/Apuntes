import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class VentanaAleatorio extends JFrame {
    private PanelAleatorio pa;
    private int num1 = (int) (Math.random() * 100), num2 = (int) (Math.random() * 100), intentos = 0, aciertos = 0;
    public VentanaAleatorio () {
        pa = new PanelAleatorio();

        pa.getJta()[0].setText(String.valueOf(num1));
        pa.getJta()[1].setText(String.valueOf(num2));
        pa.getJta()[3].setText(String.valueOf(intentos));
        pa.getJta()[4].setText(String.valueOf(aciertos));
        pa.getJta()[5].setText(String.valueOf(intentos - aciertos));

        setTitle("Aleatorio");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(480, 140);
        Toolkit pantalla = Toolkit.getDefaultToolkit();
        setIconImage(pantalla.getImage("src/dice.png"));
        setLocation(pantalla.getScreenSize().width / 2 - getWidth() / 2, pantalla.getScreenSize().height / 2 - getHeight() / 2);

        pa.getButton()[0].addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                num1 = (int) (Math.random() * 100);
                num2 = (int) (Math.random() * 100);
                pa.getJta()[0].setText(String.valueOf(num1));
                pa.getJta()[1].setText(String.valueOf(num2));
            }
        });

        pa.getButton()[1].addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    if ((Integer.valueOf(pa.getJta()[0].getText()) + Integer.valueOf(pa.getJta()[1].getText())) == Integer.valueOf(pa.getJta()[2].getText())) {
                        intentos += 1;
                        aciertos += 1;
                        pa.getJta()[3].setText(String.valueOf(intentos));
                        pa.getJta()[4].setText(String.valueOf(aciertos));
                        num1 = (int) (Math.random() * 100);
                        num2 = (int) (Math.random() * 100);
                        pa.getJta()[0].setText(String.valueOf(num1));
                        pa.getJta()[1].setText(String.valueOf(num2));
                    } else {
                        intentos += 1;
                        pa.getJta()[3].setText(String.valueOf(intentos));
                        pa.getJta()[5].setText(String.valueOf(intentos - aciertos));
                        num1 = (int) (Math.random() * 100);
                        num2 = (int) (Math.random() * 100);
                        pa.getJta()[0].setText(String.valueOf(num1));
                        pa.getJta()[1].setText(String.valueOf(num2));
                    }

                } catch (NumberFormatException exception) {
                    pa.getJta()[2].setText("Pon un entero");
                }
            }
        });

        pa.getButton()[2].addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dispose();
            }
        });

        add(pa, BorderLayout.CENTER);
        setResizable(false);
        setVisible(true);
    }
}
