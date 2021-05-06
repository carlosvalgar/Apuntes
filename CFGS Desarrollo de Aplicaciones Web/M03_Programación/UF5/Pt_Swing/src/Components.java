import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Components extends JFrame {
    private JTabbedPane panel1;
    private ComponentsText ct;
    private ComponentsJList cjl;
    private ComponentsEscull ce;
    private JPanel jpanel1, jpanel2, jpanel3;



    public Components () {
        ct = new ComponentsText();
        cjl = new ComponentsJList();
        ce = new ComponentsEscull();

        panel1 = new JTabbedPane();
        jpanel1 = new JPanel();
        jpanel2 = new JPanel();
        jpanel3 = new JPanel();

        jpanel1.setLayout(new FlowLayout(FlowLayout.LEFT));
        jpanel1.add(ct);
        jpanel2.add(cjl);
        jpanel3.add(ce);
        ce.getjComboBox().addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                if (ce.getjRadioButton().isSelected() == false) {
                    if (ce.getjComboBox().getSelectedItem().equals("Azul")) {
                        ce.getjTextArea().setBackground(Color.BLUE);
                    } else if (ce.getjComboBox().getSelectedItem().equals("Rojo")) {
                        ce.getjTextArea().setBackground(Color.RED);
                    } else if (ce.getjComboBox().getSelectedItem().equals("Amarillo")) {
                        ce.getjTextArea().setBackground(Color.YELLOW);
                    }
                }

                else if (ce.getjRadioButton().isSelected() == true) {
                        if (ce.getjComboBox().getSelectedItem().equals("Azul")) {
                            ce.getjTextArea().setBackground(Color.ORANGE);
                        } else if (ce.getjComboBox().getSelectedItem().equals("Rojo")) {
                            ce.getjTextArea().setBackground(Color.GREEN);
                        } else if (ce.getjComboBox().getSelectedItem().equals("Amarillo")) {
                            ce.getjTextArea().setBackground(Color.magenta);
                        }
                    }
            }
        });

        ce.getjRadioButton().addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (ce.getjRadioButton().isSelected() == false) {
                    if (ce.getjComboBox().getSelectedItem().equals("Azul")) {
                        ce.getjTextArea().setBackground(Color.BLUE);
                    } else if (ce.getjComboBox().getSelectedItem().equals("Rojo")) {
                        ce.getjTextArea().setBackground(Color.RED);
                    } else if (ce.getjComboBox().getSelectedItem().equals("Amarillo")) {
                        ce.getjTextArea().setBackground(Color.YELLOW);
                    }
                }

                else if (ce.getjRadioButton().isSelected() == true) {
                    if (ce.getjComboBox().getSelectedItem().equals("Azul")) {
                        ce.getjTextArea().setBackground(Color.ORANGE);
                    } else if (ce.getjComboBox().getSelectedItem().equals("Rojo")) {
                        ce.getjTextArea().setBackground(Color.GREEN);
                    } else if (ce.getjComboBox().getSelectedItem().equals("Amarillo")) {
                        ce.getjTextArea().setBackground(Color.magenta);
                    }
                }
            }
        });

        panel1.addTab("Text", jpanel1);
        panel1.addTab("JList", jpanel2);
        panel1.addTab("Escull", jpanel3);

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
