<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>

            <head>
                <meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8">
                <title>Home</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <link rel="stylesheet" href="./css/index.css">
                <link rel="stylesheet" href="./css/header.css">
                <link rel="stylesheet" href="./css/base.css">
            </head>
            <body>
                <%@ include file="/WEB-INF/jspf/header.jspf" %>
                    <main>
                        <div class="bg-primary px-5">
                            <div class="px-5">
                                <div id="carroselHeader" class="carousel slide">
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
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carroselHeader"
                                        data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="">Ant.</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carroselHeader"
                                        data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="">Próx.</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div id="produtos-main" class="bg-primary vh-100">
                            <div class="bg-light w-100 h-100 p-5">
                                <div class="">
                                    <p class="h3">Descontos</p>
                                    <div>
                                        <div id="carroselProdutos${categoria.idCategoria}" class="carousel carousel-dark">
                                            <div class="carousel-indicators">
                                                <c:forEach items="${descontos}" var="temp" varStatus="counting">
                                                    <button type="button"
                                                    data-bs-target="#carroselProdutos${categoria.idCategoria}"
                                                    data-bs-slide-to="${counting.index}" class="active" aria-current="true"
                                                    aria-label="Slide 1">
                                                </button>
                                                </c:forEach>
                                                
                                            </div>
                                            <div class="carousel-inner">
                                                <div class="carousel-item">
                                                    <c:forEach items="${descontos}" var="produtoD">
                                                        <div class="card" style="width: 15vw;">
                                                            <img src="data:image/png;base64,${produtoD.imagemBase64}"
                                                                class="card-img-top" alt="...">
                                                            <div class="card-body">
                                                                <p class="card-title h5">${produto.nome}</p>
                                                                <p class="card-text">${produto.descricao}</p>
                                                                <a href="./produto?id=${produto.idProduto}"
                                                                    class="btn">Deixe-me ver</a>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <button class="carousel-control-prev" type="button"
                                                data-bs-target="#carroselProdutos${categoria.idCategoria}"
                                                data-bs-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="false"></span>
                                                <span class="">Ant.</span>
                                            </button>
                                            <button class="carousel-control-next" type="button"
                                                data-bs-target="#carroselProdutos${categoria.idCategoria}"
                                                data-bs-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="false"></span>
                                                <span class="">Próx.</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
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