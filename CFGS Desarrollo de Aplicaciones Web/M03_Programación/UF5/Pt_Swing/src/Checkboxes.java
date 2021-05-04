import javax.swing.*;
import java.awt.*;

public class Checkboxes extends JPanel{
    JCheckBox[] checkBoxes = new JCheckBox[4];

    public Checkboxes() {
        iniciarComponentes(); // Iniciamos las checkboxes
        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS)); // Hacemos que el layout sea un BoxLayout de arriba a abajo
        this.setBackground(Color.WHITE); // Cambiamos el fondo de el JPanel a blanco
        for (int i = 0; i < checkBoxes.length; i++){
            checkBoxes[i].setBackground(Color.WHITE); // Cambiamos el fondo de cada boton a blanco
            add(checkBoxes[i]); // Generamos todas las checboxes
        }
    }

    public void iniciarComponentes(){ // Nos genera 4 checkboxes con 4 etiquetas diferentes
        checkBoxes[0] = new JCheckBox("Color");
        checkBoxes[1] = new JCheckBox("Negreta");
        checkBoxes[2] = new JCheckBox("Inclinada");
        checkBoxes[3] = new JCheckBox("Gran");
    }
}
