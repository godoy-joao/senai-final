const productContainers = [...document.querySelectorAll('.produto-container')];
const nxtBtn = [...document.querySelectorAll('.nxt-btn')];
const preBtn = [...document.querySelectorAll('.pre-btn')];

productContainers.forEach((item, i) => {
    let containerDimensions = item.getBoundingClientRect();
    let containerWidth = containerDimensions.width;

    nxtBtn[i].addEventListener('click', () => {
        item.scrollLeft += 3*(containerWidth/4);
    })

    preBtn[i].addEventListener('click', () => {
        item.scrollLeft -= 3*(containerWidth/4);
    })
})