<%@ page session="true" %>
<%
    // Recupera o nome e o e-mail da sessão
    String nomeUsuario = (String) session.getAttribute("nome");
    String emailUsuario = (String) session.getAttribute("email");

    if (nomeUsuario == null || emailUsuario == null) {
        // Caso o usuário não esteja logado, redireciona para a página de login
        // response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="perfil.css">
    <title>Gerenciador de Livros</title>
    <style>
        /* Adicione seu CSS aqui */
    </style>
</head>
<body>
    <aside>
        <a class="img-logo" href="#">
            <img style="
                 width: 100%;
                 height: auto;
                 max-width: 300px;
                 display: block;
                 margin: 0 auto;" src="https://iili.io/dtTL4It.png" border="0">
        </a>
        <div class="user-info">
            <p><strong>Nome:</strong> <%= nomeUsuario %></p>
            <p><strong>Usuario:</strong> <%= (String) session.getAttribute("usuario") %></p>
            <p><strong>Email:</strong> <%= emailUsuario %></p>
        </div>
        <div class="sidebar-buttons">
            <button class="alterar-dados">Alterar Dados</button>
            <button class="sair">Sair</button>
        </div>
    </aside>
    <main>
        <div class="search-container">
            <input type="text" placeholder="Pesquisar...">
        </div>
        <h1>Favoritar Livro</h1>
        <div class="book-grid">
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
