package Vista;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Controller.Examen_Controller;
import util.IDManager;
import util.PreguntaModel;
import util.RespuestaModel;
import util.UltimaPreguntasModel;

import java.awt.*;
import javax.swing.*;

public class Examen_Form extends JPanel {

    private List<PreguntaModel> listapreguntas = null;
    private Map<Integer, List<RespuestaModel>> maparespuestas = null;
    private String nombre = null;
    private int preguntaActualIndex;
    private Map<Integer, Integer> respuestasUsuario = new HashMap<>();
    private Timer timer;
    private int segundos = 0;
    private int tipoExamen = 0;
    
    // Componentes de la interfaz
    private JLabel LabelNombre;
    private JLabel LabelPregunta;
    private JRadioButton RadioButtonRespuesta1;
    private JRadioButton RadioButtonRespuesta2;
    private JRadioButton RadioButtonRespuesta3;
    private JRadioButton RadioButtonRespuesta4;
    private JLabel LabelTiempo;
    private JButton ButtonSiguiente;
    private ButtonGroup buttonGroup1;

    MainApp mainApp;
    public Examen_Form(MainApp mainApp, int tipoExamen) {
        this.tipoExamen = tipoExamen;
        this.mainApp = mainApp;
        Examen_Controller controller = new Examen_Controller();

        Map<String, Object> datosExamen = controller.obtenerPreguntasYRespuestas(tipoExamen);

        this.listapreguntas = (List<PreguntaModel>) datosExamen.get("preguntas");
        this.maparespuestas = (Map<Integer, List<RespuestaModel>>) datosExamen.get("respuestas");

        Collections.sort(listapreguntas, Comparator.comparingInt(PreguntaModel::getId));

        System.out.println("Preguntas obtenidas: " + listapreguntas.size());

        this.nombre = IDManager.getInstance().getNombre_usuario();
        this.preguntaActualIndex = 0;
        
        initComponents();
        mostrarPreguntaActual();
        iniciarTemporizador();
    }

    private void iniciarTemporizador() {
        timer = new Timer(1000, e -> {
            segundos++;
    
            int minutos = segundos / 60;
            int segs = segundos % 60;
    
            LabelTiempo.setText(String.format("%02d:%02d", minutos, segs));
    
            if (segundos == 60) {
                System.out.println("se logró");
                SiguentePregunta();
            }
        });
    
        timer.start();
    }

    private void mostrarPreguntaActual() {
        PreguntaModel pregunta = this.listapreguntas.get(this.preguntaActualIndex);
        List<RespuestaModel> respuestas = maparespuestas.get(pregunta.getId());
        String textoConBr = pregunta.getTexto().replace("\n", "<br>");
        String textopregunta = Integer.toString(this.preguntaActualIndex + 1) + ".- " + textoConBr;
        String textoHtml = "<html>" + textopregunta + "</html>";
        LabelPregunta.setText(textoHtml);
        RadioButtonRespuesta1.setText(respuestas.get(0).getTexto());
        RadioButtonRespuesta2.setText(respuestas.get(1).getTexto());
        RadioButtonRespuesta3.setText(respuestas.get(2).getTexto());
        RadioButtonRespuesta4.setText(respuestas.get(3).getTexto());
    }

    private void finalizarExamen() {
        LabelPregunta.setText("Examen finalizado");
        System.out.println(this.respuestasUsuario);
        Examen_Controller controller = new Examen_Controller();
        float resultado = controller.guardarExamen(this.tipoExamen, this.respuestasUsuario, this.listapreguntas);
        
        
        mainApp.addPanel(new Desicion_From(mainApp), "Desicion");
        mainApp.showPanel("Desicion");
        
    }

