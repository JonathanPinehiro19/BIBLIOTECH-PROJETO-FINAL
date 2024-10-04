<%@ page session="true" %>
<%@ page import="java.sql.*, org.json.*" %>
<%
    String usuarioLogado = request.getParameter("usuario");
    String novoNome = request.getParameter("nome");
    JSONObject jsonResponse = new JSONObject();
    boolean success = false;

    if (usuarioLogado != null && novoNome != null) {
        String url = "jdbc:postgresql://localhost:5432/bibliotech";
        String dbUser = "postgres";
        String dbPassword = "admin";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPassword);

            // Atualiza o nome no banco de dados
            String sql = "UPDATE USUARIOS SET nome = ? WHERE usuario = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, novoNome);
            pstmt.setString(2, usuarioLogado);

            int rowsAffected = pstmt.executeUpdate();
            success = (rowsAffected > 0);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Envia a resposta em formato JSON
    jsonResponse.put("success", success);
    response.setContentType("application/json");
    response.getWriter().write(jsonResponse.toString());
%>
