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
    <center>
        <div id="login" class="d-flex justify-content-center align-items-center min-vh-100">
            <div class="container card shadow-sm">
                <div class="card-body">
                    <h3 class="heading">Login</h3>
                    <center>
                        <a class="img-logo" href="https://freeimage.host/br">
                            <img src="https://iili.io/dgMdocQ.png" alt="Logo" border="0">
                        </a>
                    </center>
                    <form id="login-form" action="login.jsp" method="post">                      
                        <div class="form-group">
                            <label for="usuario" class="text-info">Usuário:</label>
                            <input type="text" name="usuario" id="usuario" class="form-control">
                        </div>                                                                                        
                        <div class="form-group">
                            <label for="senha" class="text-info">Senha:</label>
                            <input type="password" name="senha" id="senha" class="form-control">
                        </div>
                        <div class="form-group text-center">
                            <input type="submit" name="submit" class="btn btn-primary" value="Entrar">
                        </div>
                    </form>
                    <%
                        // Obtendo parâmetros do request
                        String usuario = request.getParameter("usuario");
                        String senha = request.getParameter("senha");

                        // Configurando a conexão com o banco de dados
                        String url = "jdbc:postgresql://localhost:5432/bibliotech?useUnicode=true&characterEncoding=UTF-8";
                        String dbUser = "postgres";
                        String dbPassword = "admin";
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        try {
                            // Estabelecendo conexão
                            Class.forName("org.postgresql.Driver");
                            conn = DriverManager.getConnection(url, dbUser, dbPassword);

                            // Verificando credenciais
                            String sql = "SELECT senha_hash FROM USUARIOS WHERE usuario = ?";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, usuario);
                            rs = pstmt.executeQuery();

                            if (rs.next()) {
                                // Obtendo a senha armazenada
                                String senhaHash = rs.getString("senha_hash");

                                // Verificando a senha
                                if (senha != null && senha.equals(senhaHash)) {
                                    // Senha correta
                                    session.setAttribute("usuario", usuario);
                                    response.sendRedirect("inicio/inicio.html");
                                } else {
                                    // Senha incorreta
                                    response.sendRedirect("login_fail.jsp");
                                }
                            } else {
                                // Usuário não encontrado
                                response.sendRedirect("login_fail.jsp");
                            }
                        } catch (ClassNotFoundException | SQLException e) {
                            e.printStackTrace();
                            out.println("<center><p class='text-danger'>Erro ao verificar usuário: " + e.getMessage() + "</p></center>");
                        } finally {
                            // Fechando conexões
                            try {
                                if (rs != null) {
                                    rs.close();
                                }
                                if (pstmt != null) {
                                    pstmt.close();
                                }
                                if (conn != null) {
                                    conn.close();
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
                    %>
                </div>
            </div>
        </div>
    </center>
</body>
</html>
