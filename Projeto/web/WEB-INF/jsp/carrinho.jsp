<%-- Document : carrinho Created on : 01/05/2024, 14:59:55 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>
                    <fmt:setLocale value="pt_BR" />

                    <head>
                        <meta http-equiv="Content-Type" name="viewport"
                            content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
                        <title>Carrinho</title>
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                            crossorigin="anonymous">
                        <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                        <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
                            crossorigin="anonymous"></script>
                        <link rel="stylesheet" href="./css/carrinho.css">
                        <link rel="stylesheet" href="./css/base.css">
                        <link rel="stylesheet" href="./css/header.css">
                    </head>

                    <body>
                        <%@ include file="/WEB-INF/jspf/header.jspf" %>
                            <main class="branco-fundo-4">
                                <div id="carrinho-container" class="branco-fundo">
                                    <div id="carrinho-header">
                                        <div id="header-linha">
                                            <div class="header-separador">
                                                <div id="header-titulo-div">
                                                    <span id="header-titulo">Carrinho</span>
                                                </div>
                                                <div id="header-limpar-div">
                                                    <form action="esvaziarCarrinho" method="post">
                                                        <button id="header-limpar-btn" type="submit">Esvaziar <i
                                                                class="fa-solid fa-trash"></i></button>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="header-separador">
                                                <div id="header-valor-div">
                                                    <label for="header-valor-total">Total: </label>
                                                    <span id="header-valor-total">
                                                        <fmt:formatNumber type="currency" value="${valorFinal}" />
                                                    </span>
                                                </div>
                                                <div id="header-finalizar-div">
                                                    <button id="header-finalizar-btn" type="submit">Finalizar
                                                        pedido</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="carrinho-body">
                                        <c:choose>
                                            <c:when test="${fn:length(produtos) < 1}">
                                                <div
                                                    class="w-100 h-100 d-flex justify-content-center align-items-center">
                                                    <span class="fs-1">Carrinho vazio!</span>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${produtos}" var="produto">
                                                    <div class="produto-box" id="box-id-${produto.idProduto}">
                                                        <div class="div-img">
                                                            <img src="data:image/png;base64,${produto.imagemBase64}"
                                                                alt="" class="produto-img">
                                                        </div>
                                                        <div class="info-wrapper">
                                                            <div class="info-nome">
                                                                <span class="produto-nome">${produto.nome}</span>
                                                            </div>
                                                            <div class="info-valor-final">
                                                                <span class="valor-final">
                                                                    <fmt:formatNumber type="currency"
                                                                        value="${produto.valorFinal}" />
                                                                </span>
                                                            </div>
                                                            <div class="info-qtd">
                                                                <form action="adicionarItem" method="post">
                                                                    <button class="qtd-btn" name="item" type="submit" value="${produto.idProduto}">
                                                                        <i class="fa-solid fa-plus me-2"></i>
                                                                        Adicionar
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>

                                                        <div class="div-remover-produto">
                                                            <form action="removerItem" method="post">
                                                                <button type="submit" name="item"
                                                                    value="${produto.idProduto}">
                                                                    <i class="fa-solid fa-trash"></i>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </main>
                            <%@ include file="/WEB-INF/jspf/footer.jspf" %>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                                crossorigin="anonymous"></script>
                    </body>

                    </html>