import javax.swing.*;
import java.awt.*;

public class VentanaCheckboxes extends JFrame {

    public VentanaCheckboxes(){
        setTitle("Checkboxes");
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        setSize(500, 500);
        Toolkit pantalla = Toolkit.getDefaultToolkit();
        setIconImage(pantalla.getImage("src/checkbox_verde.png"));
        setLocation(pantalla.getScreenSize().width / 2 - getWidth() / 2, pantalla.getScreenSize().height / 2 - getHeight() / 2);

        setResizable(false);
        setVisible(true);
    }
}
