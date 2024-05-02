<%-- Document : login Created on : 30/04/2024, 13:56:26 Author : João Guilherme --%>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>
        <head>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
            <meta http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login</title>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="./css/login.css">
        </head>
        <body class="vh-100">
            <header>
                <div class="row justify-content-start">
                    <div class="col-4">
                        <a href="./home">
                            <img src="" alt="">
                            <p>A logo aparecerá aqui</p>
                        </a>
                    </div>
                </div>
            </header>
            <main class="d-flex align-items-center justify-content-center vh-100">
                <a href="./home" class="text-dark text-decoration-none">
                    <i class="fa-solid fa-arrow-left rounded-circle" id="backToIndex"></i>
                </a>
                <div class="container">
                    <div id="contLogin" class="formWrapper d-flex flex-column px-3 py-4">
                        <div class="formHeader">
                            <h3>
                                Login
                            </h3>
                            <button onclick="goToSignup()">
                                <p>Ainda não possui cadastro?</p>
                            </button>
                        </div>
                        <form id="loginForm" class="formContainer d-flex flex-column" action="logon" method="post">
                            <div id="radioGroup" class="row">
                                <input class="col-6" type="radio" name="option" id="radioEmail" checked>E-mail<br>
                                <input class="col-6" type="radio" name="option" id="radioTelefone">Telefone
                            </div>
                            <label for="login">Email ou número de telefone</label>
                            <input type="" id="login" name="login" required>
                            <label for="senhaLogin">Senha</label>
                            <input type="text" name="senhaLogin" id="senhaLogin" required>
                            <button type="submit" id="btnAcesso" form="loginForm" class="btnSubmit">Acessar</button>
                        </form>
                    </div>
                    <div id="contCadastro" class="formWrapper d-none">
                        <div class="formHeader">
                            <h3>
                                Cadastro
                            </h3>
                            <button onclick="goToLogin()">
                                <p>Já possui cadastro?</p>
                            </button>
                        </div>
                        <form id="signupForm" class="formContainer" action="signup" method="post">
                            <label for="inputNome">Nome e Sobrenome</label>
                            <input id="inputNome" type="text" name="nome" required>
                            <label for="inputEmail">Digite seu E-mail</label>
                            <input type="email" id="inputEmail" name="email" required>
                            <label for="inputTelefone">Número de telefone</label>
                            <input type="tel" id="inputTelefone" name="telefone">
                            <label for="inputSenha">Digite sua senha</label>
                            <input type="password" id="inputSenha" name="senha" required>
                            <button type="submit" id="btnCadastro" form="signupForm" class="btnSubmit">Cadastrar</button>
                        </form>
                    </div>
                </div>
            </main>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                crossorigin="anonymous"></script>
            <script src="./js/login.js"></script>
        </body>

        </html>