    private void SiguentePregunta() {
        PreguntaModel pregunta = this.listapreguntas.get(this.preguntaActualIndex);
        List<RespuestaModel> respuestas = this.maparespuestas.get(pregunta.getId());
        
        int respuestaSeleccionadaId = 561;
        if (RadioButtonRespuesta1.isSelected()) {
            respuestaSeleccionadaId = respuestas.get(0).getId();
        } else if (RadioButtonRespuesta2.isSelected()) {
            respuestaSeleccionadaId = respuestas.get(1).getId();
        } else if (RadioButtonRespuesta3.isSelected()) {
            respuestaSeleccionadaId = respuestas.get(2).getId();
        } else if (RadioButtonRespuesta4.isSelected()) {
            respuestaSeleccionadaId = respuestas.get(3).getId();
        }

        respuestasUsuario.put(pregunta.getId(), respuestaSeleccionadaId);
        System.out.println("Respuesta seleccionada: " + respuestaSeleccionadaId);
        
        if (this.preguntaActualIndex + 1 < this.listapreguntas.size()) {
            this.preguntaActualIndex++;
            buttonGroup1.clearSelection();
            mostrarPreguntaActual();
            segundos = 0;
            LabelTiempo.setText("00:00");
        } else {
            finalizarExamen();
            timer.stop();
        }
    }

    private void initComponents() {
        buttonGroup1 = new ButtonGroup();
        
        LabelNombre = new JLabel();
        LabelPregunta = new JLabel();
        RadioButtonRespuesta1 = new JRadioButton();
        RadioButtonRespuesta2 = new JRadioButton();
        RadioButtonRespuesta3 = new JRadioButton();
        RadioButtonRespuesta4 = new JRadioButton();
        LabelTiempo = new JLabel();
        ButtonSiguiente = new JButton();

        // Configuración del layout para replicar el diseño original
        setLayout(null); // Usamos layout absoluto como en el JFrame original
        setPreferredSize(new Dimension(800, 500));

        LabelNombre.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        LabelNombre.setText(this.nombre);
        LabelNombre.setBounds(71, 24, 200, 20);

        LabelPregunta.setFont(new Font("Segoe UI", Font.BOLD, 18));
        LabelPregunta.setHorizontalAlignment(SwingConstants.LEFT);
        LabelPregunta.setText("Pregunta");
        LabelPregunta.setBounds(71, 71, 666, 95);

        buttonGroup1.add(RadioButtonRespuesta1);
        RadioButtonRespuesta1.setFont(new Font("Segoe UI", Font.PLAIN, 18));
        RadioButtonRespuesta1.setText("jRadioButton1");
        RadioButtonRespuesta1.setBounds(71, 193, 324, 30);

        buttonGroup1.add(RadioButtonRespuesta2);
        RadioButtonRespuesta2.setFont(new Font("Segoe UI", Font.PLAIN, 18));
        RadioButtonRespuesta2.setText("jRadioButton1");
        RadioButtonRespuesta2.setBounds(71, 241, 324, 30);

        buttonGroup1.add(RadioButtonRespuesta3);
        RadioButtonRespuesta3.setFont(new Font("Segoe UI", Font.PLAIN, 18));
        RadioButtonRespuesta3.setText("jRadioButton1");
        RadioButtonRespuesta3.setBounds(71, 289, 324, 30);

        buttonGroup1.add(RadioButtonRespuesta4);
        RadioButtonRespuesta4.setFont(new Font("Segoe UI", Font.PLAIN, 18));
        RadioButtonRespuesta4.setText("jRadioButton1");
        RadioButtonRespuesta4.setBounds(71, 337, 324, 30);

        LabelTiempo.setFont(new Font("Segoe UI", Font.BOLD, 36));
        LabelTiempo.setText("00:00");
        LabelTiempo.setBounds(71, 382, 111, 92);

        ButtonSiguiente.setText("Siguiente");
        ButtonSiguiente.addActionListener(e -> SiguentePregunta());
        ButtonSiguiente.setBounds(327, 401, 135, 47);

        // Añadir componentes al panel
        add(LabelNombre);
        add(LabelPregunta);
        add(RadioButtonRespuesta1);
        add(RadioButtonRespuesta2);
        add(RadioButtonRespuesta3);
        add(RadioButtonRespuesta4);
        add(LabelTiempo);
        add(ButtonSiguiente);
    }
}