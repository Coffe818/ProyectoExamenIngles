package Vista;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import Controller.Examen_Controller;
import util.UltimaPreguntasModel;
import util.UltimaRespuesta;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class PanelExamen extends JPanel {
    private List<UltimaPreguntasModel> preguntas;
    private int index = 0;

    private JLabel lblPregunta;
    private JButton btnAnterior, btnSiguiente, btnRegresar;

    MainApp mainApp;

    public PanelExamen(int id_usuario, int tipoExamen, MainApp mainApp) {
        Examen_Controller controller = new Examen_Controller();
        this.preguntas = controller.getUltimoExamen(id_usuario, tipoExamen);

        
        Collections.sort(preguntas, Comparator.comparingInt(UltimaPreguntasModel::getId_pregunta));

        setPreferredSize(new java.awt.Dimension(800, 550));
        this.mainApp = mainApp;
        this.setLayout(new BorderLayout());

        // Label para la pregunta
        lblPregunta = new JLabel();
        lblPregunta.setFont(new Font("Arial", Font.BOLD, 18));
        lblPregunta.setHorizontalAlignment(SwingConstants.CENTER);
        lblPregunta.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        

        // Panel central para organizar la pregunta y respuestas
        JPanel panelCentro = new JPanel();
        panelCentro.setLayout(new GridLayout(5, 1, 5, 5)); // Espaciado entre filas
        panelCentro.setBorder(BorderFactory.createEmptyBorder(20, 50, 20, 50)); // Espacio alrededor
        panelCentro.add(lblPregunta);

        // Configuración de opciones como JLabel
        for (int i = 0; i < 4; i++) {
            JLabel opcionLabel = new JLabel();
            opcionLabel.setFont(new Font("Arial", Font.PLAIN, 18));
            opcionLabel.setOpaque(true); // Necesario para aplicar el fondo
            opcionLabel.setHorizontalAlignment(SwingConstants.LEFT); // Justificar a la izquierda
            panelCentro.add(opcionLabel);
        }

        // Botones
        btnAnterior = new JButton("Anterior");
        btnSiguiente = new JButton("Siguiente");
        btnRegresar = new JButton("Regresar al menú");

        // Estilizando los botones
        btnAnterior.setFont(new Font("Arial", Font.BOLD, 14));
        btnSiguiente.setFont(new Font("Arial", Font.BOLD, 14));
        btnRegresar.setFont(new Font("Arial", Font.BOLD, 14));

        JPanel panelInferior = new JPanel(new FlowLayout(FlowLayout.CENTER, 20, 10));
        panelInferior.add(btnAnterior);
        panelInferior.add(btnSiguiente);
        panelInferior.add(btnRegresar);

        // Agregar los paneles
        this.add(panelCentro, BorderLayout.CENTER);
        this.add(panelInferior, BorderLayout.SOUTH);

        mostrarPregunta(0); // Mostramos la primera pregunta

        // Listener para la navegación
        ActionListener navegacion = e -> {
            if (e.getSource() == btnAnterior) {
                mostrarPregunta(index - 1);
            } else if (e.getSource() == btnSiguiente) {
                mostrarPregunta(index + 1);
            }
            if (e.getSource() == btnRegresar) {
                mainApp.addPanel(new Desicion_From(mainApp), "Desicion");
                mainApp.showPanel("Desicion");
            }
        };

        if (preguntas == null || preguntas.isEmpty()) {
            if (tipoExamen == 1) {
                lblPregunta.setText("No ha presentado ningún examen de prueba.");
            } else if (tipoExamen == 2) {
                lblPregunta.setText("No ha presentado ningún examen final.");
            }
            btnAnterior.setEnabled(false);
            btnSiguiente.setEnabled(false);

        }

        btnAnterior.addActionListener(navegacion);
        btnSiguiente.addActionListener(navegacion);
        btnRegresar.addActionListener(navegacion);
    }

    private void mostrarPregunta(int nuevaIndex) {
        if (preguntas == null || preguntas.isEmpty()) {
            return;
        }
        if (nuevaIndex < 0 || nuevaIndex >= preguntas.size())
            return;

        index = nuevaIndex;

        UltimaPreguntasModel pregunta = preguntas.get(index);
        String textoConBr = pregunta.getTexto().replace("\n", "<br>");
        String textopregunta = (index + 1) + ".- " + textoConBr;
        String textoHtml = "<html>" + textopregunta + "</html>";

        // Actualizamos el JLabel de la pregunta
        lblPregunta.setText(textoHtml);

        List<UltimaRespuesta> respuestas = pregunta.getRespuestas();

        JPanel panelCentro = (JPanel) this.getComponent(0);
        panelCentro.removeAll();
        panelCentro.add(lblPregunta);
        for (int i = 0; i < respuestas.size(); i++) {
            UltimaRespuesta respuesta = respuestas.get(i);
            JLabel opcionLabel = new JLabel();
            opcionLabel.setText(respuesta.getTexto());
            opcionLabel.setFont(new Font("Arial", Font.PLAIN, 18));
            opcionLabel.setOpaque(true);
            opcionLabel.setHorizontalAlignment(SwingConstants.LEFT);

            if (respuesta.isNo_respondio()) {
                opcionLabel.setForeground(Color.GRAY);
            } else {
                if (respuesta.isCorrecta()) {
                    opcionLabel.setForeground(Color.GREEN);
                } else if (respuesta.isSeleccionada_usuario()) {
                    opcionLabel.setForeground(Color.RED);
                }
            }

            panelCentro.add(opcionLabel);
        }

        panelCentro.revalidate();
        panelCentro.repaint();
    }
}
