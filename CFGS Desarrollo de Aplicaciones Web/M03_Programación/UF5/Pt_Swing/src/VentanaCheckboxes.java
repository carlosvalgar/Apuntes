import javax.swing.*;
import java.awt.*;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

public class VentanaCheckboxes extends JFrame {
    private Checkboxes checkboxes;
    private JLabel texto;
    private int size = 16, estilo = Font.PLAIN;

    public VentanaCheckboxes(){
        checkboxes = new Checkboxes(); // Iniciamos las checkboxes en la ventana

        texto = new JLabel("Jugem amb checkBoxes....", SwingConstants.CENTER); // Generamos el JLabel para que aparezca el texto
        texto.setFont(new Font("Arial", estilo, size)); // Le ponemos la fuente que queremos al texto
        texto.setOpaque(true); // Aplicamos que se pueda cambiar el color al JLabel
        texto.setBackground(Color.WHITE); // Cambiamos el color del JLabel a blanco

        setTitle("Checkboxes"); // Cambiamos el titulo de la aplicacion
        setDefaultCloseOperation(EXIT_ON_CLOSE); // Hacemos que cuando se cierre la ventana de la aplicacion, esta tambien se acabe
        setSize(540, 140); // Ponemos el tamaño de la ventana
        // Generamos el toolkit para poner un icono y colocar la pantalla al medio para cuando inicie
        Toolkit pantalla = Toolkit.getDefaultToolkit();
        setIconImage(pantalla.getImage("src/checkbox_verde.png"));
        setLocation(pantalla.getScreenSize().width / 2 - getWidth() / 2, pantalla.getScreenSize().height / 2 - getHeight() / 2);

        // Añadimos los metodos de cada checkbox
        checkboxes.checkBoxes[0].addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == 1) { // Si se enciende cambiara el background de la aplicacion a rosa
                    texto.setBackground(Color.PINK);
                    checkboxes.setBackground(Color.PINK);
                    for (JCheckBox checkbox:checkboxes.checkBoxes) {
                        checkbox.setBackground(Color.PINK);
                    }
                } else { // Cuando se apaga vuelve el background a blanco
                    texto.setBackground(Color.WHITE);
                    checkboxes.setBackground(Color.WHITE);
                    for (JCheckBox checkbox:checkboxes.checkBoxes) {
                        checkbox.setBackground(Color.WHITE);
                    }
                }
            }
        });
        checkboxes.checkBoxes[1].addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == 1) { // Si se activa la letra del JPanel se pone en negrita
                    estilo += Font.BOLD;
                } else { // Al desactivarla se quita la negrita
                    estilo -= Font.BOLD;
                }
                texto.setFont(new Font("Arial", estilo, size));
            }
        });
        checkboxes.checkBoxes[2].addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == 1) { // Si se activa la letra del JPanel se pone en cursiva
                    estilo += Font.ITALIC;
                } else { // Al desactivarla se desactiva la cursiva
                    estilo -= Font.ITALIC;
                }
                texto.setFont(new Font("Arial", estilo, size));
            }
        });
        checkboxes.checkBoxes[3].addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (e.getStateChange() == 1) { // Al activarlo hace que la fuente de letra sea mayor
                    size = 32;
                } else { // Al desactivarla la fuente vuelve a la mida normal
                    size = 16;
                }
                texto.setFont(new Font("Arial", estilo, size));
            }
        });

        // Ponemos los objetos en nuestra ventana y la habilitamos
        add(checkboxes, BorderLayout.EAST);
        add(texto, BorderLayout.CENTER);

        setResizable(false);
        setVisible(true);
    }



}
