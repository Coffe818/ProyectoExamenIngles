package Vista;
import javax.swing.*;

import Controller.Examen_Controller;
import util.IDManager;

import java.awt.*;
import java.util.Map;


class GraficaPorcentaje extends JPanel {
    private float porcentaje = 0;

    public void setPorcentaje(float porcentaje) {
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
    private GraficaPorcentaje graficaTipo1;
    private GraficaPorcentaje graficaTipo2;

    private JLabel tituloLabel;
    private JLabel info2Label;
    private JLabel info3Label;
    private JLabel info4Label;

    public VentanaConGrafica() {
        setSize(800, 500);

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

         // Panel superior con nivel y usuario
         JPanel panelSuperior = new JPanel(new GridLayout(1, 2, 20, 0));
         panelSuperior.setBorder(BorderFactory.createEmptyBorder(0, 20, 0, 20));
         
         info3Label = new JLabel("Usuario: ---", SwingConstants.CENTER);
         
         info3Label.setFont(new Font("Arial", Font.PLAIN, 14));
         
         panelSuperior.add(info3Label);
         add(panelSuperior, BorderLayout.PAGE_START);

        JPanel panelGraficas = new JPanel();
        panelGraficas.setLayout(new GridLayout(1, 2, 20, 0));
        panelGraficas.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        graficaTipo1 = new GraficaPorcentaje();
        graficaTipo2 = new GraficaPorcentaje();
        graficaTipo1.setBackground(Color.WHITE);
        graficaTipo2.setBackground(Color.WHITE);
        panelGraficas.add(graficaTipo1);
        panelGraficas.add(graficaTipo2);
        add(panelGraficas, BorderLayout.CENTER);

        // Panel derecho con cantidad de exámenes
        JPanel panelInferior = new JPanel(new GridLayout(1, 2, 20, 0));
        panelInferior.setBorder(BorderFactory.createEmptyBorder(0, 20, 20, 20));
         info2Label = new JLabel("Examen Practica: ---", SwingConstants.CENTER);
         info4Label = new JLabel("Examen Final: ---", SwingConstants.CENTER);
         info2Label.setFont(new Font("Arial", Font.PLAIN, 14));
         info4Label.setFont(new Font("Arial", Font.PLAIN, 14));
         panelInferior.add(info2Label);
         panelInferior.add(info4Label);
         add(panelInferior, BorderLayout.PAGE_END);


        cargarDatosDashboard(IDManager.getInstance().getIdUsuario());
        
    }
    
    private void regresarADesicionForm() {
        Desicion_From desicion = new Desicion_From();
        desicion.setVisible(true);
        this.dispose();
    }

    private void cargarDatosDashboard(int idUsuario) {
        Examen_Controller controller = new Examen_Controller();
        Map<String, Object> resultados = controller.datosDashBoard(idUsuario);

        graficaTipo1.setPorcentaje((float)resultados.get("promedioTipo1"));
        graficaTipo2.setPorcentaje((float)resultados.get("promedioTipo2"));
        info2Label.setText("Cantidad Examen Prueba: " + resultados.get("cantidadExamenesTipo1"));
        info4Label.setText("Cantidad Examen Final: " + resultados.get("cantidadExamenesTipo2"));
        info3Label.setText("Usuario: " + IDManager.getInstance().getNombre_usuario());
    }

    public static void main(String[] args) {
        VentanaConGrafica ventana = new VentanaConGrafica();
        ventana.setVisible(true);
    }




}
