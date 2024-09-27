<%@ page import="java.sql.*, javax.mail.*, javax.mail.internet.*, java.util.Properties" %>

<html lang="pt-br">
    <head>
        <!--<title>title</title>-->
    </head>
    <body>

<%
    // Configurações de conexão com o banco de dados
    String url = "jdbc:postgresql://localhost:5432/bibliotech";
    String user = "postgres";
    String password = "admin";

    String email = request.getParameter("email");
    String senha = null;

    try {
        // Conectar ao banco de dados
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // Consulta para verificar se o e-mail existe
        String query = "SELECT senha_hash FROM USUARIOS WHERE email = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            senha = rs.getString("senha_hash");  // Pega a senha
        } else {
            out.println("<script>alert('E-mail n�o encontrado!'); window.location.href = 'recuperacao.jsp';</script>");
        }

        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Se a senha foi encontrada, enviar um e-mail para o usuário
    if (senha != null) {
        // Configurações do JavaMail
        String host = "smtp.gmail.com";  // Usando o Gmail como exemplo
        String from = "bibliotechprojeto@gmail.com"; // Seu e-mail
        String pass = "iodz fnwh idsg wmpo";  // Use uma senha de aplicativo do Gmail
        String to = email;
        String subject = "Recuperação de Senha - Bibliotech";

        // Conteúdo do e-mail com HTML
        String messageText = 
        "<div style='font-family: Arial, sans-serif; padding: 20px; background-color: #f4f4f4;'>"
            + "<center>"
                + "<img src='https://iili.io/dPzedMX.png' alt='Recuperação de Conta' style='width: 100%; max-width: 600px; height: auto;'>"
                + "<div style='background-color: #ffffff; padding: 20px; border-radius: 8px; max-width: 600px; text-align: left;'>"
                    + "<h2 style='color: #333;'>Recuperação de Conta</h2>"
                    + "<p style='color: #555;'>Ola!,</p>"
                    + "<p style='color: #555;'>Recebemos uma solicitação para recupera��o de senha da sua conta. Aqui est�o seus detalhes de login:</p>"
                    + "<p style='font-weight: bold; color: #333;'>Email: " + email + "</p>"
                    + "<p style='font-weight: bold; color: #333;'>Senha: " + senha + "</p>"
                    + "<p style='color: #555;'>Se vocÊ não fez essa solicitação, por favor ignore este e-mail.</p>"
                    + "<p style='color: #555;'>Atenciosamente, https://prod.liveshare.vsengsaas.visualstudio.com/join?01A2BDE3A14A18BC1D1E0892E16E13D31189</p>"
                    + "<p style='color: #333; font-weight: bold;'>Equipe de Suporte - Bibliotech</p>"
                + "</div>"
            + "</center>"
        + "</div>";

        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.debug", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.auth", "true");

        Session mailSession = Session.getDefaultInstance(props, null);
        MimeMessage message = new MimeMessage(mailSession);

        try {
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject(subject);
            message.setContent(messageText, "text/html");

            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

            response.sendRedirect("send_succes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>


    </body>
</html>