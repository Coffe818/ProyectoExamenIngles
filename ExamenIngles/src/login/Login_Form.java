package login;

import javax.swing.*;
import org.netbeans.lib.awtextra.AbsoluteConstraints;
import org.netbeans.lib.awtextra.AbsoluteLayout;

public class Login_Form extends JFrame {

    private JPanel jPanel1, jPanel2, jPanel3;
    private JTextField jTextField1;
    private JPasswordField jPasswordField1;
    private JSeparator jSeparator1, jSeparator2;
    private JLabel jLabel1, jLabel3, jLabel4, jLabel5;

    public Login_Form() {
        initComponents();
    }

    private void initComponents() {
        jPanel1 = new JPanel();
        jPanel2 = new JPanel();
        jPanel3 = new JPanel();
        jTextField1 = new JTextField();
        jPasswordField1 = new JPasswordField();
        jSeparator1 = new JSeparator();
        jSeparator2 = new JSeparator();
        jLabel1 = new JLabel();
        jLabel3 = new JLabel();
        jLabel4 = new JLabel("Register");
        jLabel5 = new JLabel("Log In");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setSize(650, 350);
        setLocationRelativeTo(null);
        setTitle("Login Form");

        // Panel 1 (Main Container)
        jPanel1.setLayout(new AbsoluteLayout());

        // Panel 2 (Left side panel)
        jPanel2.setBackground(new java.awt.Color(21, 134, 120));
        jPanel1.add(jPanel2, new AbsoluteConstraints(0, 0, 325, 324));

        // Panel 3 (Right side panel with login fields)
        jPanel3.setBackground(new java.awt.Color(68, 207, 191));
        jPanel3.setLayout(new AbsoluteLayout());

        // Username Field
        jTextField1.setBackground(new java.awt.Color(68, 207, 191));
        jTextField1.setFont(new java.awt.Font("Segoe UI", 1, 12));
        jTextField1.setText("User");
        jTextField1.setBorder(null);
        jPanel3.add(jTextField1, new AbsoluteConstraints(80, 90, 180, 25));

        // Password Field
        jPasswordField1.setBackground(new java.awt.Color(68, 207, 191));
        jPasswordField1.setFont(new java.awt.Font("Segoe UI", 1, 12));
        jPasswordField1.setText("Password");
        jPasswordField1.setBorder(null);
        jPanel3.add(jPasswordField1, new AbsoluteConstraints(80, 140, 180, 20));

        // Separators (Underlines)
        jSeparator1.setBackground(new java.awt.Color(0, 0, 0));
        jSeparator1.setForeground(new java.awt.Color(0, 0, 0));
        jPanel3.add(jSeparator1, new AbsoluteConstraints(80, 116, 180, 10));

        jSeparator2.setBackground(new java.awt.Color(0, 0, 0));
        jSeparator2.setForeground(new java.awt.Color(0, 0, 0));
        jPanel3.add(jSeparator2, new AbsoluteConstraints(80, 163, 180, 10));

        // Register Label (Clickable)
        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 12));
        jLabel4.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel4.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel4MouseClicked(evt);
            }
        });
        jPanel3.add(jLabel4, new AbsoluteConstraints(210, 240, -1, -1));

        // Login Label (Clickable)
        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 12));
        jLabel5.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel5.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel5MouseClicked(evt);
            }
        });
        jPanel3.add(jLabel5, new AbsoluteConstraints(90, 240, -1, -1));

        // Add Panel 3 to Main Panel
        jPanel1.add(jPanel3, new AbsoluteConstraints(325, 0, 325, 324));

        // Set Content Pane
        setContentPane(jPanel1);
    }

    private void jLabel4MouseClicked(java.awt.event.MouseEvent evt) {
        System.out.println("Register was clicked");
    }

    private void jLabel5MouseClicked(java.awt.event.MouseEvent evt) {
        System.out.println("Log In was clicked");
    }

    public static void main(String args[]) {
        SwingUtilities.invokeLater(() -> {
            new Login_Form().setVisible(true);
        });
    }
}
