<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="https://iili.io/dPzedMX.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recuperar ao Conta</title>       
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <body>

        <style>
            .card {
                
                overflow: hidden;
                position: relative;
                text-align: left;
                border-radius: 0.5rem;
                max-width: 290px;
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
                background-color: #fff;
            }
            .dismiss {
                position: absolute;
                right: 10px;
                top: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0.5rem 1rem;
                background-color: #fff;
                color: black;
                border: 2px solid #D1D5DB;
                font-size: 1rem;
                font-weight: 300;
                width: 30px;
                height: 30px;
                border-radius: 7px;
                transition: .3s ease;
            }
            .dismiss:hover {
                background-color: #ee0d0d;
                border: 2px solid #ee0d0d;
                color: #fff;
            }
            .header {
                padding: 1.25rem 1rem 1rem 1rem;
            }
            .image {
                display: flex;
                margin-left: auto;
                margin-right: auto;
                background-color: #ffe4e8;
                flex-shrink: 0;
                justify-content: center;
                align-items: center;
                width: 3rem;
                height: 3rem;
                border-radius: 9999px;
                animation: animate .6s linear alternate-reverse infinite;
                transition: .6s ease;
            }
            .image svg {
                color: #d70014;
                width: 2rem;
                height: 2rem;
            }
            .content {
                margin-top: 0.75rem;
                text-align: center;
            }
            .title {
                color: #ff0000;
                font-size: 1rem;
                font-weight: 600;
                line-height: 1.5rem;
            }
            .message {
                margin-top: 0.5rem;
                color: #595b5f;
                font-size: 0.875rem;
                line-height: 1.25rem;
            }
            .actions {
                margin: 0.75rem 1rem;
            }
            .history {
    display: inline-flex;
    padding: 0.5rem 1rem;
    background-color: #d70014;
    color: #ffffff;
    font-size: 1rem;
    line-height: 1.5rem;
    font-weight: 500;
    justify-content: center;
    width: 100%;
    border-radius: 0.375rem;
    border: none;
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            }
            .track {
                display: inline-flex;
                margin-top: 0.75rem;
                padding: 0.5rem 1rem;
                color: #242525;
                font-size: 1rem;
                line-height: 1.5rem;
                font-weight: 500;
                justify-content: center;
                width: 100%;
                border-radius: 0.375rem;
                border: 1px solid #D1D5DB;
                background-color: #fff;
                box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            }
            @keyframes animate {
                from {
                    transform: scale(1);
                }
                to {
                    transform: scale(1.5);
                }
            }
        </style>
        <center>

            <div class="card">
                <div class="header">
                    <div class="image">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
                    </svg>
                    </div>
                    
                    <div class="content">
                        <span class="title">E-mail nao encontrado</span>
                        <p class="message">O e-mail fornecido nao pertence a um usuario.</p>
                    </div>
                    <div class="actions">
                        <button class="history" type="button" onclick="window.location.href='/rec_senha/rec_senha.html'">Voltar</button>

                    </div>
                </div>
            </div>
        </center>
    </body>
</html>

