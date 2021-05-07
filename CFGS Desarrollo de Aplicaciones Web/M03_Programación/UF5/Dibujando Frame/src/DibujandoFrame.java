import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class DibujandoFrame {
    public static void main(String[] args) {
        new Ventana();
    }
}
class Ventana extends JFrame {
    JButton limpiar = new JButton("Limpiar");
    public Ventana(){
        initJFrame();

    }

    public void initJFrame(){

        setSize(500, 500);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.addMouseMotionListener(new MouseMotionAdapter() {
            @Override
            public void mouseDragged(MouseEvent e) {
                int x = e.getX(), y = e.getY();
                Graphics g = getGraphics();
                g.setColor(Color.BLACK);
                g.drawArc(x, y, 100,100,100,100);
            }
        });

        limpiar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                //int seleccion = JOptionPane.showOptionDialog(rootPane, "Desea borrar el dibujo", "ELIMINAR", JOptionPane.OK_CANCEL_OPTION,
                  //      JOptionPane.QUESTION_MESSAGE, /*nuestraimagen*/ null, /*Texto para que aparezca en los botones*//*null*/ new Object[]{"SI", "NO"},
                    //    /*foco por defecto*//*null*/"NO");
                //if (seleccion == 0) {
                  //  repaint();
                //}

                String texto = JOptionPane.showInputDialog(rootPane, "ESCRIBENOMBRE", "DATOS", JOptionPane.INFORMATION_MESSAGE);

                // falta una opcion de desplegables mirar teoria
                System.out.println(texto);
            }
        });

        add(limpiar, BorderLayout.SOUTH);

        setLocationRelativeTo(null);
        setVisible(true);
    }
    /*
    public void paint(Graphics g) {
        super.paint(g);
        Graphics2D g2D = (Graphics2D) g;
        g2D.setColor(Color.BLACK);
        Toolkit pantalla = Toolkit.getDefaultToolkit();
        Image imagen = pantalla.getImage("src/pinguino.jpg");
        g2D.drawImage(imagen, 100, 100, this);
        g2D.setStroke(new BasicStroke(30));
        g2D.drawLine(100,100,200,100);
        g2D.setColor(Color.RED);
        g2D.fillRoundRect(70,70,100,100,100,100);
        GradientPaint p = new GradientPaint(150,170, Color.BLUE, 150,190, Color.RED);
        g2D.setPaint(p);
        g2D.drawLine(300,300,200,100);
    }

     */
}