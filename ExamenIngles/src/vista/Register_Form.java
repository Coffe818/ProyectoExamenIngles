
package Vista;

import java.awt.Color;

import javax.swing.ImageIcon;

import Controller.Register_Controller;
import assets.Enum.ImagenRuta;

public class Register_Form extends javax.swing.JFrame {


    public Register_Form() {
        initComponents();
    }


    @SuppressWarnings("unchecked")
    private void initComponents() {

        bg = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        emailTxt = new javax.swing.JTextField();
        jSeparator1 = new javax.swing.JSeparator();
        jLabel7 = new javax.swing.JLabel();
        jSeparator2 = new javax.swing.JSeparator();
        jLabel8 = new javax.swing.JLabel();
        passwordTxt = new javax.swing.JPasswordField();
        jSeparator3 = new javax.swing.JSeparator();
        nombreTxt = new javax.swing.JTextField();
        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        bg.setBackground(new java.awt.Color(255, 255, 255));
        bg.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel3.setFont(new java.awt.Font("Roboto SemiBold", 2, 18)); // NOI18N
        jLabel3.setIcon(new ImageIcon(ImagenRuta.RESIZED.getRuta())); // NOI18N
        jLabel3.setText("  Facultad de Sistemas");
        bg.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 20, 260, 80));

        jLabel4.setFont(new java.awt.Font("Roboto", 1, 36)); // NOI18N
        jLabel4.setText("Registro");
        bg.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(60, 110, 200, -1));

        jLabel6.setFont(new java.awt.Font("Roboto Light", 1, 18)); // NOI18N
        jLabel6.setText("Nombre");
        bg.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 190, -1, -1));

        emailTxt.setFont(new java.awt.Font("Roboto Thin", 3, 12)); // NOI18N
        emailTxt.setForeground(new java.awt.Color(204, 204, 204));
        emailTxt.setText("Ingrese su correo electrónico");
        emailTxt.setBorder(null);
        emailTxt.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                emailTxtMousePressed(evt);
            }
        });
        bg.add(emailTxt, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 310, 370, 20));

        jSeparator1.setForeground(new java.awt.Color(102, 102, 102));
        bg.add(jSeparator1, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 240, 370, 10));

        jLabel7.setFont(new java.awt.Font("Roboto Light", 1, 18)); // NOI18N
        jLabel7.setText("Correo");
        bg.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 280, -1, -1));

        jSeparator2.setForeground(new java.awt.Color(102, 102, 102));
        bg.add(jSeparator2, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 330, 370, 10));

        jLabel8.setFont(new java.awt.Font("Roboto Light", 1, 18)); // NOI18N
        jLabel8.setText("Contraseña");
        bg.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 380, -1, -1));

        passwordTxt.setForeground(new java.awt.Color(204, 204, 204));
        passwordTxt.setText("********");
        passwordTxt.setBorder(null);
        passwordTxt.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                passwordTxtMousePressed(evt);
            }
        });
        bg.add(passwordTxt, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 410, 370, -1));

        jSeparator3.setForeground(new java.awt.Color(102, 102, 102));
        bg.add(jSeparator3, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 430, 370, 10));

        nombreTxt.setFont(new java.awt.Font("Roboto Thin", 3, 12)); // NOI18N
        nombreTxt.setForeground(new java.awt.Color(204, 204, 204));
        nombreTxt.setText("Ingrese su nombre de usuario");
        nombreTxt.setBorder(null);
        nombreTxt.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                nombreTxtMousePressed(evt);
            }
        });
        bg.add(nombreTxt, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 220, 370, 20));

        jPanel1.setBackground(new java.awt.Color(65, 71, 68));

        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setIcon(new ImageIcon(ImagenRuta.LOGO_UADEC.getRuta())); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 290, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(58, 58, 58)
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 260, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(182, Short.MAX_VALUE))
        );

        bg.add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(510, 0, 290, 500));

        jButton1.setBackground(new java.awt.Color(188, 4, 51));
        jButton1.setFont(new java.awt.Font("Roboto Condensed", 1, 12)); // NOI18N
        jButton1.setForeground(new java.awt.Color(255, 255, 255));
        jButton1.setText("Registrarse");
        jButton1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton1MouseClicked(evt);
            }
        });
        bg.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 452, -1, 30));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bg, javax.swing.GroupLayout.PREFERRED_SIZE, 800, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bg, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }

    private void emailTxtMousePressed(java.awt.event.MouseEvent evt) {
        if(emailTxt.getText().equals("Ingrese su correo electrónico")) {
            emailTxt.setText("");
            emailTxt.setForeground(Color.black);
        }
        if(String.valueOf(passwordTxt.getPassword()).isEmpty()) {
            passwordTxt.setText("********");
            passwordTxt.setForeground(Color.gray);
        }
        if(nombreTxt.getText().isEmpty()) {
            nombreTxt.setText("Ingrese su nombre de usuario");
            nombreTxt.setForeground(Color.gray);
        }
        
    }

    private void passwordTxtMousePressed(java.awt.event.MouseEvent evt) {
        if(String.valueOf(passwordTxt.getPassword()).equals("********")) {
            passwordTxt.setText("");
            passwordTxt.setForeground(Color.black);
        }
        if(emailTxt.getText().isEmpty()) {
            emailTxt.setText("Ingrese su correo electrónico");
            emailTxt.setForeground(Color.gray);
        }
        if(nombreTxt.getText().isEmpty()) {
            nombreTxt.setText("Ingrese su nombre de usuario");
            nombreTxt.setForeground(Color.gray);
        }
    }

    private void nombreTxtMousePressed(java.awt.event.MouseEvent evt) {
        if(nombreTxt.getText().equals("Ingrese su nombre de usuario")) {
            nombreTxt.setText("");
            nombreTxt.setForeground(Color.black);
        }
        if(String.valueOf(passwordTxt.getPassword()).isEmpty()) {
            passwordTxt.setText("********");
            passwordTxt.setForeground(Color.gray);
        }
        if(emailTxt.getText().isEmpty()) {
            emailTxt.setText("Ingrese su correo electrónico");
            emailTxt.setForeground(Color.gray);
        }
    }

    private void jButton1MouseClicked(java.awt.event.MouseEvent evt) {
        // javax.swing.JOptionPane.showMessageDialog(this, "Logica de insercion de usuario con variables:\nNombre: " + nombreTxt.getText() + "\nCorreo: " + emailTxt.getText() + "\nPassword: " + new String(passwordTxt.getPassword()));

        Register_Controller controller = new Register_Controller();
        controller.insertUser(emailTxt.getText(), new String(passwordTxt.getPassword()), nombreTxt.getText());

        new Login_Form().setVisible(true);
        this.dispose();
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel bg;
    private javax.swing.JTextField emailTxt;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator2;
    private javax.swing.JSeparator jSeparator3;
    private javax.swing.JTextField nombreTxt;
    private javax.swing.JPasswordField passwordTxt;
    // End of variables declaration//GEN-END:variables
}
