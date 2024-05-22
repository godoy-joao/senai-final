$('#input-updTel').mask('(00) 00000-0000');
function actvEmail() {
    $('#submitEmail').removeClass('d-none').addClass('d-block');
    $('#input-updEmail').prop('disabled', false);
}
function actvTel() {
    $('#submitTel').removeClass('d-none').addClass('d-block');
    $('#input-updTel').prop('disabled', false);
}
function actvSenha() {
    $('#submitSenha').removeClass('d-none').addClass('d-block');
    $('#input-updSenha').prop('disabled', false);
}

function showEditImg() {
    $('#div-updImg').removeClass('d-none').addClass('d-flex');
}

function hideEditImg() {
    $('#div-updImg').removeClass('d-flex').addClass('d-none')
}