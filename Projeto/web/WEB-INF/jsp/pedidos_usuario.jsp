<%-- Document : historico_pedidos Created on : 19/05/2024, 12:22:25 Author : João Guilherme --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" name="viewport" content="text/html, charset=UTF-8">
            <title>Histórico de pedidos</title>
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
                    <div>
                        <div id="historico-header">
                            <span class="h-3">Histórico de pedidos</span>
                        </div>
                        <div id="historico-body">
                            <div class="pedido-box">
                                <c:forEach items="${pedidos}" var="pedido">
                                    <button class="w-100 h-100 d-flex flex-row">
                                        <div class="w-100 h-100 d-none btnHover">
                                            <span>Clique para ver mais detalhes</span>
                                        </div>
                                        <div class="div-info">
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
                                                        ${qtdItens[contagem.index]}
                                                    </span>
                                                </div>
                                                <div>
                                                    <span>
                                                        Valor total do pedido:
                                                    </span>
                                                    <span>
                                                        ${pedido.valorTotal}
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
                                                            ${enderecos[contagem.index].estado}
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <span>
                                                            Cidade
                                                        </span>
                                                        <span>
                                                            ${enderecos[contagem.index].cidade}
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <span>
                                                            CEP:
                                                        </span>
                                                        <span>
                                                            ${enderecos[contagem.index].cep}
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="endereco-esquerda">
                                                    <div>
                                                        <span>
                                                            Bairro:
                                                        </span>
                                                        <span>
                                                            ${enderecos[contagem.index].bairro}
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <span>
                                                            Rua:
                                                        </span>
                                                        <span>
                                                            ${enderecos[contagem.index].rua}
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <span>
                                                            Número:
                                                        </span>
                                                        <span>
                                                            ${enderecos[contagem.index].numero}
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <span>
                                                            Complemento:
                                                        </span>
                                                        <span>
                                                            ${enderecos[contagem.index].complemento}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </main>
                <%@ include file="/WEB-INF/jspf/footer.jspf" %>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                        crossorigin="anonymous"></script>
        </body>

        </html>