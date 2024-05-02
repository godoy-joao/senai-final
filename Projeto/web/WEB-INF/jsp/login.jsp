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
        <body class="vh-100 d-flex align-items-center justify-content-center">
            <main class="">
                 <a href="./home" class="text-dark text-decoration-none">
                            <i class="fa-solid fa-arrow-left rounded-circle" id="backToIndex"></i>
                        </a>
                <div class="align-self-center w-100" id="container">
                    <div id="contLogin" class="formWrapper d-flex flex-column px-3 py-4">
                        <div class="formHeader d-flex flex-row justify-content-between">
                            <h3>
                                Login
                            </h3>
                            <button onclick="goToSignup()">
                                <p>Cadastre-se</p>
                            </button>
                        </div>
                        <form id="loginForm" class="formContainer d-flex flex-column" action="logon" method="post">
                            <div id="radioGroup" class="d-flex gap-1 flex-row">
                                <input class="" type="radio" name="option" id="radioEmail" checked><label class="me-1" for="radioEmail">E-mail</label>
                                <input class="" type="radio" name="option" id="radioTelefone"><label for="radioTelefone">Telefone</label>
                            </div>
                            <label for="login">Email ou número de telefone</label>
                            <input type="email" id="login" name="login" required>
                            <label for="senhaLogin">Senha</label>
                            <input type="text" name="senhaLogin" id="senhaLogin" required>
                            <button type="submit" id="btnAcesso" form="loginForm" class="btnSubmit">Acessar</button>
                        </form>
                    </div>
                    <div id="contCadastro" class="formWrapper d-none flex-column px-3 py-4">
                        <div class="formHeader d-flex flex-row justify-content-between">
                            <h3>
                                Cadastro
                            </h3>
                            <button onclick="goToLogin()">
                                <p>Faça login</p>
                            </button>
                        </div>
                        <form id="signupForm" class="formContainer d-flex flex-column" action="signup" method="post">
                            <label for="inputNome">Nome e Sobrenome</label>
                            <input id="inputNome" type="text" name="nome" required>
                            <label for="inputEmail">Digite seu E-mail</label>
                            <input type="email" id="inputEmail" name="email" required>
                            <label for="inputTelefone">Número de telefone</label>
                            <input type="tel" id="inputTelefone" name="telefone">
                            <label for="inputSenha">Digite sua senha</label>
                            <input type="password" id="inputSenha" name="senha" required>
                            <label for="confirmaSenha">Confirme sua senha</label>
                            <input type="password" id="confirmaSenha" name="senha" required>
                            <label for="dataNasc">Data de nascimento</label>
                            <input type="date" id="dataNasc" name="dataNasc" required>
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