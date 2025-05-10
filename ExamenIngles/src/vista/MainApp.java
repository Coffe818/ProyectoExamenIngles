package Vista;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainApp extends JFrame {

    private CardLayout cardLayout;
    private JPanel mainPanel;

    public MainApp() {
        setTitle("Aplicación con Cambio de Paneles");
        setSize(800, 550);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Crear el CardLayout
        cardLayout = new CardLayout();
        mainPanel = new JPanel(cardLayout);

        // ExamenPanel examenPanel = new ExamenPanel(this, 1);
        Login_Form loginForm = new Login_Form(this);
        Register_Form registerForm = new Register_Form(this);

        mainPanel.add(loginForm, "Login");
        mainPanel.add(registerForm, "Registrar");

        add(mainPanel);
    }

    public void showPanel(String panelName) {
        cardLayout.show(mainPanel, panelName);
    }

    public void addPanel(JPanel panel, String name) {
        mainPanel.add(panel, name);
    }

    // Clase interna para el panel del examen
    

    // Panel de Login
    class LoginPanel extends JPanel {
        public LoginPanel() {
            setLayout(new BorderLayout());
            JLabel label = new JLabel("Login", SwingConstants.CENTER);
            add(label, BorderLayout.NORTH);

            JButton btnRegistrar = new JButton("Registrar");
            btnRegistrar.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {

                    cardLayout.show(mainPanel, "Registrar");
                }
            });

            add(btnRegistrar, BorderLayout.SOUTH);
        }
    }

    // Panel de Registrar
    class RegistrarPanel extends JPanel {
        public RegistrarPanel() {
            setLayout(new BorderLayout());
            JLabel label = new JLabel("Registrar", SwingConstants.CENTER);
            add(label, BorderLayout.NORTH);

            JButton btnVolver = new JButton("Volver");
            btnVolver.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    // Cambiar al panel de login
                    cardLayout.show(mainPanel, "Login");
                }
            });

            add(btnVolver, BorderLayout.SOUTH);
        }
    }

    // Método main para lanzar la aplicación
    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                MainApp app = new MainApp();
                app.setVisible(true);
            }
        });
    }
}
