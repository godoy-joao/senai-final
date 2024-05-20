<%-- Document : carrinho Created on : 01/05/2024, 14:59:55 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8">
                <title>Carrinho</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <link rel="stylesheet" href="./css/carrinho.css">
                <link rel="stylesheet" href="./css/base.css">
                <link rel="stylesheet" href="./css/header.css">
            </head>

            <body>
                <%@ include file="/WEB-INF/jspf/header.jspf" %>
                    <main class="d-flex justify-content-center h-100 w-100 branco-fundo-2">
                        <div class="bg-light p-2 w-75 h-80" id="carrinho-container">
                            <div id="carrinho-header" class="d-flex justify-content-between align-items-center w-100 px-3 pb-2 mt-3 border-bottom vertical-align-bottom">
                                <div class="row w-50 pe-5">
                                    <div class="col-4 d-flex justify-content-center">
                                        <p class="h3 cinza-texto-1">Carrinho</p>
                                    </div>
                                    <div class="col-4 d-flex justify-content-start ps-4">
                                        <button class="bg-transparent">
                                            <p class="fs-6 text-decoration-underline azul-2">Limpar carrinho</p>
                                        </button>
                                    </div>
                                </div>
                                <div class="row w-50">
                                    <div class="col-4">
                                        <p class="h4 cinza-texto-1">
                                            Total:
                                        </p>
                                        <p id="resultado-carrinho" class="h4 laranja-texto-2">

                                        </p>
                                    </div>
                                    <div class="col-5">
                                        <button class="laranja-fundo-3">
                                            <p class="branco-texto">
                                                Finalizar pedido
                                            </p>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div id="carrinho-body" class="w-100 px-3 mt-3">

                            </div>
                        </div>
                    </main>
                    <footer>

                    </footer>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                        crossorigin="anonymous"></script>
            </body>

            </html>