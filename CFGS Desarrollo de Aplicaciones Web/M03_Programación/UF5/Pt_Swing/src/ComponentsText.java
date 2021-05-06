import javax.swing.*;
import java.awt.*;

public class ComponentsText extends JPanel{
    private JLabel jl[] = new JLabel[5];
    private JTextField jtf;
    private JPasswordField jpf;
    private JTextArea jta;

    public ComponentsText() {
        iniciarComponentes();
        setLayout(new GridBagLayout());
        GridBagConstraints c = new GridBagConstraints();
        c.insets = new Insets(10,0,0,5);
                for (int i = 0; i < jl.length; i++) {
            if (!(i == 4)) {
                c.gridx = 0;
                c.gridy = i;
                c.anchor = GridBagConstraints.NORTHEAST;
                add(jl[i], c);

                ;
                switch (i) {
                    case 0:
                        c.gridx = 1;
                        c.gridy = i;
                        add(jtf, c);
                        break;
                    case 1:
                        c.gridx = 1;
                        c.gridy = i;
                        add(jpf, c);
                        break;
                    case 2:
                        c.gridx = 1;
                        c.gridy = i;
                        add(jta, c);
                        break;
                    case 3:
                        c.gridx = 1;
                        c.gridy = i;
                        c.anchor = GridBagConstraints.WEST;
                        add(jl[4], c);
                        break;
                }
            }
            // setBorder(BorderFactory.createLineBorder(Color.BLACK));
        }



    }

    public void iniciarComponentes(){
        jl[0] = new JLabel("JTextField");
        jl[1] = new JLabel("JPasswordField");
        jl[2] = new JLabel("JTextArea");
        jl[3] = new JLabel("JLabel");
        jl[4] = new JLabel("Text");

        jtf = new JTextField("Text", 15);
        jpf = new JPasswordField("Text", 15);
        jta = new JTextArea("Text", 3, 15);
        jtf.setBorder(BorderFactory.createLineBorder(Color.BLACK));
        jpf.setBorder(BorderFactory.createLineBorder(Color.BLACK));
        jta.setBorder(BorderFactory.createLineBorder(Color.BLACK));

    }
}
