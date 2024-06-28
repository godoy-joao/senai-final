<%-- Document : search Created on : 01/05/2024, 14:59:22 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" name="viewport"
                        content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                        crossorigin="anonymous">
                    <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
                        crossorigin="anonymous"></script>
                    <link rel="stylesheet" href="./css/base.css">
                    <link rel="stylesheet" href="./css/search.css">
                    <link rel="shortcut icon" href="./assets/logo-round.png" type="image/x-icon">
                    <title>Search</title>
                </head>

                <body class="overflow-x-hidden azul-fundo-3">
                    <%@ include file="/WEB-INF/jspf/header.jspf" %>

                        <div id="side-bar" class="branco-fundo">
                            <form action="search" method="get" onkeydown="return event.key != 'Enter';">
                                <div id="div-categorias">
                                    <span>
                                        Categorias
                                    </span>
                                    <div id="checkbox-group" class="row justify-content-between g-0">
                                        <c:forEach items="${categorias}" var="categoria">
                                            <div class="checkbox-div">
                                                <input type="checkbox" class="c-checkbox" name="c"
                                                    value="${categoria.idCategoria}"
                                                    id="checkbox-${categoria.nome}"><label
                                                    for="checkbox-${categoria.nome}">${categoria.nome}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div id="div-preco">
                                    <span>
                                        Preço
                                    </span>
                                    <div id="range-wrapper">
                                        <div class="div-range">
                                            <span>
                                                Preço mínimo:
                                            </span>
                                            <div>
                                                <input type="range" class="preco-range" name="range-preco-min" value="0"
                                                    min="0" max="19999" id="preco-min">
                                                <input type="number" class="range-value" min="0" value="0" max="19999">
                                            </div>
                                        </div>
                                        <div class="div-range">
                                            <span>
                                                Preco máximo:
                                            </span>
                                            <div>
                                                <input type="range" class="preco-range" name="range-preco-max" min="1"
                                                    value="12000" max="12000" id="preco-max">
                                                <input type="number" class="range-value" min="1" value="12000"
                                                    max="12000">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="div-submit">
                                    <button type="submit">
                                        Aplicar
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div id="result-container">
                            <div id="result-body" class="branco-fundo">
                                <div class="row justify-content-center gx-0">
                                    <c:if test="${produtos.size() > 0}">
                                        <c:forEach items="${produtos}" var="produto">
                                            <div class="produto-card">
                                                <div class="produto-imagem">
                                                    <a href="./produto?id=${produto.idProduto}">
                                                        <c:if test="${produto.desconto > 0}">
                                                            <span class="tag-desconto">
                                                                -
                                                                <fmt:formatNumber type="currency"
                                                                    value="${produto.desconto}" />
                                                            </span>
                                                        </c:if>
                                                        <img src="data:image/png;base64,${produto.imagemBase64}"
                                                            class="produto-capa" alt="">
                                                    </a>
                                                </div>
                                                <div class="produto-info">
                                                    <div class="div-nome">
                                                        <span class="produto-nome">
                                                            ${produto.nome}
                                                        </span>
                                                    </div>
                                                    <div id="div-valor">
                                                        <span class="valor">
                                                            <c:if test="${produto.valor != produto.valorFinal}">
                                                                <fmt:formatNumber type="currency"
                                                                    value="${produto.valor}" />
                                                            </c:if>
                                                        </span>

                                                        <span class="preco laranja-texto-3">
                                                            <fmt:formatNumber type="currency"
                                                                value="${produto.valorFinal}" />
                                                        </span>
                                                    </div>
                                                    <div id="div-btn">
                                                        <form action="enviarParaCarrinho" method="post"
                                                            class="w-100 h-100 d-flex align-items-center justify-content-center">
                                                            <input type="text" style="height: 0.1px; width: 0.1px; position: absolute; background-color: transparent; border: transparent;"  name="lastPage" value="./search?s=">
                                                            <button type="submit" value="${produto.idProduto}"
                                                                name="item" class="card-btn verde-fundo fs-6">
                                                                <span class="msg1">Comprar</span>
                                                                <span class="msg2"><i
                                                                        class="fa-solid fa-shopping-cart me-1"></i>Adicionar</span>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <%@ include file="/WEB-INF/jspf/footer.jspf" %>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                                crossorigin="anonymous"></script>
                            <script src="./js/search.js"></script>
                            <script>
                                document.addEventListener("DOMContentLoaded", () => {
                                    var msg = '${prodAdd.nome}';
                                    if (msg != '') {
                                        alert(msg +' foi adicionado ao carrinho!');
                                    }
                                })
                            </script>
                </body>

                </html>