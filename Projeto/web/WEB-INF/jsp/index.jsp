<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <html>

                <head>
                    <meta http-equiv="Content-Type" name="viewport"
                        content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
                    <title>Home</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                        crossorigin="anonymous">
                    <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
                        crossorigin="anonymous"></script>
                    <link rel="stylesheet" href="./css/index.css">
                    <link rel="stylesheet" href="./css/base.css">
                    <link rel="stylesheet" href="./css/slider.css">
                </head>

                <body class="overflow-x-hidden">

                    <%@ include file="/WEB-INF/jspf/header.jspf" %>
                        <main class="bg-primary pt-5">
                            <div class="px-5">
                                <div class="px-5">
                                    <div id="carroselHeader" class="carousel slide mb-5">
                                        <div class="carousel-indicators">
                                            <button type="button" data-bs-target="#carroselHeader" data-bs-slide-to="0"
                                                class="active" aria-current="true" aria-label="Slide 1"></button>
                                            <button type="button" data-bs-target="#carroselHeader" data-bs-slide-to="1"
                                                class="active" aria-current="true" aria-label="Slide 2"></button>

                                        </div>
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="d-flex justify-content-center">
                                                    <img src="./assets/banner.png" class="" alt="..."
                                                        style="object-fit: cover; max-height: 30vh;">
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="d-flex justify-content-center">
                                                    <img src="./assets/banner.png" class="" alt="..."
                                                        style="object-fit: cover; max-height: 30vh;">
                                                </div>
                                            </div>
                                        </div>
                                        <button class="carousel-control-prev" type="button"
                                            data-bs-target="#carroselHeader" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="">Ant.</span>
                                        </button>
                                        <button class="carousel-control-next" type="button"
                                            data-bs-target="#carroselHeader" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="">Próx.</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div id="produtos-main">
                                <div id="main-container" class="bg-light w-100 h-100">
                                    <div class="container-carrosel">
                                        <p class="h3">Descontos</p>
                                        <div>
                                            <section class="produtos">
                                                <button class="pre-btn"><img src="./assets/arrow.png" alt=""></button>
                                                <button class="nxt-btn"><img src="./assets/arrow.png" alt=""></button>
                                                <div class="produto-container">
                                                    <c:if test="${descontos.size() > 0}">
                                                        <c:forEach items="${descontos}" var="produto">
                                                            <div class="produto-card">
                                                                <div class="produto-imagem">
                                                                    <a href="./produto?id=${produto.idProduto}">
                                                                        <span class="tag-desconto">
                                                                            -
                                                                            <fmt:formatNumber type="currency"
                                                                                value="${produto.desconto}" />
                                                                        </span>
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
                                                                    <div class="div-valor">
                                                                        <span class="valor">
                                                                            <c:if
                                                                                test="${produto.valor != produto.valorFinal}">
                                                                                <fmt:formatNumber type="currency"
                                                                                    value="${produto.valor}" />
                                                                            </c:if>
                                                                        </span>
                                                                        <span class="preco laranja-texto-3">
                                                                            <fmt:formatNumber type="currency"
                                                                                value="${produto.valorFinal}" />
                                                                        </span>
                                                                    </div>
                                                                    <div class="div-btn">
                                                                        <form action="enviarParaCarrinho" method="post"
                                                                            class="w-100 h-100 d-flex align-items-center justify-content-center">
                                                                            <button type="submit"
                                                                                value="${produto.idProduto}"
                                                                                name="item"
                                                                                class="card-btn verde-fundo fs-6">
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
                                            </section>
                                        </div>
                                    </div>
                                    <div class="container-carrosel">
                                        <p class="h3">Novidades</p>
                                        <div>
                                            <section class="produtos">
                                                <button class="pre-btn"><img src="./assets/arrow.png" alt=""></button>
                                                <button class="nxt-btn"><img src="./assets/arrow.png" alt=""></button>
                                                <div class="produto-container">
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
                                                                    <div class="div-valor">
                                                                        <span class="valor">
                                                                            <c:if
                                                                                test="${produto.valor != produto.valorFinal}">
                                                                                <fmt:formatNumber type="currency"
                                                                                    value="${produto.valor}" />
                                                                            </c:if>
                                                                        </span>
                                                                        <span class="preco laranja-texto-3">
                                                                            <fmt:formatNumber type="currency"
                                                                                value="${produto.valorFinal}" />
                                                                        </span>
                                                                    </div>
                                                                    <div class="div-btn">
                                                                        <form action="enviarParaCarrinho" method="post"
                                                                            class="w-100 h-100 d-flex align-items-center justify-content-center">
                                                                            <button type="submit"
                                                                                value="${produto.idProduto}"
                                                                                name="item"
                                                                                class="card-btn verde-fundo fs-6">
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
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <%@ include file="/WEB-INF/jspf/footer.jspf" %>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                                crossorigin="anonymous"></script>
                            <script src="./js/slider.js"></script>
                </body>

                </html>