var tipoInput = document.getElementsByName("option");
var inputLogin = document.getElementById("login");

tipoInput[0].addEventListener("click", function () {
    inputLogin.setAttribute("type", "email");
    $("#login").val('');
    $("#login").unmask();
    console.log(tipoInput[1].value)

});
tipoInput[1].addEventListener("click", function () {
    inputLogin.setAttribute("type", "tel");
    $("#login").val('');
    $("#login").mask('(00) 00000-0000');
});

function goToLogin() {
    $("#contCadastro").removeClass('d-flex').addClass('d-none');
    $("#contLogin").removeClass('d-none').addClass('d-flex');
}
function goToSignup() {
    $("#contLogin").removeClass('d-flex').addClass('d-none');
    $("#contCadastro").removeClass('d-none').addClass('d-flex');
}

