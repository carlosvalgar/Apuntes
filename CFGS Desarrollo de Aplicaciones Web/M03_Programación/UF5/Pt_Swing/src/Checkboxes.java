import javax.swing.*;
import java.awt.*;

public class Checkboxes extends JPanel{
    JCheckBox[] checkBoxes = new JCheckBox[4];

    public Checkboxes() {
        iniciarComponentes();
        setLayout(new GridLayout(4, 1));
        for (int i = 0; i < checkBoxes.length; i++){
            add(checkBoxes[i]);
        }
    }

    public void iniciarComponentes(){
        checkBoxes[0] = new JCheckBox("Color");
        checkBoxes[1] = new JCheckBox("Negreta");
        checkBoxes[2] = new JCheckBox("Inclinada");
        checkBoxes[3] = new JCheckBox("Gran");
    }
}
