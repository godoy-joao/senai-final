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

const formLogin = document.getElementById("loginForm");
const formCadastro = document.getElementById("signupForm");

formLogin.addEventListener("submit", function (event) {
    event.preventDefault();

    const login = document.getElementById("login").value.trim();
    const senha = document.getElementById("senhaLogin").value.trim();
    
    if (login === "" || senha === "") {
        alert("Usuário ou senha não podem estar vazios!");
    } else {
        formLogin.submit();
    }
})

formCadastro.addEventListener("submit", function(event) {

})

