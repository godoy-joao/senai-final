<%-- Document : historico_pedidos Created on : 19/05/2024, 12:22:25 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@page contentType="text/html" pageEncoding="UTF-8" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" name="viewport"
                        content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
                    <title>Histórico de pedidos</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                        crossorigin="anonymous">
                    <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
                        crossorigin="anonymous"></script>
                    <link rel="stylesheet" href="./css/pedidosUsuario.css">
                    <link rel="stylesheet" href="./css/header.css">
                    <link rel="stylesheet" href="./css/base.css">
                    <link rel="shortcut icon" href="./assets/logo-round.png" type="image/x-icon">
                </head>

                <body>
                    <%@ include file="/WEB-INF/jspf/header.jspf" %>
                        <main>
                            <div id="container">
                                <div id="historico-header">
                                    <span class="h-3 text-center">Histórico de pedidos</span>
                                </div>
                                <div id="historico-body">
                                    <c:forEach items="${pedidos}" var="pedido" varStatus="contagemPedido">
                                        <div class="pedido-wrapper">
                                            <div class="pedido-detalhes d-none flex-column">
                                                <div>
                                                    <div class="detalhes-header">
                                                        <h3>Itens do pedido:</h3>
                                                        <button type="button" class="fechar-detalhes">
                                                            <span>
                                                                <i class="fa-solid fa-xmark"></i>
                                                            </span>
                                                            <span>
                                                                Fechar
                                                            </span>
                                                        </button>
                                                    </div>
                                                    <div class="detalhes-produtos">
                                                        <ul>
                                                            <c:forEach var="item"
                                                                items="${itensDoPedido[contagemPedido.index]}"
                                                                varStatus="contagem">
                                                                <li>
                                                                    <div class="produto-imagem">
                                                                        <img src="data:image/png;base64,${item.imagemBase64}"
                                                                            alt="">
                                                                    </div>
                                                                    <div class="produto-detalhes">
                                                                        <div class="detalhes-nome">
                                                                            <span>
                                                                                ${item.nome}
                                                                            </span>
                                                                        </div>
                                                                        <div class="detalhes-qtd">
                                                                            <span>
                                                                                Quantidade:
                                                                            </span>
                                                                            <span>
                                                                                <c:set var="pp"
                                                                                    value="${produtoPedido[contagemPedido.index]}" />
                                                                                ${pp[contagem.index].quantidade}
                                                                            </span>
                                                                        </div>
                                                                        <div class="detalhes-valor">
                                                                            <span>
                                                                                ${item.valorFinal}
                                                                            </span>
                                                                        </div>
                                                                        <div class="detalhes-total">
                                                                            <span>
                                                                                <c:set var="pp"
                                                                                    value="${produtoPedido[contagemPedido.index]}" />
                                                                                ${pp[contagem.index].quantidade *
                                                                                item.valorFinal}
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pedido-box">

                                                <button class="w-100 h-100 d-flex flex-row border-0 abrir-detalhes">
                                                    <div class="w-100 h-100 btnHover">
                                                        <span>Clique para ver mais detalhes</span>
                                                    </div>
                                                    <div class="div-info">
                                                        <div class="div-img">
                                                            <img src="data:image/png;base64,${imagens[contagemPedido.index]}"
                                                                alt="">
                                                        </div>
                                                        <div class="info-detalhes">
                                                            <div class="div-id">
                                                                <span>
                                                                    Id do pedido:
                                                                </span>
                                                                <span>
                                                                    ${pedido.idPedido}
                                                                </span>
                                                            </div>
                                                            <div>
                                                                <span>
                                                                    Quantidade de itens:
                                                                </span>
                                                                <span>
                                                                    ${qtdItens[contagemPedido.index]}
                                                                </span>
                                                            </div>
                                                            <div>
                                                                <span>
                                                                    Valor total do pedido:
                                                                </span>
                                                                <span>
                                                                    <fmt:formatNumber type="currency"
                                                                        value="${pedido.valorTotal}" />
                                                                </span>
                                                            </div>
                                                            <div>
                                                                <span>
                                                                    Status:
                                                                </span>
                                                                <span>
                                                                    ${statusPedido[contagemPedido.index]}
                                                                </span>
                                                            </div>
                                                            <div>
                                                                <span>
                                                                    Forma de pagamento:
                                                                </span>
                                                                <span>
                                                                    ${pedido.formaPagamento}
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="info-endereco">
                                                            <div class="endereco-esquerda">
                                                                <div>
                                                                    <span>
                                                                        Estado:
                                                                    </span>
                                                                    <span>
                                                                        ${enderecos[contagemPedido.index].estado}
                                                                    </span>
                                                                </div>
                                                                <div>
                                                                    <span>
                                                                        Cidade
                                                                    </span>
                                                                    <span>
                                                                        ${enderecos[contagemPedido.index].cidade}
                                                                    </span>
                                                                </div>
                                                                <div>
                                                                    <span>
                                                                        CEP:
                                                                    </span>
                                                                    <span>
                                                                        ${enderecos[contagemPedido.index].cep}
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="endereco-esquerda">
                                                                <div>
                                                                    <span>
                                                                        Bairro:
                                                                    </span>
                                                                    <span>
                                                                        ${enderecos[contagemPedido.index].bairro}
                                                                    </span>
                                                                </div>
                                                                <div>
                                                                    <span>
                                                                        Rua:
                                                                    </span>
                                                                    <span>
                                                                        ${enderecos[contagemPedido.index].rua}
                                                                    </span>
                                                                </div>
                                                                <div>
                                                                    <span>
                                                                        Número:
                                                                    </span>
                                                                    <span>
                                                                        ${enderecos[contagemPedido.index].numero}
                                                                    </span>
                                                                </div>
                                                                <div>
                                                                    <span>
                                                                        Complemento:
                                                                    </span>
                                                                    <span>
                                                                        ${enderecos[contagemPedido.index].complemento}
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </button>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </main>
                        <%@ include file="/WEB-INF/jspf/footer.jspf" %>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                                crossorigin="anonymous"></script>
                            <script src="./js/pedidosUsuario.js"></script>
                </body>

                </html>