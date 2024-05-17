<%-- Document : search Created on : 01/05/2024, 14:59:22 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <link rel="stylesheet" href="./css/header.css">
                <link rel="stylesheet" href="./css/base.css">
                <link rel="stylesheet" href="./css/search.css">
                <title>Search</title>
            </head>

            <body>
                <%@ include file="/WEB-INF/jspf/header.jspf" %>
                    <div class="row">
                        <div class="col-4" id="side-bar">
                            <label for="checkbox-group">Selecionar categoria:</label>
                            <div id="checkbox-group" class="d-flex flex-column">
                                <c:if test="${categorias.size() > 0}">
                                    <c:forEach items="categorias" var="categoria">
                                        <input type="checkbox" name="" id="checkbox-${categoria.nome}">
                                        <label for="checkbox-${categoria.nome}">${categoria.nome}</label>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                        <div class="col-8" id="result-body">
                            <div class="row">
                                <c:if test="${produtos.size() > 0}">
                                    <c:forEach items="produtos" var="produto">
                                        <div class="card col-4 col-lg-3">
                                            <img src="..." class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">${produto.nome}</h5>
                                                <p class="card-text">${produto.descricao}</p>
                                                <a href="./produto?prod=${produto.idProduto}"
                                                    class="btn btn-primary">Adicionar
                                                    ao carrinho</a>
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
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                        crossorigin="anonymous"></script>
            </body>

            </html>