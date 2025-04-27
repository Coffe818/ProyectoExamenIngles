package Vista;
import javax.swing.*;

import Controller.Examen_Controller;
import util.IDManager;

import java.awt.*;
import java.util.Map;


class GraficaPorcentaje extends JPanel {
    private int porcentaje = 0;

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
        repaint();
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        Graphics2D g2 = (Graphics2D) g;
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        int size = Math.min(getWidth(), getHeight()) - 40;
        int x = (getWidth() - size) / 2;
        int y = (getHeight() - size) / 2;

        // Fondo
        g2.setColor(Color.LIGHT_GRAY);
        g2.fillOval(x, y, size, size);

        // Arco del porcentaje
        g2.setColor(Color.BLUE);
        int angle = (int) (360 * porcentaje / 100.0);
        g2.fillArc(x, y, size, size, 90, -angle);

        // Círculo blanco central para "bisel"
        int innerMargin = 20;
        g2.setColor(getBackground());
        g2.fillOval(x + innerMargin, y + innerMargin, size - 2 * innerMargin, size - 2 * innerMargin);

        // Texto del porcentaje
        g2.setColor(Color.BLACK);
        g2.setFont(new Font("Arial", Font.BOLD, 24));
        String texto = porcentaje + "%";
        FontMetrics fm = g2.getFontMetrics();
        int textWidth = fm.stringWidth(texto);
        int textHeight = fm.getAscent();
        g2.drawString(texto, getWidth() / 2 - textWidth / 2, getHeight() / 2 + textHeight / 4);
    }

    
}




public class VentanaConGrafica extends JFrame {
    private GraficaPorcentaje grafica;
    private JLabel tituloLabel;
    private JLabel info1Label;
    private JLabel info2Label;
    private JLabel info3Label;

    public VentanaConGrafica() {
        setSize(400, 350);
        setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
        setLocationRelativeTo(null); 
        setLayout(new BorderLayout());

        addWindowListener(new java.awt.event.WindowAdapter() {
            @Override
            public void windowClosing(java.awt.event.WindowEvent windowEvent) {
                regresarADesicionForm();
            }
        });


        // Label superior
        tituloLabel = new JLabel("Promedio de aciertos", SwingConstants.CENTER);
        tituloLabel.setFont(new Font("Arial", Font.BOLD, 18));
        tituloLabel.setBorder(BorderFactory.createEmptyBorder(10, 0, 10, 0));
        add(tituloLabel, BorderLayout.NORTH);

        // Panel central con la gráfica
        grafica = new GraficaPorcentaje();
        grafica.setBackground(Color.WHITE);
        add(grafica, BorderLayout.CENTER);

        // Panel derecho con múltiples labels
        JPanel panelDerecho = new JPanel();
        panelDerecho.setLayout(new BoxLayout(panelDerecho, BoxLayout.Y_AXIS));
        panelDerecho.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        info1Label = new JLabel("Nivel: ---");
        info2Label = new JLabel("cantidad Examenens: ---");
        info3Label = new JLabel("Usuario: ---");

        info1Label.setFont(new Font("Arial", Font.PLAIN, 14));
        info2Label.setFont(new Font("Arial", Font.PLAIN, 14));
        info3Label.setFont(new Font("Arial", Font.PLAIN, 14));

        // Añadir labels al panel
        panelDerecho.add(info1Label);
        panelDerecho.add(Box.createVerticalStrut(10)); // Espaciado
        panelDerecho.add(info2Label);
        panelDerecho.add(Box.createVerticalStrut(10));
        panelDerecho.add(info3Label);

        add(panelDerecho, BorderLayout.EAST);

        cargarDatosDashboard(IDManager.getInstance().getIdUsuario());
        
    }
    private void regresarADesicionForm() {
        Desicion_From desicion = new Desicion_From();
        desicion.setVisible(true);
        this.dispose();
    }

    private void cargarDatosDashboard(int idUsuario) {
        // Suponiendo que tienes una clase que contiene el método datosDashBoard
        Examen_Controller controller = new Examen_Controller();
        Map<String, Object> resultados = controller.datosDashBoard(idUsuario);

        System.err.println("Resultados: " + resultados);
        if (resultados.containsKey("promedio")) {
            double promedio = (double) resultados.get("promedio");
            int porcentaje = (int) Math.round(promedio);
            
            // Actualizar la gráfica
            grafica.setPorcentaje(porcentaje);
            
            // Actualizar los labels
            info1Label.setText("Nivel: " + resultados.get("nivel"));
            info2Label.setText("Cantidad Exámenes: " + resultados.get("cantidadExamenes"));
            info3Label.setText("Usuario: " + IDManager.getInstance().getNombre_usuario());
        } else {
            grafica.setPorcentaje(0);
        }
    }

    public static void main(String[] args) {
        VentanaConGrafica ventana = new VentanaConGrafica();
        ventana.setVisible(true);
    }




}
