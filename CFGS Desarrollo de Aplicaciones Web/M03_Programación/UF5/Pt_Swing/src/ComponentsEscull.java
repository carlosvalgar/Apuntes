import javax.swing.*;
import java.awt.*;

public class ComponentsEscull extends JPanel {
    private JRadioButton jRadioButton;
    private JComboBox jComboBox;
    private String[] textoJComboBox = {"Azul", "Rojo", "Amarillo"};
    private JPanel jPanel1, jPanel2;
    private JTextArea jTextArea;

    public ComponentsEscull() {
        iniciarComponentes();
        setLayout(new GridBagLayout());
        GridBagConstraints c = new GridBagConstraints();
        c.insets = new Insets(10,0,10,0);
        c.gridx = 0;
        c.gridy = 0;
        add(jTextArea, c);

        c.gridy = 1;
        add(jPanel1, c);
    }

    public void iniciarComponentes() {
        jRadioButton = new JRadioButton("Complementario");
        jComboBox = new JComboBox(textoJComboBox);
        jPanel1 = new JPanel();
        jComboBox.setAlignmentX(Component.LEFT_ALIGNMENT);
        jRadioButton.setAlignmentX(Component.LEFT_ALIGNMENT);

        jPanel1.add(jComboBox);
        jPanel1.add(jRadioButton);
        jPanel1.setLayout(new BoxLayout(jPanel1, BoxLayout.Y_AXIS));


        jTextArea = new JTextArea(15, 24);
        jTextArea.setBackground(Color.BLUE);
        jTextArea.setEditable(false);
        jTextArea.setBorder(BorderFactory.createLineBorder(Color.BLACK, 5));

    }

    public JRadioButton getjRadioButton() {
        return jRadioButton;
    }

    public void setjRadioButton(JRadioButton jRadioButton) {
        this.jRadioButton = jRadioButton;
    }

    public JComboBox getjComboBox() {
        return jComboBox;
    }

    public void setjComboBox(JComboBox jComboBox) {
        this.jComboBox = jComboBox;
    }

    public String[] getTextoJComboBox() {
        return textoJComboBox;
    }

    public void setTextoJComboBox(String[] textoJComboBox) {
        this.textoJComboBox = textoJComboBox;
    }

    public JPanel getjPanel1() {
        return jPanel1;
    }

    public void setjPanel1(JPanel jPanel1) {
        this.jPanel1 = jPanel1;
    }

    public JPanel getjPanel2() {
        return jPanel2;
    }

    public void setjPanel2(JPanel jPanel2) {
        this.jPanel2 = jPanel2;
    }

    public JTextArea getjTextArea() {
        return jTextArea;
    }

    public void setjTextArea(JTextArea jTextArea) {
        this.jTextArea = jTextArea;
    }
}
