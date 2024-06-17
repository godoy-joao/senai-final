//Endereço
$('#input-cep').mask("00000-000");
const inputCep = document.getElementById("input-cep");
const valorFrete = document.getElementById("valor-frete");

inputCep.addEventListener("change", function () {
    valorFrete.innerText = "R$30,00";
})

//Pagamento
$('#cartao-numero').mask("0000.0000.0000.0000");
$('#cartao-data').mask("00/00");
$('#cartao-cvv').mask("000");

const cartaoData = document.getElementById("cartao-data");
const avisoData = document.getElementById("data-aviso");
cartaoData.addEventListener("focusout", function () {
    let mes = cartaoData.value.charAt(0) + cartaoData.value.charAt(1);
    let ano = cartaoData.value.charAt(3) + cartaoData.value.charAt(4);
    let mes1 = parseInt(mes.charAt(0));
    let mes2 = parseInt(mes.charAt(1));
    let ano1 = parseInt(ano.charAt(0));
    let ano2 = parseInt(ano.charAt(1));

    if ((((mes1*10) + mes2) > 12) || (((mes1*10) + mes2) <= 0) || (((ano1*10) + ano2) < 24)) {
        cartaoData.style.borderColor = "red";
        avisoData.style.color = "red";
        avisoData.innerHTML = "Data inválida!";
    } else {
        cartaoData.style.borderColor = "black";
        avisoData.style.color = "black";
        avisoData.innerHTML = "";
    }
});