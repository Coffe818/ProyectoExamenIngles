package Vista;

import java.awt.Font; // Import for Font
import java.util.Map;
import javax.swing.JOptionPane;
import Controller.Examen_Controller;
import util.IDManager;

public class Desicion_From extends javax.swing.JPanel {

    MainApp mainApp;

    public Desicion_From(MainApp mainApp) {
        Examen_Controller controller = new Examen_Controller();
        initComponents(); 
        setPreferredSize(new java.awt.Dimension(800, 550));
        this.mainApp = mainApp;

        Map<String, Object> permisos = controller.presentarExamen(IDManager.getInstance().getIdUsuario());
        LabelPruebasRestantes.setText("Pruebas restantes: " + (5 - (Integer) permisos.get("puedePresentarPrueba")));
        LabelFinalesRestantes.setText("Finales restantes: " + (2 - (Integer) permisos.get("puedePresentarFinal")));

    }

    @SuppressWarnings("unchecked")
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        RadioButtonOpcion1 = new javax.swing.JRadioButton();
        RadioButtonOpcion2 = new javax.swing.JRadioButton();
        RadioButtonOpcion3 = new javax.swing.JRadioButton();
        RadioButtonOpcion4 = new javax.swing.JRadioButton();
        RadioButtonOpcion5 = new javax.swing.JRadioButton();

        ButtonSeleccionar = new javax.swing.JButton();
        ButtonRegresar = new javax.swing.JButton();
        LabelNombre = new javax.swing.JLabel();
        LabelPruebasRestantes = new javax.swing.JLabel();
        LabelFinalesRestantes = new javax.swing.JLabel();

        // --- Font Change ---
        // Derive a new font with size 20 from an existing component's font
        Font newFont = RadioButtonOpcion1.getFont().deriveFont(20f);
        // Or specify a font: Font newFont = new Font("Arial", Font.PLAIN, 20);

        LabelNombre.setText("Bienvenido " + IDManager.getInstance().getNombre_usuario());

        buttonGroup1.add(RadioButtonOpcion1);
        RadioButtonOpcion1.setText("Examen Prueba");
        RadioButtonOpcion1.setFont(newFont); // Apply font

        buttonGroup1.add(RadioButtonOpcion2);
        RadioButtonOpcion2.setText("Examen Final");
        RadioButtonOpcion2.setFont(newFont); // Apply font

        buttonGroup1.add(RadioButtonOpcion3);
        RadioButtonOpcion3.setText("Dashbord");
        RadioButtonOpcion3.setFont(newFont); // Apply font

        buttonGroup1.add(RadioButtonOpcion4);
        RadioButtonOpcion4.setText("Ultimo examen prueba");
        RadioButtonOpcion4.setFont(newFont); // Apply font

        buttonGroup1.add(RadioButtonOpcion5);
        RadioButtonOpcion5.setText("Ultimo examen final");
        RadioButtonOpcion5.setFont(newFont); // Apply font

        ButtonSeleccionar.setText("Seleccionar");
        ButtonSeleccionar.setFont(newFont); // Apply font
        ButtonSeleccionar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ButtonSeleccionarActionPerformed(evt);
            }
        });

        ButtonRegresar.setText("Regresar");
        ButtonRegresar.setFont(newFont); // Apply font
        ButtonRegresar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                mainApp.showPanel("Login");
            }
        });

        LabelNombre.setFont(newFont); // Apply font

        LabelPruebasRestantes.setText("Pruebas restantes: --");
        LabelPruebasRestantes.setFont(newFont); // Apply font

        LabelFinalesRestantes.setText("Finales restantes: --");
        LabelFinalesRestantes.setFont(newFont); // Apply font

// ... (código anterior permanece igual hasta el layout)

// --- Layout Changes ---
javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
this.setLayout(layout);

layout.setHorizontalGroup(
    layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
    .addGroup(layout.createSequentialGroup()
        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.CENTER)
            .addComponent(LabelNombre)
            .addComponent(LabelPruebasRestantes)
            .addComponent(LabelFinalesRestantes)
            .addComponent(RadioButtonOpcion1)
            .addComponent(RadioButtonOpcion2)
            .addComponent(RadioButtonOpcion3)
            .addComponent(RadioButtonOpcion4)
            .addComponent(RadioButtonOpcion5)
            .addGroup(layout.createSequentialGroup()
                .addComponent(ButtonSeleccionar, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(10) // Espacio de 10 píxeles entre botones
                .addComponent(ButtonRegresar, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE))
        )
        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
);

