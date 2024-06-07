<%-- Document : produto Created on : 01/05/2024, 23:00:40 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="Content-Type" name="viewport"
                            content="width=device-width, initial-scale=1.0, text/html">
                        <title>${produto.nome}</title>
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                            crossorigin="anonymous">
                        <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                        <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
                            crossorigin="anonymous"></script>
                        <link rel="stylesheet" href="./css/base.css">
                        <link rel="stylesheet" href="./css/produto.css">
                    </head>

                    <body class="overflow-x-hidden">
                        <%@ include file="/WEB-INF/jspf/header.jspf" %>

                            <main class="branco-fundo-2">
                                <div id="container">
                                    <div id="produto-wrapper">
                                        <div id="info-produto">
                                            <div id="div-imagem">
                                                <div id="imagem-produto">
                                                    <img src="data:image/png;base64,${produto.imagemBase64}"
                                                        class="produto-capa" alt="">
                                                </div>
                                                <div id="div-slider">
                                                    <button id="btn-volta">
                                                        <img src="./assets/arrow.png" alt="">
                                                    </button>
                                                    <button id="btn-avanca">
                                                        <img src="./assets/arrow.png" alt="">
                                                    </button>
                                                    <c:choose>
                                                        <c:when test="${produtoImagens.size() > 1}">
                                                            <c:forEach items="${produtoImagens}" var="imagem">
                                                                <div class="div-img">
                                                                    <button class="img-btn">
                                                                        <img src="data:image/png;base64,${imagem.imagemBase64}"
                                                                            alt="">
                                                                    </button>
                                                                </div>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="div-img">
                                                                <button>Sem imagens...</button>
                                                            </div>
                                                            <div class="div-img">
                                                                <button>Sem imagens...</button>
                                                            </div>
                                                            <div class="div-img">
                                                                <button>Sem imagens...</button>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div id="wrapper">
                                                <div id="nome">
                                                    <span>
                                                        ${produto.nome}
                                                    </span>
                                                </div>
                                                <div id="div-valor">
                                                    <span id="valor-final">
                                                        <fmt:formatNumber type="currency"
                                                            value="${produto.valorFinal}" />
                                                        <span class="ps-3 text-black">
                                                            NO PIX ou à vista
                                                        </span>
                                                    </span>
                                                    <div>
                                                        <span id="custo">
                                                            <fmt:formatNumber type="currency"
                                                                value="${produto.valor}" />
                                                        </span>
                                                    </div>
                                                </div>
                                                <div id="btn-wrapper">
                                                    <div id="categorias">
                                                        <span>Categorias: <c:forEach items="${produtoCategorias}"
                                                                var="categoria" varStatus="contagem">
                                                                <c:choose>
                                                                    <c:when
                                                                        test="${contagem.count < produtoCategorias.size()}">
                                                                        ${categoria.nome},
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${categoria.nome}.
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </span>
                                                    </div>
                                                    <div id="div-comprar">
                                                        <button id="comprar-btn">
                                                            <span>
                                                                <i class="fa-solid fa-shopping-cart"></i>
                                                            </span>
                                                            <span class="ms-2">Adicionar ao carrinho</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="div-info">
                                            <div id="div-descricao">
                                                <span>${produto.descricao}</span>
                                            </div>

                                        </div>
                                    </div>
                                    <div id="avaliacoes">
                                        <div>
                                            <div id="aval-perfil">
                                                <img src="data:image/png;base64,${usuario.fotoBase64}" alt=""
                                                    style="width: 48px; height: 48px; object-fit: fill;">
                                            </div>
                                            <c:choose>
                                                <c:when test="${usuario.idUsuario > 0}">
                                                    <textarea name="comentario" id="area-comentario" cols="30"
                                                        rows="10"></textarea>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                        <p>Adicionar forEach aqui</p>
                                        <div>

                                        </div>

                                    </div>
                                    <div id="recomendados">
                                        <div>

                                        </div>
                                    </div>
                                </div>
                            </main>
                            <%@ include file="/WEB-INF/jspf/footer.jspf" %>
                    </body>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                        crossorigin="anonymous"></script>

                    </html>