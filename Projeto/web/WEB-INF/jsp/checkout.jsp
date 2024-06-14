<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <html lang="en">

            <head>
                <meta http-equiv="Content-Type" name="viewport"
                    content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
                <title>Checkout</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
                <link rel="stylesheet" href="./css/checkout.css">
                <link rel="stylesheet" href="./css/base.css">
            </head>

            <body>
                <%@ include file="/WEB-INF/jspf/header.jspf" %>
                    <main>
                        <div id="detalhes-pedido">
                            <div id="detalhes-header">
                                <span class="fs-3">Itens do pedido:</span>
                            </div>
                            <div id="detalhes-body">
                                <c:forEach items="${produtos}" var="produto" varStatus="contagem">
                                    <div class="produto-container">
                                        <div class="produto-imagem">
                                            <img src="data:image/png;base64,${produto.imagemBase64}" alt="">
                                        </div>
                                        <div class="produto-detalhes">
                                            <div class="detalhes-nome">
                                                <span>
                                                    ${produto.nome}
                                                </span>
                                            </div>
                                            <div class="detalhes-qtd">
                                                <span>
                                                    Quantidade:
                                                </span>
                                                <span>
                                                    ${cartProd[contagem.index].quantidade}
                                                </span>
                                            </div>
                                            <div class="detalhes-total">
                                                <span>
                                                    <fmt:formatNumber type="currency"
                                                        value="${produto.valorFinal * cartProd[contagem.index].quantidade}" />
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div id="detalhes-footer">
                                <div id="total-pedido">
                                    Total do pedido:
                                    <span>
                                        <fmt:formatNumber type="currency" value="${totalPedido}" />
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div id="preenchimento">
                            <form action="concluirPedido" method="post">
                                <div id="endereco">
                                    <div id="endereco-header">
                                        <span class="fs-3">Endereço de entrega: </span>
                                    </div>
                                    <div id="endereco-body">
                                        <div>
                                            <!--
                                            estado
                                            cep
                                            frete
                                        -->
                                        </div>
                                        <div>
                                            <!--
                                            cidade
                                            bairro
                                            rua
                                            numero
                                            complemento
                                        -->
                                        </div>
                                    </div>
                                </div>
                                <div id="pagamento">
                                    <div id="pagamento-header">
                                        <span class="fs-3">Forma de pagamento: </span>
                                    </div>
                                    <div id="pagamento-body">
                                        <div id="formas-de-pagamento">
                                            <div>
                                                <select name="" id="">
                                                    <option value="PIX">Pix</option>
                                                    <option value="VC">Visa Crédito</option>
                                                    <option value="VD">Visa Débito</option>
                                                    <option value="MC">MasterCard Crédito</option>
                                                    <option value="MD">MasterCard Débito</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div id="area-pix">

                                        </div>
                                        <div id="area-cartao">

                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </main>
                    <%@ include file="/WEB-INF/jspf/footer.jspf" %>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                            crossorigin="anonymous"></script>

            </body>

            </html>