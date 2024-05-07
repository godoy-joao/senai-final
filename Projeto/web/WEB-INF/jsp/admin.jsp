<%-- Document : admin Created on : 04/05/2024, 16:56:23 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Admin</title>
            </head>

            <body>
                <header>
                    <div id="div-header" class="d-flex justify-content-center py-2">
                        <div class="vw-100 row px-lg-5 px-sm-3 justify-content-center">
                            <div class="col-2 m-auto">
                                <div class="d-flex justify-content-center">
                                    <a href="./home?u=${usuario}" class="text-black text-decoration-none"
                                        style="font-size: 1.5rem;">
                                        <p class="m-0">Aqui terá a logo</p>
                                    </a>
                                </div>
                            </div>
                            <div class="col-6 col-sm-5 m-auto">
                                <form action="search" method="get" id="searchWrapper"
                                    class="addShadow w-100 rounded rounded-pill row justify-content-evenly px-2">
                                    <div id="searchInputDiv" class="col-10 col-sm-11 ps-1 px-0">
                                        <input class="w-100 border-0 bg-transparent ps-0 fs-5" type="search"
                                            name="search" id="searchInput">
                                    </div>
                                    <div id="searchButtonDiv" class="col-2 col-sm-1 px-0 d-flex align-items-center">
                                        <button type="submit" class="h-100 bg-transparent border-0 w-100">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-4 col-sm-3 m-auto align-items-center justify-content-center d-flex">
                                <div class="row w-75 justify-content-between">
                                    <div class="col-3 g-0 d-flex justify-content-center align-items-center mx-sm-1">
                                        <a href="./carrinho?u=${usuario}" class="text-black fs-4"><i
                                                class="fa-solid fa-shopping-cart"></i></a>
                                    </div>
                                    <div class="col-3 p-0 mx-sm-1 d-flex justify-content-center">
                                        <button class="btn bg-transparent py-0" type="button" data-bs-toggle="offcanvas"
                                            data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                                            <p class="text-black mb-0 fs-4">
                                                <i class="fa-solid fa-bars"></i>
                                            </p>
                                        </button>
                                    </div>
                                    <div
                                        class="col-3 g-0 d-flex align-items-center mx-sm-1 d-flex justify-content-center">
                                        <a href="./perfil?u=${usuario}" class="fs-4 text-black"><i
                                                class="fa-solid fa-circle-user"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="div-nav" class="row justify-content-evenly px-2">
                    </div>
                </header>
                <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample"
                    aria-labelledby="offcanvasExampleLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasExampleLabel">Menu</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" id="close-offcanvas"
                            aria-label="Close"></button><label class="ms-1" for="close-offcanvas">Fechar</label>
                    </div>
                    <div class="offcanvas-body">
                        <div>
                            Some text as placeholder. In real life you can have the elements you have chosen. Like,
                            text,
                            images, lists, etc.
                        </div>
                    </div>
                </div>
                <main>
                    <div>
                        <p class="h3">Adicionar produto</p>
                        <form>
                            <div class="mb-3">
                                <label for="nome" class="form-label">Nome</label>
                                <input type="text" class="form-control" id="nome" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="valor" class="form-label">Valor</label>
                                <input type="text" class="form-control" id="valor" name="valor"
                                    aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="desconto" class="form-label">Desconto (se aplicável)</label>
                                <input type="text" class="form-control" id="desconto" name="desconto"
                                    aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="imagem" class="form-label">Selecione a imagem do produto</label>
                                <input type="file" accept="image/*" class="form-control" id="imagem" name="imagem"
                                    aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="descricao" class="form-label">Descrição do produto</label>
                                <textarea class="form-control" id="descricao"
                                    aria-describedby="descricaoHelp"></textarea>
                                <div id="descricaoHelp" class="form-text">
                                    Máximo de caracteres: 2000.
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="selectCategoria">
                                    Categoria:
                                </label>
                                <select name="selectCategoria" class="form-select" id="selectCategoria">
                                    <c:forEach items="categorias" var="categoria">
                                        <option value="${categoria.idCategoria}">${categoria.nome}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                    <div>
                        <p class="h3">Adicionar categoria</p>
                        <form>
                            <div class="mb-3">
                                <label for="nomeCategoria" class="form-label">Nome</label>
                                <input type="text" class="form-control" id="nomeCategoria">
                            </div>
                            <button type="submit" class="btn btn-primary">Adicionar</button>
                        </form>
                    </div>
                    <div>

                    </div>
                </main>
            </body>

            </html>