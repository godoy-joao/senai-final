const ajustadorDeQuantidade = [...document.querySelectorAll('.qtd-form')];
const btnMais = [...document.querySelectorAll('.btn-mais')];
const btnMenos = [...document.querySelectorAll('.btn-menos')];
const inputQtd = [...document.querySelectorAll('.qtd-item')];
const valorUnit = [...document.querySelectorAll('.valor-unit-inner')];
const valorTotal = [...document.querySelectorAll('.valor-final-inner')];
const totalFinal = document.getElementById('header-valor-total');

ajustadorDeQuantidade.forEach((item, i) => {
    btnMais[i].addEventListener('click', () => {
        calcularTotal(i, "mais");
    })

    btnMenos[i].addEventListener('click', () => {
        calcularTotal(i, "menos");
    })

})

function calcularTotal(i, operador) {
    let BRL = new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL',
    });

    let qtd = 0;
    let total = 0;
    let valorFinal = 0;
    ajustadorDeQuantidade.forEach((item, it) => {
        qtd += parseInt(inputQtd[it].value, 10);
    })


    if (operador === "mais" && qtd < 10) {
        if (inputQtd[i].value < 10) {
            inputQtd[i].value = parseInt(inputQtd[i].value) + 1;
        }
        let valorString = valorUnit[i].innerHTML.replace(".", "").replace(",", ".").replace("R$", "");
        valorString = valorString.trim();
        total = parseFloat(valorString);
        total = (total * parseInt(inputQtd[i].value));
        valorTotal[i].innerHTML = BRL.format(total);
        atualizarValorTotal()
    }
    if (operador === "menos" && qtd > 0) {
        if (inputQtd[i].value > 0) {
            inputQtd[i].value -= 1;
        }
        let valorString = valorUnit[i].innerHTML.replace(".", "").replace(",", ".").replace("R$", "");
        valorString = valorString.trim();
        total = parseFloat(valorString);
        total = (total * parseInt(inputQtd[i].value));
        valorTotal[i].innerHTML = BRL.format(total);
        atualizarValorTotal()
    }
}

function atualizarValorTotal() {
    let BRL = new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL',
    });
    let total = 0;
    ajustadorDeQuantidade.forEach((item, i) => {
        let valorString = valorTotal[i].innerHTML.replace(".", "").replace(",", ".").replace("R$", "").replace("&nbsp;", "");
        valorString = valorString.trim();
        total += parseFloat(valorString);

    })
    totalFinal.innerHTML = BRL.format(total);
}