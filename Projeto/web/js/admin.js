var escolhaTela = document.getElementById("escolhaTela");
var addProduto = document.getElementById("addProduto");
var addCategoria = document.getElementById("addCategoria");

function showAddProduto() {
    $("#addCategoria").removeClass('d-flex').addClass('d-none');
    $("#addProduto").removeClass('d-none').addClass('d-flex');
}

function showAddCategoria() {
    $("#addProduto").removeClass('d-flex').addClass('d-none');
    $("#addCategoria").removeClass('d-none').addClass('d-flex');
}

escolhaTela.addEventListener("change", function () {
    switch (escolhaTela.value) {
        case '1':
            showAddProduto();
            break;
        case '2':
            showAddCategoria();
            break;
    }
})