layout.setVerticalGroup(
    layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
    .addGroup(layout.createSequentialGroup()
        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        .addComponent(LabelNombre)
        .addGap(30, 30, 30)
        .addComponent(LabelPruebasRestantes)
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
        .addComponent(LabelFinalesRestantes)
        .addGap(30, 30, 30)
        .addComponent(RadioButtonOpcion1)
        .addGap(18, 18, 18)
        .addComponent(RadioButtonOpcion2)
        .addGap(18, 18, 18)
        .addComponent(RadioButtonOpcion3)
        .addGap(18, 18, 18)
        .addComponent(RadioButtonOpcion4)
        .addGap(18, 18, 18)
        .addComponent(RadioButtonOpcion5)
        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 40, Short.MAX_VALUE)
        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
            .addComponent(ButtonSeleccionar, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addComponent(ButtonRegresar, javax.swing.GroupLayout.PREFERRED_SIZE, 45, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
);

    }

    private void ButtonSeleccionarActionPerformed(java.awt.event.ActionEvent evt) {
        int tipo = -1;
        Examen_Controller controller = new Examen_Controller();
        if (RadioButtonOpcion1.isSelected()) {
            tipo = 1; // Examen de prueba
        } else if (RadioButtonOpcion2.isSelected()) {
            tipo = 2; // Examen final
        } else if (RadioButtonOpcion3.isSelected()) {
            tipo = 3; // Dashboard
        }
        else if (RadioButtonOpcion4.isSelected()) {
            tipo = 4; // ultimo examen prueba
        } else if (RadioButtonOpcion5.isSelected()) {
            tipo = 5; // ultimo examen final
        }

        if (tipo == -1) {
            JOptionPane.showMessageDialog(this, "Seleccione una opción", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }

        if (tipo == 1 || tipo == 2) {
            Map<String, Object> permisos = controller.presentarExamen(IDManager.getInstance().getIdUsuario());

            if (tipo == 1 && !((Integer) permisos.get("puedePresentarPrueba") < 5)) {
                JOptionPane.showMessageDialog(this,
                        "Ya has alcanzado el limite de 5 examenes de prueba",
                        "limite alcanzado",
                        JOptionPane.WARNING_MESSAGE);
                return;
            }
            if (tipo == 2 && (boolean)permisos.get("yaAprobo")) {
                JOptionPane.showMessageDialog(this,
                        "Ya has aprobado el examen de final, no puedes volver a presentarlo",
                        "Examen aprobado",
                        JOptionPane.WARNING_MESSAGE);
                return;
            }
            if (tipo == 2 && !((Integer) permisos.get("puedePresentarFinal") < 2)) {

                JOptionPane.showMessageDialog(this,
                        "Ya has alcanzado el limite de 2 examenes finales",
                        "limite alcanzado",
                        JOptionPane.WARNING_MESSAGE);
                return;
            }

            mainApp.addPanel(new Examen_Form(mainApp, tipo), "Examen"); 
            mainApp.showPanel("Examen"); 
        } else if (tipo == 3) {
            mainApp.addPanel(new VentanaConGrafica(mainApp), "Dashboard");
            mainApp.showPanel("Dashboard");
        }else if (tipo == 4) {
            System.out.println("Ultimo examen prueba "+ IDManager.getInstance().getIdUsuario());
            mainApp.addPanel(new PanelExamen(IDManager.getInstance().getIdUsuario(), 1 ,mainApp), "UltimoExamenPrueba");
            mainApp.showPanel("UltimoExamenPrueba");
        } else if (tipo == 5) {
            System.out.println("Ultimo examen final "+ IDManager.getInstance().getIdUsuario());
            mainApp.addPanel(new PanelExamen(IDManager.getInstance().getIdUsuario(), 2, mainApp), "UltimoExamenFinal");
            mainApp.showPanel("UltimoExamenFinal");
        } 
        
        else {
            JOptionPane.showMessageDialog(this, "Opción no válida", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton ButtonSeleccionar;
    private javax.swing.JButton ButtonRegresar;
    private javax.swing.JLabel LabelNombre;
    private javax.swing.JRadioButton RadioButtonOpcion1;
    private javax.swing.JRadioButton RadioButtonOpcion2;
    private javax.swing.JRadioButton RadioButtonOpcion3;
    private javax.swing.JRadioButton RadioButtonOpcion4;
    private javax.swing.JRadioButton RadioButtonOpcion5;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JLabel LabelPruebasRestantes;
    private javax.swing.JLabel LabelFinalesRestantes;
    // End of variables declaration//GEN-END:variables
}