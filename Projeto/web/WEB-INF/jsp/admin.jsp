<%-- Document : admin Created on : 04/05/2024, 16:56:23 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8">
                    <title>Admin</title>
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
                </head>

                <body class="branco-fundo-2">
                    <%@ include file="/WEB-INF/jspf/header.jspf" %>
                    <div class="overflow-hidden row gap-4 justify-content-evenly mt-4 mb-2">
                        <div class="col-3 d-flex justify-content-center align-items-center">
                            <button class="borda-botao-1 w-100 botao" onclick="showAddProduto()">
                                <p class="my-3 fs-5">Adicionar/editar produto</p>
                            </button>
                        </div>
                        <div class="col-3 d-flex justify-content-center align-items-center">
                            <button class="borda-botao-1 w-100 botao" onclick="showAddCategoria()">
                                <p class="my-3 fs-5">Adicionar categoria</p>
                            </button>
                        </div>
                        <div class="col-3 d-flex justify-content-center align-items-center">
                            <button class="borda-botao-1 w-100 botao" onclick="showEstoque()">
                                <p class="my-3 fs-5">Gerenciar estoque</p>
                            </button>
                        </div>
                    </div>
                    <div class="row justify-content-start mb-2">
                        <div class="col-3 justify-content-center">
                            <c:if test="${fn:length(produtos) > 0}">
                                <select name="produtoSelecionado" id="selectProduto">
                                    <c:forEach items="${produtos}" var="produto">
                                        <option value="${produto.idProduto}">
                                            ${produto.idProduto}. ${produto.nome}
                                        </option>
                                    </c:forEach>
                                </select>
                            </c:if>
                        </div>
                    </div>
                    <main class="mx-5 mt-4 d-flex justify-content-center ">
                        <div class="w-80 p-4 d-flex flex-column branco-fundo" id="addProduto">
                            <p class="h3">Adicionar produto</p>
                            <form action="addProduto" method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="nome" class="form-label">Nome</label>
                                    <input type="text" class="form-control" name="nome" id="nome" autocomplete="off">
                                </div>
                                <div class="mb-3">
                                    <label for="valor" class="form-label">Valor</label>
                                    <input type="number" step="0.01" class="form-control" id="valor" name="valor"
                                        autocomplete="off">
                                </div>
                                <div class="mb-3">
                                    <label for="desconto" class="form-label">Desconto (se aplicável)</label>
                                    <input type="number" step="0.01" class="form-control" id="desconto" name="desconto"
                                        autocomplete="off">
                                </div>
                                <div class="mb-3">
                                    <label for="imagem" class="form-label">Selecione a imagem do produto</label>
                                    <input type="file" accept="image/*" class="form-control" id="imagem" name="imagem" multiple>
                                </div>
                                <div class="mb-3">
                                    <label for="descricao" class="form-label">Descrição do produto</label>
                                    <textarea class="form-control" id="descricao" aria-describedby="descricaoHelp"
                                        name="descricao" autocomplete="off"></textarea>
                                    <div id="descricaoHelp" class="form-text">
                                        Máximo de caracteres: 2000.
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="selectCategoria">
                                        Categorias:
                                    </label>
                                    <c:if test="${fn:length(categorias) > 0}">
                                        <select name="selectCategoria" class="form-select" id="selectCategoria" multiple>
                                            <c:forEach items="${categorias}" var="categoria">
                                                <option value="${categoria.idCategoria}">${categoria.nome}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                </div>
                                <div class="mb-3">
                                    <label for="quantidade" class="form-label">Quantidade</label>
                                    <input type="number" class="form-control" id="quantidade" name="quantidade"
                                        autocomplete="off">
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                        <div class="d-none flex-column w-50" id="addCategoria">
                            <p class="h3">Adicionar categoria</p>
                            <form action="addCategoria" method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="nomeCategoria" class="form-label">Nome</label>
                                    <input type="text" class="form-control" id="nomeCategoria" name="nomeCategoria"
                                        autocomplete="off">
                                </div>
                                <div class="mb-3">
                                    <label for="imagemCategoria" class="form-label">Selecione a imagem da capa</label>
                                    <input type="file" accept="image/*" class="form-control" id="imagemCategoria" name="imagemCategoria" >
                                </div>
                                <button type="submit" class="btn btn-primary">Adicionar</button>
                            </form>
                        </div>
                        <div>

                        </div>
                    </main>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                        crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                        crossorigin="anonymous"></script>
                    <script src="./js/admin.js"></script>
                </body>

                </html>