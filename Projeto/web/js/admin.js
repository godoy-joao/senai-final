
var addProduto = document.getElementById("addProduto");
var addCategoria = document.getElementById("addCategoria");

function mostrarAddProduto() {
    $("#addCategoria").removeClass('d-flex').addClass('d-none');
    $("#addProduto").removeClass('d-none').addClass('d-flex');
    $("#estoque").removeClass('d-flex').addClass('d-none');
    $("#pedidos").removeClass('d-flex').addClass('d-none');
    $("#produtos").removeClass('d-none');
}

function mostrarAddCategoria() {
    $("#addProduto").removeClass('d-flex').addClass('d-none');
    $("#addCategoria").removeClass('d-none').addClass('d-flex');
    $("#estoque").removeClass('d-flex').addClass('d-none');
    $("#pedidos").removeClass('d-flex').addClass('d-none');
    $("#produtos").addClass('d-none');
}

function mostrarEstoque() {
    $("#addProduto").removeClass('d-flex').addClass('d-none');
    $("#addCategoria").removeClass('d-flex').addClass('d-none');
    $("#estoque").removeClass('d-none').addClass('d-flex');
    $("#pedidos").removeClass('d-flex').addClass('d-none');
    $("#produtos").addClass('d-none');
}

function mostrarPedidos() {
    $("#addProduto").removeClass('d-flex').addClass('d-none');
    $("#addCategoria").removeClass('d-flex').addClass('d-none');
    $("#estoque").removeClass('d-flex').addClass('d-none');
    $("#pedidos").removeClass('d-none').addClass('d-flex');
    $("#produtos").addClass('d-none');
}

function abrirEditar(id) {
    
}

function abrirExcluir(id) {

}