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
                                    <a href="./home" class="text-black text-decoration-none">
                                        <p class="m-0">Aqui terá a logo</p>
                                    </a>
                                </div>
                            </div>
                            <div class="col-6 col-sm-5 m-auto">
                                <div id="searchWrapper" class="w-100 row rounded rounded-pill">
                                    <div id="searchInputDiv" class="col-11 px-0">
                                        <input class="w-100 border-0 bg-transparent ps-2" type="search" name="search"
                                            id="searchInput">
                                    </div>
                                    <div id="searchButtonDiv" class="col-1 px-0 d-flex align-items-center">
                                        <a href="./search" class="text-black w-100 d-flex justify-content-center"
                                            style="font-size: 1.3rem;"><i class="fa-solid fa-magnifying-glass"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 col-sm-3 m-auto align-items-center justify-content-end d-flex">
                                <div class="row ">
                                    <div class="col-3 d-flex align-items-center">
                                        <a href="./carrinho" class="text-black" style="font-size: 1.3rem;"><i
                                                class="fa-solid fa-shopping-cart"></i></a>
                                    </div>
                                    <div class="col-3 mx-sm-1">
                                        <button class="btn bg-transparent border-0 d-flex align-items-center"
                                            type="button" data-bs-toggle="offcanvas" data-bs-target="#menuLateral"
                                            aria-controls="menuLateral">
                                            <p class="text-black mb-0" style="font-size: 1.3rem;">
                                                <i class="fa-solid fa-bars"></i>
                                            </p>
                                        </button>
                                    </div>
                                    <div class="col-3 d-flex align-items-center mx-sm-1">
                                        <a href="./perfil" class="text-black" style="font-size: 1.3rem;"><i
                                                class="fa-solid fa-circle-user"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
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