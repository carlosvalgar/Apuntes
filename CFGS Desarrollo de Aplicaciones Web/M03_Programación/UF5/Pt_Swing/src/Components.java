import javax.swing.*;
import java.awt.*;

public class Components extends JFrame {
    private JTabbedPane panel1, panel2, panel3, panel4;
    private ComponentsText ct;
    private JPanel jpanel1;
    public Components () {
        ct = new ComponentsText();
        panel1 = new JTabbedPane();
        panel2 = new JTabbedPane();
        panel3 = new JTabbedPane();
        panel4 = new JTabbedPane();
        jpanel1 = new JPanel();

        jpanel1.setLayout(new FlowLayout(FlowLayout.LEFT));
        jpanel1.add(ct);

        panel1.addTab("Text", jpanel1);
        panel1.addTab("JList", panel3);
        panel1.addTab("Escull", panel4);



        setTitle("Components");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(640, 480);

        Toolkit pantalla = Toolkit.getDefaultToolkit();
        setIconImage(pantalla.getImage("src/component.png"));
        setLocation(pantalla.getScreenSize().width / 2 - getWidth() / 2, pantalla.getScreenSize().height / 2 - getHeight() / 2);

        add(panel1);
        setResizable(false);
        setVisible(true);
    }
}
