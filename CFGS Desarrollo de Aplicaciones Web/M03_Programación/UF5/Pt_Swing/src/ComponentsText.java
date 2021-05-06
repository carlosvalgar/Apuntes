import javax.swing.*;
import java.awt.*;

public class ComponentsText extends JPanel{
    private JLabel jl[] = new JLabel[5];
    private JTextField jtf;
    private JPasswordField jpf;
    private JTextArea jta;
    private JScrollPane jsp;

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
                        c.anchor = GridBagConstraints.WEST;
                        add(jtf, c);
                        break;
                    case 1:
                        c.gridx = 1;
                        c.gridy = i;
                        c.anchor = GridBagConstraints.WEST;
                        add(jpf, c);
                        break;
                    case 2:
                        c.gridx = 1;
                        c.gridy = i;
                        c.anchor = GridBagConstraints.WEST;
                        add(jsp, c);
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
        jta.setLineWrap(true);
        jsp = new JScrollPane(jta, JScrollPane.VERTICAL_SCROLLBAR_NEVER, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

        jtf.setBorder(BorderFactory.createLineBorder(Color.BLACK));
        jpf.setBorder(BorderFactory.createLineBorder(Color.BLACK));
        jsp.setBorder(BorderFactory.createLineBorder(Color.BLACK));

    }

    public JLabel[] getJl() {
        return jl;
    }

    public void setJl(JLabel[] jl) {
        this.jl = jl;
    }

    public JTextField getJtf() {
        return jtf;
    }

    public void setJtf(JTextField jtf) {
        this.jtf = jtf;
    }

    public JPasswordField getJpf() {
        return jpf;
    }

    public void setJpf(JPasswordField jpf) {
        this.jpf = jpf;
    }

    public JTextArea getJta() {
        return jta;
    }

    public void setJta(JTextArea jta) {
        this.jta = jta;
    }

    public JScrollPane getJsp() {
        return jsp;
    }

    public void setJsp(JScrollPane jsp) {
        this.jsp = jsp;
    }
}
