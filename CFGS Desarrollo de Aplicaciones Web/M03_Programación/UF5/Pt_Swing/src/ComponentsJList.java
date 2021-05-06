import javax.swing.*;
import java.awt.*;

public class ComponentsJList extends JPanel{
    private String[] arrayJList = {"Sistemas Operativos", "Base de datos", "Programacion", "Lenguaje de Marcas", "Entornos de desarrollo"};
    private JList jlist;
    private JScrollPane jsp;
    private JLabel jlabel;
    private JPanel jPanelEspacio;

    public ComponentsJList() {
        iniciarComponentes();
        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
        add(jsp);
        add(jPanelEspacio);
        add(jlabel);
    }

    public void iniciarComponentes() {
        jlist = new JList(arrayJList);
        jlist.setVisibleRowCount(3);
        jsp = new JScrollPane(jlist);
        jlabel = new JLabel();
        jPanelEspacio = new JPanel();
    }

    public String[] getArrayJList() {
        return arrayJList;
    }

    public void setArrayJList(String[] arrayJList) {
        this.arrayJList = arrayJList;
    }

    public JList getJlist() {
        return jlist;
    }

    public void setJlist(JList jlist) {
        this.jlist = jlist;
    }

    public JScrollPane getJsp() {
        return jsp;
    }

    public void setJsp(JScrollPane jsp) {
        this.jsp = jsp;
    }

    public JLabel getJlabel() {
        return jlabel;
    }

    public void setJlabel(JLabel jlabel) {
        this.jlabel = jlabel;
    }

    public JPanel getjPanelEspacio() {
        return jPanelEspacio;
    }

    public void setjPanelEspacio(JPanel jPanelEspacio) {
        this.jPanelEspacio = jPanelEspacio;
    }
}
