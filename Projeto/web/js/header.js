var botao = document.getElementById("mostraCanvas");

botao.addEventListener("click", function (){
    $('offcanvas-backdrop').click(function(){
        var elemento = $(this);
        elemento.remove()      
   });
});
