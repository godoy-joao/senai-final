<%-- Document : perfil Created on : 30/04/2024, 14:48:25 Author : João guilherme --%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" name="viewport" charset="UTF-8"
                    content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
                <title>Perfil</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <link rel="stylesheet" href="./css/header.css">
                <link rel="stylesheet" href="./css/base.css">
                <link rel="stylesheet" href="./css/perfil.css">
                <link rel="shortcut icon" href="./assets/logo-round.png" type="image/x-icon">
            </head>

            <body class="overflow-hidden">
                <%@ include file="/WEB-INF/jspf/header.jspf" %>
                    <div id="div-updImg" class="w-20 h-25 d-none py-3 px-4 flex-column gap-2">
                        <form action="updImg" method="post" id="form-updImg" class="h-50 w-100 d-flex flex-row gap-2"
                            enctype="multipart/form-data">
                            <label for="input-updImg"><i
                                    class="fa-solid fa-arrow-up-from-bracket fs-5 preto-texto"></i><br>
                                Selecionar imagem </label>
                            <input type="file" id="input-updImg" name="input-updImg" accept="image/*" class="border">
                            <button type="submit" id="submitImg" class="border">
                                Enviar
                            </button>
                        </form>
                        <button type="button" id="cancel-updImg" onclick="hideEditImg()"
                            class="border h-20">Cancelar</button>
                    </div>
                    <main class="branco-fundo-2 vh-100 overflow-hidden">
                        <div class="row justify-content-between h-100">
                            <div id="barraLateral" class="col-3 d-flex flex-column p-0 branco-fundo">
                                <div
                                    class="border-end border-top-0 h-100 d-flex px-2 flex-column gap-1 overflow-x-hidden">
                                    <div class="px-1 mt-5 mb-1">
                                        <button id="btnDados" onclick="verDados()"
                                            class="h-100 w-100 bg-transparent border-0 my-0">
                                            <div class="d-flex w-100 flex-row m-3 justify-content-start">
                                                <div class="ms-4 mb-0 text-center fs-4 d-flex align-items-center">
                                                    <i class="fa-solid fa-user me-2 d-flex"
                                                        style="width: 30px; height: 30px;"></i>
                                                    <p class="ms-2 mb-0  text-center fs-5 d-flex align-items-center">
                                                        Editar dados
                                                    </p>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="px-1 my-1">
                                        <button id="btnPedidos" onclick="window.location='./pedidos'"
                                            class="h-100 w-100 bg-transparent border-0 my-0">
                                            <div class="d-flex w-100 flex-row m-3 justify-content-start">
                                                <div class="ms-4 mb-0 text-center fs-3 d-flex align-items-center">
                                                    <i class="fa-regular fa-clipboard me-2 d-flex"
                                                        style="width: 30px; height: 30px;"></i>
                                                    <p class="ms-2 mb-0  text-center fs-5 d-flex align-items-center">
                                                        Histórico de pedidos
                                                    </p>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="px-1 my-1">
                                        <form action="logout" method="post">
                                            <button id="btnOpcoes" type="submit"
                                                class="h-100 w-100 bg-transparent border-0 my-0">
                                                <div class="d-flex w-100 flex-row m-3 justify-content-start">
                                                    <div class="ms-4 mb-0 text-center fs-2 d-flex align-items-center">
                                                        <img src="./assets/logout.svg" alt=""
                                                            style="width: 30px; height: 30px; transform:rotate(180deg)">
                                                        <p
                                                            class="ms-2 mb-0  text-center fs-5 d-flex align-items-center">
                                                            Logout
                                                        </p>
                                                    </div>
                                                </div>
                                            </button>
                                        </form>

                                    </div>
                                </div>
                            </div>
                            <div id="areaPrincipal" class="col-8 p-0 border-start branco-fundo">
                                <div class="h-100 w-100">
                                    <div class="d-flex flex-row p-4 mt-4 gx-0 border-bottom" id="div-top">
                                        <div class="w-25">
                                            <div class="d-flex w-100" id="fotoPerfil">
                                                <div class="d-flex" id="foto">
                                                    <img src="data:image/png;base64,${user.fotoBase64}" id="fotoImg"
                                                        class="rounded-pill border border-2" alt="">
                                                </div>
                                                <div id="editarImagem">
                                                    <button id="editImgPen" onclick="showEditImg()">
                                                        <p class="preto-texto m-0 p-0">
                                                            <i class="fa-solid fa-pen"></i>
                                                        </p>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-70 d-flex flex-wrap">
                                            <div class="row w-100">
                                                <div class="col-6 d-flex ms-3 flex-column w-100">
                                                    <div class="fs-4">
                                                        ${user.nome}
                                                    </div>
                                                    <div class="fs-5">
                                                        ${user.cpf}
                                                    </div>
                                                    <div class="fs-5">
                                                        <fmt:formatDate value="${user.dataNasc}" pattern="dd/MM/yyyy" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 p-3 ps-5">
                                        <div id="campos-dados" class="row justify-content-center">
                                            <div class="col-4 d-flex flex-column gap-3">
                                                <label for="form-updEmail" class="me-2 text-end"
                                                    style="height: 28px;">Email: </label>
                                                <label for="form-updTel" class="me-2 text-end"
                                                    style="height: 28px;">Telefone: </label>
                                                <label for="form-updSenha" class="me-2 text-end"
                                                    style="height: 28px;">Senha: </label>
                                            </div>
                                            <div class="col-8 h-100 pe-5 d-flex flex-column gap-3">
                                                <div
                                                    class="d-flex flex-row gap-2 w-100 justify-content-center align-items-center pe-5 me-5">
                                                    <form action="updEmail" id="form-updEmail" method="post"
                                                        class="updDados d-flex flex-row border border-dark-subtle w-100 ">
                                                        <div class="w-100 ">
                                                            <input type="text" name="input-updEmail" id="input-updEmail"
                                                                placeholder="${user.email}"
                                                                class="border-0 w-100 outline-0 inputShadow ps-1"
                                                                disabled>
                                                        </div>
                                                        <div class="w-auto ">
                                                            <button type="submit" id="submitEmail"
                                                                class="d-none border-0 border-start fundo-1 inputShadow">
                                                                <i class="fa-solid fa-check"></i>
                                                            </button>
                                                        </div>
                                                    </form>
                                                    <button onclick="actvEmail()" class="border"><i
                                                            class="fa-solid fa-pen"></i></button>
                                                </div>
                                                <div
                                                    class="d-flex flex-row gap-2 w-100 justify-content-center align-items-center pe-5 me-5">
                                                    <form action="updTel" id="form-updTel" method="post"
                                                        class="updDados d-flex flex-row border border-dark-subtle w-100 ">
                                                        <div class="w-100 ">
                                                            <input type="tel" name="input-updTel" id="input-updTel"
                                                                placeholder="${user.telefone}"
                                                                class="border-0 w-100 outline-0 inputShadow ps-1"
                                                                disabled>
                                                        </div>
                                                        <div class="w-auto ">
                                                            <button type="submit" id="submitTel"
                                                                class="d-none border-0 border-start fundo-1 inputShadow">
                                                                <i class="fa-solid fa-check"></i>
                                                            </button>
                                                        </div>
                                                    </form>
                                                    <button onclick="actvTel()" class="border"><i
                                                            class="fa-solid fa-pen"></i></button>
                                                </div>
                                                <div
                                                    class="d-flex flex-row gap-2 w-100 justify-content-center align-items-center pe-5 me-5">
                                                    <form action="updSenha" id="form-updSenha" method="post"
                                                        class="updDados d-flex flex-row border border-dark-subtle w-100 ">
                                                        <div class="w-100 ">
                                                            <input type="password" name="input-updSenha"
                                                                placeholder="*****" id="input-updSenha"
                                                                class="border-0 w-100 outline-0 inputShadow ps-1"
                                                                disabled>
                                                        </div>
                                                        <div class="w-auto ">
                                                            <button type="submit" id="submitSenha"
                                                                class="d-none border-0 border-start fundo-1 inputShadow">
                                                                <i class="fa-solid fa-check"></i>
                                                            </button>
                                                        </div>
                                                    </form>
                                                    <button onclick="actvSenha()" class="border"><i
                                                            class="fa-solid fa-pen"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                        crossorigin="anonymous"></script>
                    <script src="./js/perfil.js"></script>
            </body>

            </html>