<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Usuário</title>
    <link rel="stylesheet" href="/index.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="result-container d-flex justify-content-center align-items-center min-vh-100">
        <%
            // Obtendo parâmetros do request
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String curso = request.getParameter("curso");
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha"); // Agora estamos usando senha em texto plano
            
            // Configurando a conexão com o banco de dados
            String url = "jdbc:postgresql://localhost:5432/bibliotech"; 
            String user = "postgres";
            String password = "admin";
            Connection conn = null;
            PreparedStatement pstmt = null;

<<<<<<< Updated upstream
            try {
                // Estabelecendo conexão
                Class.forName("org.postgresql.Driver");
                conn = DriverManager.getConnection(url, user, password);
=======
                // Configurando a conexão com o banco de dados
                String url = "jdbc:postgresql://localhost:5432/bibliotech?useUnicode=true&characterEncoding=UTF-8";
                String user = "postgres";
                String password = "admin";
                Connection conn = null;
                PreparedStatement pstmt = null;
>>>>>>> Stashed changes

                // Inserindo dados no banco de dados
                String sql = "INSERT INTO USUARIOS (nome, email, curso, usuario, senha_hash) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nome != null ? nome : null);
                pstmt.setString(2, email != null ? email : null);
                pstmt.setString(3, curso != null ? curso : null);
                pstmt.setString(4, usuario != null ? usuario : null);
                pstmt.setString(5, senha != null ? senha : null); // Armazenando senha em texto plano
                pstmt.executeUpdate();
               response.sendRedirect("cadastro_confirmado.html");
                
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("<center><p class='text-danger'>Erro ao cadastrar usuário: " + e.getMessage() + "</p></center>");
            } finally {
                // Fechando conexões
                try {
<<<<<<< Updated upstream
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
=======
                    // Estabelecendo conexão
                    Class.forName("org.postgresql.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    String checkEmailSql = "SELECT COUNT(*) FROM USUARIOS WHERE email = ?";
                    pstmt = conn.prepareStatement(checkEmailSql);
                    pstmt.setString(1, email != null ? email : null);

                    ResultSet rs = pstmt.executeQuery();
                    rs.next(); // Avança o cursor para a primeira linha

                    int emailCount = rs.getInt(1); // Obtém o número de contas com o mesmo email

                    if (emailCount > 0) {
                        response.sendRedirect("cadastro_fail.jsp");

                    } else {
                        // Inserindo dados no banco de dados
                        String sql = "INSERT INTO USUARIOS (nome, email, curso, usuario, senha_hash) VALUES (?, ?, ?, ?, ?)";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, nome != null ? nome : null);
                        pstmt.setString(2, email != null ? email : null);
                        pstmt.setString(3, curso != null ? curso : null);
                        pstmt.setString(4, usuario != null ? usuario : null);
                        pstmt.setString(5, senha != null ? senha : null); // Armazenando senha em texto plano
                        pstmt.executeUpdate();
                        response.sendRedirect("cadastro_confirmado.html");
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    out.println("<center><p class='text-danger'>Erro ao cadastrar usuário: " + e.getMessage() + "</p></center>");
                } finally {
                    // Fechando conexões
                    try {
                        if (pstmt != null) {
                            pstmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
>>>>>>> Stashed changes
                }
            }
        %>
    </div>
</body>
</html>
