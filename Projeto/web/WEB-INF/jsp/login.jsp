<%-- Document : login Created on : 04/05/2024, 13:13:44 Author : João Guilherme --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" name="viewport"
                content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
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
            <div id="btn-home">
                <a href="./home" class="text-decoration-none">
                    <span id="home-icone">
                        <i class="fa-solid fa-arrow-left"></i>
                    </span>
                    <span>
                        Voltar para a home
                    </span>
                </a>
            </div>
            <div>
                <div class="d-flex p-3 form-wrapper" id="formLoginWrapper">
                    <div class="formHeader d-flex flex-column align-items-center justify-content-center p-3">
                        <p class="h3">Login</p>
                        <p class="fs-6 text-body-secondary">Insira suas informações de login.</p>
                        <button onclick="goToSignup()">
                            <p>Sem cadastro? Clique aqui.</p>
                        </button>
                    </div>


                    <form class="" action="logon" method="post" id="formLogin">
                        <div class="mb-3">
                            <label class="mb-1" for="form-label">Selecione uma das opções</label>
                            <div id="login-check-group" class="d-flex flex-row gap-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="loginOption"
                                        id="loginOptionEmail" checked>
                                    <label class="form-check-label" for="loginOptionEmail">
                                        Email
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="loginOption"
                                        id="loginOptionTelefone">
                                    <label class="form-check-label" for="loginOptionTelefone">
                                        Telefone
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="loginUser" class="form-label">Email ou telefone</label>
                            <input type="email" class="form-control" id="loginUser" name="loginUser"
                                aria-describedby="emailHelp">
                        </div>
                        <div class="mb-3">
                            <label for="loginPass" class="form-label">Senha</label>
                            <input type="password" class="form-control" id="loginPass" name="loginPass">
                        </div>
                        <label for="" id="errorMessage"></label>
                        <div class="w-100 d-flex justify-content-center">
                            <button type="submit" class="btn btn-dark justify-self-center">Acessar
                                <i class="fa-solid fa-arrow-right-to-bracket"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="d-none form-wrapper p-3" id="formSignupWrapper">
                    <div class="formHeader d-flex flex-column align-items-center justify-content-center p-3">
                        <p class="h3">Cadastro</p>
                        <p class="fs-6 text-body-secondary w-75 text-center m-0">Preencha com suas informações para </p>
                        <p class="fs-6 text-body-secondary text-wrap w-75 text-center">realizar o cadastro. </p>
                        <button onclick="goToLogin()">
                            <p>Já tem conta? Clique aqui.</p>
                        </button>
                    </div>
                    <form class="" action="signup" method="post" id="formSignup">
                        <div class="mb-1">
                            <label for="nome" class="form-label">Nome e sobrenome</label>
                            <input type="text" class="form-control" name="nome" id="nome">
                        </div>
                        <div class="mb-1">
                            <label for="dataNascimento" class="form-label">Data de nascimento</label>
                            <input type="date" class="form-control" name="dataNascimento" id="dataNascimento">
                        </div>
                        <div class="mb-1">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="email">
                        </div>
                        <div class="mb-1">
                            <label for="telefone" class="form-label">Número de celular</label>
                            <input type="tel" class="form-control" name="telefone" id="telefone">
                        </div>
                        <div class="mb-1">
                            <label for="senha" class="form-label">Senha</label>
                            <input type="password" class="form-control" name="senha" id="senha">
                        </div>
                        <div class="mb-1">
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
            </div>

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