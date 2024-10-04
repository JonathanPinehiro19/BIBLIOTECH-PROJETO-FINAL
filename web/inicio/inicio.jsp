<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="/index.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="https://iili.io/dPzedMX.png">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
    <%
         
                        String usuario = request.getParameter("usuario");
                        String senha = request.getParameter("senha");

                        // Configurando a conexão com o banco de dados
                        String url = "jdbc:postgresql://localhost:5432/bibliotech";
                        String dbUser = "postgres";
                        String dbPassword = "admin";
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
    
    %>
</body>
</html>