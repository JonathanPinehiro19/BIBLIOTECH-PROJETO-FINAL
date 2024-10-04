<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%
    String usuarioLogado = (String) session.getAttribute("usuario");
    String nomeUsuario = null;
    String emailUsuario = null;

    if (usuarioLogado == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Conexão com o banco de dados
    String url = "jdbc:postgresql://localhost:5432/bibliotech?useUnicode=true&characterEncoding=UTF-8";
    String dbUser = "postgres";
    String dbPassword = "admin";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // Consulta para recuperar dados do usuário
        String sql = "SELECT nome, email FROM USUARIOS WHERE usuario = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, usuarioLogado);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            nomeUsuario = rs.getString("nome");
            emailUsuario = rs.getString("email");
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp");
    } finally {
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
%>

<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="perfil.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <title>Gerenciador de Livros</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            .edit-input {
                display: none;
                margin-left: 10px;
            }
        </style>
        <script>
            $(document).ready(function () {
                $(".edit-icon").on("click", function () {
                    const parentDiv = $(this).closest(".user-info-data");
                    const nomeElement = parentDiv.find(".nome");
                    const editInput = parentDiv.find(".edit-input");
                    const saveButton = parentDiv.find(".save-button");

                    if (editInput.is(":visible")) {
                        // Se o campo de edição estiver visível, salva e oculta
                        const novoNome = editInput.val();
                        $.post("updateUser.jsp", {usuario: '<%= usuarioLogado%>', nome: novoNome}, function (response) {
                            if (response.success) {
                                window.location.reload(); // Recarrega a página
                            } else {
                                alert("Erro ao atualizar nome.");
                            }
                        }, "json");
                    } else {
                        // Caso contrário, exibe o campo de edição e o botão de salvar
                        editInput.show().val(nomeElement.text());
                        saveButton.show();
                    }
                });
            });
        </script>
    </head>
    <body>
        <aside>
            <a class="img-logo" href="#" onclick="window.location.href = '../inicio/inicio.html'">
                <img style="width: 100%; height: auto; max-width: 300px; display: block; margin: 0 auto;" src="https://iili.io/dtTL4It.png" border="0">
            </a>
            <div class="user-info">
                <div class="user-info-data">
                    <p><strong>Nome:</strong> <span class="nome"><%= nomeUsuario%></span>
                        <input type="text" class="edit-input" placeholder="Novo nome">
                        <button class="save-button" style="display: none;">Salvar</button>
                        <svg class="edit-icon" style="width: 20px; float: right; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                        <path d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160L0 416c0 53 43 96 96 96l256 0c53 0 96-43 96-96l0-96c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 96c0 17.7-14.3 32-32 32L96 448c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l96 0c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 64z"/>
                        </svg>
                    </p>
                </div>
                <p><strong>Usuário:</strong> <%= usuarioLogado%></p>
                <p><strong>Email:</strong> <%= emailUsuario%></p>
            </div>
            <div class="sidebar-buttons">
                <button class="alterar-dados" onclick="window.location.href = '../inicio/inicio.html'">Início</button>
                <center>
                    <button style="width: 100%" class="alterar-dados" type="button" onclick="window.location.href = '../../index.html'">Sair</button>
                </center>
            </div>
        </aside>
        <main>
            <div class="search-container">
                <input type="text" placeholder="Pesquisar...">
                <button class="search-button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
            <h1>Favoritar Livro</h1>
            <div class="book-grid">
                <div class="book-item">+</div>
                <div class="book-item">+</div>
                <div class="book-item">+</div>
                <div class="book-item">+</div>
                <div class="book-item">+</div>
                <div class="book-item">+</div>
                <div class="book-item">+</div>
                <div class="book-item">+</div>
            </div>
        </main>
    </body>
</html>
