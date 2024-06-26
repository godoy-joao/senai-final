<%-- Document : admin Created on : 04/05/2024, 16:56:23 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" name="viewport"
                        content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
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
                    <link rel="shortcut icon" href="./assets/logo-round.png" type="image/x-icon">
                </head>

                <body class="branco-fundo-2">
                    <%@ include file="/WEB-INF/jspf/header.jspf" %>
                        <div class="overflow-hidden row justify-content-evenly mt-4 mb-2 px-5">
                            <div class="col-3 d-flex justify-content-center align-items-center px-3">
                                <button class="borda-botao-1 w-100 botao" onclick="mostrarAddProduto()">
                                    <p class="my-3 fs-5">Adicionar/editar produto</p>
                                </button>
                            </div>
                            <div class="col-3 d-flex justify-content-center align-items-center px-3">
                                <button class="borda-botao-1 w-100 botao" onclick="mostrarAddCategoria()">
                                    <p class="my-3 fs-5">Adicionar categoria</p>
                                </button>
                            </div>
                            <div class="col-3 d-flex justify-content-center align-items-center px-3">
                                <button class="borda-botao-1 w-100 botao" onclick="mostrarEstoque()">
                                    <p class="my-3 fs-5">Gerenciar estoque</p>
                                </button>
                            </div>
                            <div class="col-3 d-flex justify-content-center align-items-center px-3">
                                <button class="borda-botao-1 w-100 botao" onclick="mostrarPedidos()">
                                    <p class="my-3 fs-5">Exibir Pedidos</p>
                                </button>
                            </div>
                        </div>
                        <div class="row justify-content-center w-100 mb-2" id="produtos">
                            <div class="col-3 justify-content-center">
                                <c:if test="${produtos.size() > 0}">
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
                            <div class="d-flex flex-column p-5 pt-3 w-80 gap-4 branco-fundo" id="addProduto">
                                <p class="h3 w-100 justify-content-start">
                                <form action="addProduto" method="post" enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label for="nome" class="form-label">Nome</label>
                                        <input type="text" class="form-control" name="nome" id="nome"
                                            autocomplete="off">
                                    </div>
                                    <div class="mb-3">
                                        <label for="valor" class="form-label">Valor do produto</label>
                                        <input type="number" step="0.01" class="form-control" id="valor" name="valor"
                                            autocomplete="off">
                                    </div>
                                    <div class="mb-3">
                                        <label for="desconto" class="form-label">Valor do desconto</label>
                                        <input type="number" step="0.01" class="form-control" id="desconto"
                                            name="desconto" autocomplete="off">
                                    </div>
                                    <div class="mb-3">
                                        <label for="imagem" class="form-label">Selecione as imagens</label>
                                        <input type="file" accept="image/*" class="form-control" id="imagem"
                                            name="imagem" multiple>
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
                                            Selecione todas as categorias
                                        </label>
                                        <c:if test="${fn:length(categorias) > 0}">
                                            <select name="selectCategoria" class="form-select" id="selectCategoria"
                                                multiple>
                                                <c:forEach items="${categorias}" var="categoria">
                                                    <option value="${categoria.idCategoria}">${categoria.nome}</option>
                                                </c:forEach>
                                            </select>
                                        </c:if>
                                    </div>
                                    <div class="mb-3">
                                        <label for="quantidade" class="form-label">Quantidade de estoque</label>
                                        <input type="number" class="form-control" id="quantidade" name="quantidade"
                                            autocomplete="off">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Cadastrar</button>
                                </form>
                            </div>
                            <div class="d-none flex-column p-5 pt-3 w-80 gap-4 branco-fundo" id="addCategoria">
                                <p class="h3 w-100 justify-content-start">Adicionar categoria</p>
                                <form action="addCategoria" method="post" enctype="multipart/form-data">
                                    <div class="mb-3">
                                        <label for="nomeCategoria" class="form-label">Nome</label>
                                        <input type="text" class="form-control" id="nomeCategoria" name="nomeCategoria"
                                            autocomplete="off">
                                    </div>
                                    <div class="mb-3">
                                        <label for="imagemCategoria" class="form-label">Selecione a imagem da
                                            capa</label>
                                        <input type="file" accept="image/*" class="form-control" id="imagemCategoria"
                                            name="imagemCategoria">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Adicionar</button>
                                </form>
                            </div>
                            <div class="d-none flex-column p-5 pt-3 w-80 gap-4 branco-fundo" id="estoque">
                                <p class="h3 w-100 justify-content-start">
                                    Gerenciar estoque
                                </p>
                                <div class="overflow-y-scroll overflow-x-hidden">
                                    <c:forEach items="${estoques}" var="estoque" varStatus="contagem">
                                        <div class="estoque-box d-flex flex-row">
                                            <div class="estoque-capa">
                                                <img src="data:image/png;base64,${produtos[contagem.index].imagemBase64}"
                                                    alt="">
                                            </div>
                                            <div class="estoque-info">
                                                <div class="estoque-nome">
                                                    <span>${produtos[contagem.index].nome}</span>
                                                </div>
                                                <div class="estoque-quantidade">
                                                    <span>${estoque.quantidade}</span>
                                                </div>
                                                <div class="estoque-custo">
                                                    <div class="custo">
                                                        Valor unidade:
                                                        <fmt:formatNumber type="currency" value="${estoque.custo}" />
                                                    </div>
                                                    <div class="total">
                                                        Valor total de estoque:
                                                        <fmt:formatNumber type="currency"
                                                            value="${estoque.custo * estoque.quantidade}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <div>
                                                    <button onclick="abrirEditar('${estoque.idEstoque}')">

                                                    </button>
                                                </div>
                                                <form action="editarProduto" method="post"
                                                    class="d-none flex-column border" id="confirmarEditar">
                                                    <span class="fs-3">Edição de produto</span>
                                                    <input type="text" name="novoNome"
                                                        placeholder="${produtos[contagem.index].nome}">
                                                    <input type="text" name="novoValor"
                                                        placeholder="Valor atual: ${produtos[contagem.index].valor}">
                                                    <input type="text" name="novoDesconto"
                                                        placeholder="Desconto: ${produtos[contagem.index].desconto}">
                                                    <input type="text" name="novaQtd"
                                                        placeholder="Quantidade: ${estoque.quantidade}">
                                                    <textarea
                                                        name="novaDescricao">${produtos[contagem.index].descricao}</textarea>
                                                    <button value="${estoque.produto}" name="editId" type="submit">
                                                        Confirmar
                                                    </button>
                                                    <button type="button">
                                                        Cancelar
                                                    </button>
                                                </form>
                                                <div>
                                                    <button onclick="abrirExcluir('${estoque.idEstoque}')">
                                                        <i class="fa-solid fa-trash"></i>
                                                    </button>
                                                </div>
                                                <form class="d-none flex-column border" id="confirmarExcluir"
                                                    method="post" action="excluirProduto">
                                                    <div class="d-flex justify-content-center align-items-center h-70">
                                                        <span>
                                                            Tem certeza que deseja excluir o produto?
                                                        </span>
                                                    </div>
                                                    <div class="d-flex flex-row justify-content-center border h-30">
                                                        <button type="submit" value="${estoque.produto}">
                                                            Excluir
                                                        </button>
                                                        <button type="button">
                                                            Cancelar
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div id="pedidos" class="d-none flex-column p-5 pt-3 w-80 gap-4 branco-fundo">
                                <p class="h3 w-100 justify-content-start">
                                    Histórico de pedidos
                                </p>
                                <div class="w-80 overflow-y-scroll overflow-x-hidden">

                                </div>
                            </div>
                        </main>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                            crossorigin="anonymous"></script>
                        <script src="./js/admin.js"></script>
                </body>

                </html>