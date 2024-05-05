var tipoInput = document.getElementsByName("loginOption");
var inputLogin = document.getElementById("loginUser");
$("#telefone").mask('(00) 00000-0000');
tipoInput[0].addEventListener("click", function () {
    inputLogin.setAttribute("type", "email");
    $("#loginUser").val('');
    $("#loginUser").unmask();
});
tipoInput[1].addEventListener("click", function () {
    inputLogin.setAttribute("type", "tel");
    $("#loginUser").val('');
    $("#loginUser").mask('(00) 00000-0000');
});

function goToLogin() {
    $("#formSignupWrapper").removeClass('d-flex').addClass('d-none');
    $("#formLoginWrapper").removeClass('d-none').addClass('d-flex');
}
function goToSignup() {
    $("#formLoginWrapper").removeClass('d-flex').addClass('d-none');
    $("#formSignupWrapper").removeClass('d-none').addClass('d-flex');
    var dataNasc = document.getElementById("dataNascimento");
    const now = new Date();
    var dataMax = now.getFullYear() + "-" + now.getMonth() + "-" + now.getDate();
    var dataMin = (now.getFullYear() - 100) + "-" + now.getMonth() + "-" + now.getDate();
    dataNasc.setAttribute("max", dataMax);
    dataNasc.setAttribute("min", dataMin);
}

const formLogin = document.getElementById("formLoginWrapper");
const formCadastro = document.getElementById("formSignupWrapper");

formLogin.addEventListener("submit", function (event) {
   

    const login = document.getElementById("loginUser").value.trim();
    const senha = document.getElementById("loginPass").value.trim();

    if (login === "" || senha === "") {
        event.preventDefault();
        alert("Usuário ou senha não podem estar vazios!");
    } else {
    }
})

formCadastro.addEventListener("submit", function (event) {
    

    const nome = document.getElementById("nome").value.trim();
    const email = document.getElementById("email").value.trim();
    const telefone = document.getElementById("telefone").value.trim();
    const senha = document.getElementById("senha").value.trim();
    const confirmaSenha = document.getElementById("confirmaSenha").value.trim();

    if (nome === "" || email === "" || telefone === "" || senha === "" || confirmaSenha === "") {
        alert("Todos os campos devem ser corretamente preenchidos!");
        event.preventDefault();
    } else {
        const avisoSenha = document.getElementById("passHelper");
        if (confirmaSenha != senha) {
            avisoSenha.innerText = "As senhas não coincidem!";
            event.preventDefault();
        } else {
            avisoSenha.style.color = "red";
            avisoSenha.innerText = "";
            formCadastro.submit();
        }
    }

})

