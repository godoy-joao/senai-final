<%-- Document : search Created on : 01/05/2024, 14:59:22 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                        crossorigin="anonymous">
                    <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
                        crossorigin="anonymous"></script>
                    <link rel="stylesheet" href="./css/header.css">
                    <link rel="stylesheet" href="./css/base.css">
                    <link rel="stylesheet" href="./css/search.css">
                    <title>Search</title>
                </head>

                <body class="overflow-x-hidden">
                    <%@ include file="/WEB-INF/jspf/header.jspf" %>
                        <div id="side-bar">
                            <div class="w-100" id="lateral-divisor"></div>
                            <label for="checkbox-group">Selecionar categoria:</label>
                            <div id="checkbox-group" class="d-flex flex-column">
                                <c:if test="${categorias.size() > 0}">
                                    <c:forEach items="${categorias}" var="categoria">
                                        <input type="checkbox" name="" id="checkbox-${categoria.nome}">
                                        <label for="checkbox-${categoria.nome}">${categoria.nome}</label>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                        <div id="result-body">
                            <div class="row">
                                <c:if test="${produtos.size() > 0}">
                                    <c:forEach items="${produtos}" var="produto">
                                        <div class="produto-card">
                                            <div class="produto-imagem">
                                                <c:if test="${produto.desconto > 0.0}">
                                                    <span class="tag-desconto">
                                                        -<fmt:formatNumber type="currency" value="${produto.desconto}" />
                                                    </span>
                                                </c:if>
                                                <img src="data:image/png;base64,${produto.imagemBase64}"
                                                    class="produto-capa" alt="">
                                            </div>
                                            <div class="produto-info">
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
                                                    <form action="sendToCart" method="post"
                                                        class="w-100 h-100 d-flex align-items-center justify-content-center">
                                                        <button type="submit" value="${produto.idProduto}"
                                                            name="addProduto" class="card-btn verde-fundo fs-6">
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
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                            crossorigin="anonymous"></script>
                </body>

                </html>