//Endereço
$('#input-cep').mask("00000-000");
$('#input-cpf').mask("000.000.000-00");
const inputCep = document.getElementById("input-cep");
const valorFrete = document.getElementById("valor-frete");
const valorFreteDetalhes = document.getElementById("valores-frete");
const cepAviso = document.getElementById("cep-aviso");
const valorProdutos = document.getElementById("valores-produtos");
const valorTotal = document.getElementById("total");
var valorString = "";
var total = 0;
function atualizarFrete() {
    var frete;
    valorString = valorProdutos.innerHTML.replace(".", "").replace(",", ".").replace("R$", "").replace("&nbsp;", "");
    valorString = valorString.trim();
    var total = parseFloat(valorString);
    if (inputCep.value.length < 9) {
        frete = 0;
        valorFrete.innerText = "R$ " + frete + ",00";
        valorFreteDetalhes.innerText = "R$ " + frete + ",00";
        cepAviso.innerHTML = "Cep inválido!"
    } else {
        frete = 30;
        valorFrete.innerText = "R$ " + frete + ",00";
        valorFreteDetalhes.innerText = "R$ " + frete + ",00";
        cepAviso.innerHTML = '';
        total = total + frete;
    }
    let BRL = new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL',
    });
    valorTotal.innerHTML = BRL.format(total);
}

inputCep.addEventListener("change", () => atualizarFrete())

//Pagamento
$('#cartao-numero').mask("0000.0000.0000.0000");
$('#cartao-data').mask("00/00");
$('#cartao-cvv').mask("000");

$('input[name="radio-pagamento"]').change(function () {
    atualizarAreaPagamento();
})

function atualizarAreaPagamento() {
    var formaPagamento = document.querySelector('input[name="radio-pagamento"]:checked').value;
    switch (formaPagamento) {
        case "PIX":
            $('#area-pix').removeClass("d-none").addClass("d-flex");
            $('#area-cartao').removeClass("d-flex").addClass("d-none");
            break;
        default:
            $('#area-cartao').removeClass("d-none").addClass("d-flex");
            $('#area-pix').removeClass("d-flex").addClass("d-none");
            break;
    }
}

atualizarAreaPagamento();

const cartaoData = document.getElementById("cartao-data");
const avisoData = document.getElementById("data-aviso");
cartaoData.addEventListener("focusout", function () {
    let mes = cartaoData.value.charAt(0) + cartaoData.value.charAt(1);
    let ano = cartaoData.value.charAt(3) + cartaoData.value.charAt(4);
    let mes1 = parseInt(mes.charAt(0));
    let mes2 = parseInt(mes.charAt(1));
    let ano1 = parseInt(ano.charAt(0));
    let ano2 = parseInt(ano.charAt(1));

    if ((((mes1 * 10) + mes2) > 12) || (((mes1 * 10) + mes2) <= 0) || (((ano1 * 10) + ano2) < 24)) {
        cartaoData.style.borderColor = "red";
        avisoData.style.color = "red";
        avisoData.innerHTML = "Data inválida!";
    } else {
        cartaoData.style.borderColor = "black";
        avisoData.style.color = "black";
        avisoData.innerHTML = "";
    }
})