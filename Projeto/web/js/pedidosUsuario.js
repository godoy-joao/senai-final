const pedidos = [...document.querySelectorAll('.pedido-box')];
const detalhes = [...document.querySelectorAll('.pedido-detalhes')];
const fecharDetalhes = [...document.querySelectorAll('.fechar-detalhes')];
const mostrarDetalhes = [...document.querySelectorAll('.abrir-detalhes')];

pedidos.forEach((_, i) => {

    mostrarDetalhes[i].addEventListener('click', function () {
        detalhes[i].classList.remove('d-none');
        detalhes[i].classList.add('d-flex');
    })

    fecharDetalhes[i].addEventListener('click', function () {
        detalhes[i].classList.remove('d-flex');
        detalhes[i].classList.add('d-none');
    })

})



