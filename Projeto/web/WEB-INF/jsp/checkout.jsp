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
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
                <link rel="shortcut icon" href="./assets/logo-round.png" type="image/x-icon">
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
                                <div id="valores" class="d-flex flex-column w-100">
                                    <div>
                                        Produtos:
                                        <span id="valores-produtos" class="text-start">
                                            <fmt:formatNumber type="currency" value="${totalPedido}" />
                                        </span>
                                    </div>
                                    <div>
                                        Frete:
                                        <span id="valores-frete" class="text-start">
                                            R$ 0,00
                                        </span>
                                    </div>
                                </div>
                                <div id="total-pedido">
                                    Total do pedido:
                                    <span id="total">
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
                                        <div id="endereco-esquerda">
                                            <div id="select-enderecos">
                                                <input type="text" name="idEndereco" id="idEndereco">
                                                <label for="enderecosDoUsuario">
                                                    Selecione um endereço
                                                </label>
                                                <select name="select-endereco" id="enderecosDoUsuario"
                                                    onchange="atualizarCampos()">
                                                    <c:if test="${enderecos.size() > 0}">
                                                        <c:forEach items="${enderecos}" var="endereco"
                                                            varStatus="contagem">
                                                            <option value="${contagem.index}"
                                                                id="option-${contagem.count}"
                                                                data-id="${endereco.idEndereco}"
                                                                data-estado="${endereco.estado}"
                                                                data-cep="${endereco.cep}"
                                                                data-cidade="${endereco.cidade}"
                                                                data-bairro="${endereco.bairro}"
                                                                data-rua="${endereco.rua}"
                                                                data-numero="${endereco.numero}"
                                                                data-complemento="${endereco.complemento}">
                                                                ${contagem.count}.
                                                                ${endereco.rua}, ${endereco.numero}</option>
                                                        </c:forEach>
                                                    </c:if>
                                                    <option value="novo" selected>Adicionar novo</option>
                                                </select>
                                            </div>
                                            <div id="div-select">
                                                <label for="select-estado">
                                                    Estado:
                                                </label>
                                                <select name="select-estado" id="select-estado">
                                                    <option value="AC">Acre</option>
                                                    <option value="AL">Alagoas</option>
                                                    <option value="AP">Amapá</option>
                                                    <option value="AM">Amazonas</option>
                                                    <option value="BA">Bahia</option>
                                                    <option value="CE">Ceará</option>
                                                    <option value="ES">Espírito Santo</option>
                                                    <option value="GO">Goiânia</option>
                                                    <option value="MA">Maranhão</option>
                                                    <option value="MT">Mato Grosso</option>
                                                    <option value="MS">Mato Grosso do Sul</option>
                                                    <option value="MG">Minas Gerais</option>
                                                    <option value="PA">Pará</option>
                                                    <option value="PB">Paraíba</option>
                                                    <option value="PR">Paraná</option>
                                                    <option value="PE">Pernambuco</option>
                                                    <option value="PI">Piauí</option>
                                                    <option value="RJ">Rio de Janeiro</option>
                                                    <option value="RN">Rio Grande do Norte</option>
                                                    <option value="RS">Rio Grande do Sul</option>
                                                    <option value="RO">Rondônia</option>
                                                    <option value="RR">Roraima</option>
                                                    <option value="SC">Santa Catarina</option>
                                                    <option value="SP">São Paulo</option>
                                                    <option value="SE">Sergipe</option>
                                                    <option value="TO">Tocantins</option>
                                                </select>
                                            </div>
                                            <div id="div-cep">
                                                <label for="input-cep">CEP ou Código Postal</label>
                                                <input type="text" id="input-cep" minlength="9" name="endereco-cep"
                                                    placeholder="00000-000" onmouseleave="pesquisarCep">
                                                <span id="cep-aviso" style="color: red; font-size: 0.7rem;">

                                                </span>
                                            </div>
                                            <div id="info-frete">
                                                <span>
                                                    Frete:
                                                </span>
                                                <span id="valor-frete">
                                                    R$0,00
                                                </span>
                                            </div>
                                        </div>
                                        <div id="endereco-direita">
                                            <div>
                                                <label for="input-cidade">Cidade </label>
                                                <input type="text" name="endereco-cidade" id="input-cidade"
                                                    placeholder="Cidade">
                                            </div>
                                            <div>
                                                <label for="input-bairro">Bairro </label>
                                                <input type="text" name="endereco-bairro" id="input-bairro"
                                                    placeholder="Bairro">
                                            </div>
                                            <div>
                                                <label for="input-rua">Rua </label>
                                                <input type="text" name="endereco-rua" id="input-rua" placeholder="Rua">
                                            </div>
                                            <div>
                                                <label for="input-numero">Número (Deixe em branco caso sem número)
                                                </label>
                                                <input type="text" name="endereco-numero" id="input-numero"
                                                    placeholder="1234" maxlength="5">
                                            </div>
                                            <div>
                                                <label for="input-complemento">Complemento </label>
                                                <input type="text" name="endereco-complemento" id="input-complemento"
                                                    placeholder="Ap. 123">
                                            </div>
                                            <div>
                                                <a href="#pagamento">Salvar endereço</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="pagamento">
                                    <div id="pagamento-header">
                                        <span class="fs-3">Forma de pagamento: </span>
                                    </div>
                                    <div id="pagamento-body">
                                        <div id="formas-de-pagamento">
                                            <div class="radio-option fs-4 mb-1 fw-normal">
                                                <input type="radio" value="PIX" name="radio-pagamento"
                                                    class="input-radio" id="" checked>
                                                <span>Pix</span>
                                            </div>
                                            <div class="radio-option fs-4 mb-1 fw-normal">
                                                <input type="radio" value="Visa Crédito" class="input-radio"
                                                    name="radio-pagamento" id="">
                                                <span>Visa Crédito</span>
                                            </div>
                                            <div class="radio-option fs-4 mb-1 fw-normal">
                                                <input type="radio" value="Visa Débito" class="input-radio"
                                                    name="radio-pagamento" id="">
                                                <span>Visa Débito</span>
                                            </div>
                                            <div class="radio-option fs-4 mb-1 fw-normal">
                                                <input type="radio" value="MasterCard Crédito" class="input-radio"
                                                    name="radio-pagamento" id="">
                                                <span>MasterCard Crédito</span>
                                            </div>
                                            <div class="radio-option fs-4 mb-1 fw-normal">
                                                <input type="radio" value="Mastercard Débito" class="input-radio"
                                                    name="radio-pagamento" id="">
                                                <span>Mastercard Débito</span>
                                            </div>
                                        </div>
                                        <div>
                                            <div id="div-cpf">
                                                <c:choose>
                                                    <c:when test="${usuario.cpf == '0'}">
                                                        <span>
                                                            Por favor informe seu CPF:
                                                        </span>
                                                        <input type="text" id="input-cpf" required>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="input-cpf" value="${usuario.cpf}" disabled>
                                                        <c:out value="${usuario.cpf}" />

                                                        
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div id="area-pix" class="d-flex flex-column justify-content-between">
                                                <div>
                                                    <label for="qrcode-pix">Escaneie o QRCode para realizar o pagamento
                                                        e
                                                        concluir seu pedido.</label>
                                                    <img src="" id="qrcode-pix" alt="">
                                                </div>

                                                <div>
                                                    <button class="btn-finalizar" type="submit">
                                                        Finalizar pedido
                                                    </button>
                                                </div>
                                            </div>
                                            <div id="area-cartao"
                                                class="d-none flex-column justify-content-center gap-3">
                                                <div>
                                                    <span class="fs-3">
                                                        Dados do cartão
                                                    </span>
                                                </div>
                                                <div class="div-input d-flex flex-column w-lg-50 w-80 ">
                                                    <label for="cartao-titular">Nome do Titular do cartão</label>
                                                    <input type="text" name="cartao-titular" value=""
                                                        id="cartao-titular" placeholder="Nome E. Exemplo">

                                                </div>
                                                <div class="div-input d-flex flex-column w-lg-50 w-80 ">
                                                    <label for="cartao-numero">Número do cartão</label>
                                                    <input type="text" maxlength="19" minlength="19" value=""
                                                        id="cartao-numero" placeholder="1111.1111.1111.1111">
                                                </div>
                                                <div class="div-input d-flex flex-row w-lg-50 w-80">
                                                    <div id="div-data" class="d-flex flex-column w-50 pe-1">
                                                        <label for="cartao-data">Data de vencimento</label>
                                                        <input type="text" id="cartao-data" minlength="5" value=""
                                                            maxlength="5" placeholder="MM/AA">
                                                        <span id="data-aviso"></span>
                                                    </div>
                                                    <div id="div-cvv" class="d-flex flex-column w-50 ps-1">
                                                        <label for="cartao-cvv">Código de segurança</label>
                                                        <input type="text" id="cartao-cvv" minlength="3" value=""
                                                            maxlength="3" placeholder="000">
                                                    </div>
                                                </div>
                                                <div>
                                                    <button class="btn-finalizar" type="submit">
                                                        Finalizar pedido
                                                    </button>
                                                </div>
                                            </div>
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
                        <script
                            src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
                        <script src="./js/checkout.js"></script>
                        <script>
                            function atualizarCampos() {
                                const selectEndereco = document.getElementById('enderecosDoUsuario');
                                const options = selectEndereco.options;

                                const cidade = document.getElementById('input-cidade');
                                const bairro = document.getElementById('input-bairro');
                                const rua = document.getElementById('input-rua');
                                const numero = document.getElementById('input-numero');
                                const complemento = document.getElementById('input-complemento');
                                const cep = document.getElementById('input-cep');
                                const estado = document.getElementById('select-estado');
                                const cepAviso = document.getElementById('cep-aviso');
                                const idEndereco = document.getElementById('idEndereco');


                                if (selectEndereco.value == 'novo') {
                                    cidade.value = '';
                                    bairro.value = '';
                                    rua.value = '';
                                    numero.value = '';
                                    complemento.value = '';
                                    cep.value = '';
                                } else {
                                    cidade.value = options[selectEndereco.value].getAttribute('data-cidade');
                                    bairro.value = options[selectEndereco.value].getAttribute('data-bairro');
                                    rua.value = options[selectEndereco.value].getAttribute('data-rua');
                                    numero.value = options[selectEndereco.value].getAttribute('data-numero');
                                    complemento.value = options[selectEndereco.value].getAttribute('data-complemento');
                                    cep.value = options[selectEndereco.value].getAttribute('data-cep');
                                    estado.value = options[selectEndereco.value].getAttribute('data-estado');
                                    idEndereco.value = options[selectEndereco.value].getAttribute('data-id');
                                }
                                cep.dispatchEvent(new Event('change'));
                            }
                        </script>
                        <script>
                            const cidade = document.getElementById('input-cidade');
                            const bairro = document.getElementById('input-bairro');
                            const rua = document.getElementById('input-rua');
                            const numero = document.getElementById('input-numero');
                            const complemento = document.getElementById('input-complemento');
                            const cep = document.getElementById('input-cep');
                            const estado = document.getElementById('select-estado');

                            const limparEndereco = () => {
                                cidade.value = '';
                                bairro.value = '';
                                rua.value = '';
                                numero.value = '';
                                complemento.value = '';
                            }

                            const preencherEndereco = (endereco) => {
                                cidade.value = endereco.localidade;
                                bairro.value = endereco.bairro;
                                rua.value = endereco.logradouro;
                                cep.value = endereco.cep;
                                estado.value = endereco.uf;
                            }

                            const pesquisarCep = async () => {
                                limparEndereco();

                                const cepE = cep.value;
                                console.log(cepE);
                                if (cepE.length == 9) {
                                    const dados = await fetch('https://viacep.com.br/ws/' + cepE + '/json/');
                                    const endereco = await dados.json();
                                    if (!endereco.hasOwnProperty('erro')) {
                                        preencherEndereco(endereco);
                                        cepAviso.innerHTML = "";
                                    } else {
                                        cepAviso.innerHTML = "Cep não encontrado!";
                                    }
                                } else {
                                    cepAviso.innerHTML = "Cep não encontrado!";
                                }
                            }

                            cep.addEventListener('focusout', pesquisarCep);
                        </script>
            </body>

            </html>