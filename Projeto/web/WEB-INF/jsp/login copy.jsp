<%-- Document : login Created on : 04/05/2024, 13:13:44 Author : João Guilherme --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="./css/login.css">
            <link rel="stylesheet" href="./css/base.css">
            <title>Login</title>
        </head>

        <body class="d-flex justify-content-center align-items-center vh-100 vw-100">
            <div id="btnHome">
                <a href="./home" class="text-dark fs-2 d-flex flex-row text-decoration-none">
                    <span>
                        <i class="fa-solid fa-arrow-left"></i>
                    </span>
                    <span>
                        Home
                    </span>
                </a>
            </div>
            <main>
                <div class="form-wrapper d-flex" id="div-login">
                    <div class="w-100 d-flex flex-column">
                        <span class="h3">
                            Login
                        </span>
                        <button class="fs-4 border-0 bg-transparent" onclick="goToSignup()">
                            <span>Cadastre-se</span>
                        </button>
                    </div>
                    <form action="logon" method="post">
                        <div class="div-input">
                            <label class="form-label" for="input-login">E-mail ou número de telefone</label>
                            <input class="form-control" type="text" name="login-login">
                        </div>
                        <div class="div-input">
                            <label class="form-label" for="input-senha">Senha</label>
                            <input class="form-control" type="password" name="login-senha">
                        </div>
                        <div>
                            <button type="submit">Login</button>
                        </div>
                    </form>
                </div>

                <div class="d-none form-wrapper" id="div-cadastro">
                    <div class="w-100 d-flex flex-column">
                        <span class="h3">
                            Cadastro
                        </span>
                        <button class="fs-4 border-0 bg-transparent" onclick="goToLogin()">
                            <p>Fazer login</p>
                        </button>
                    </div>
                    <form class="border-start ps-3" action="signup" method="post">
                        <div class="mb-3">
                            <label for="nome" class="form-label">Nome e sobrenome</label>
                            <input type="text" class="form-control" name="nome" id="nome">
                        </div>
                        <div class="mb-3">
                            <label for="dataNascimento" class="form-label">Data de nascimento</label>
                            <input type="date" class="form-control" name="dataNascimento" id="dataNascimento">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="email">
                        </div>
                        <div class="mb-3">
                            <label for="telefone" class="form-label">Número de celular</label>
                            <input type="tel" class="form-control" name="telefone" id="telefone">
                        </div>
                        <div class="mb-3">
                            <label for="senha" class="form-label">Senha</label>
                            <input type="password" class="form-control" name="senha" id="senha">
                        </div>
                        <div class="mb-3">
                            <label for="confirmaSenha" class="form-label">Confirme a senha</label>
                            <input type="password" class="form-control" name="confirmaSenha" id="confirmaSenha">
                            <label id="passHelper" class="form-text text-danger" for="confirmaSenha"></label>
                        </div>
                        <div class="w-100 d-flex justify-content-center">
                            <button type="submit" class="btn btn-dark justify-self-center">Cadastre-se
                                <i class="fa-solid fa-user"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </main>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
            <script src="./js/login.js"></script>
            <script>
                var tela = '${telaInicial}';
                if (tela === "cadastro") {
                    goToSignup();
                }

            </script>
        </body>

        </html>