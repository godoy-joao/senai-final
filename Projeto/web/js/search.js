const precoRange = [...document.querySelectorAll('.preco-range')];
const precoValue = [...document.querySelectorAll('.range-value')];

precoRange.forEach((item, i) => {

    precoRange[i].addEventListener('input', function () {
        precoValue[i].value = precoRange[i].value;
    })

    precoValue[i].addEventListener('mouseleave', function () {
        precoRange[i].value = precoValue[i].value;
    })

})