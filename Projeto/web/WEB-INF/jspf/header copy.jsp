<%-- any content can be specified here e.g.: --%>
    <%@ page pageEncoding="UTF-8" %>
        <header class="w-100">
            <div id="div-header" class="align-items-center m-0 h-100 py-2 px-5">
                <div id="header-logo-div" class="">
                    <a href="./home"><img src="./assets/logo-nobg.png" alt="">
                        <p class="ps-2 fs-4 m-0">Maxi</p>
                    </a>
                </div>
                <div id="header-input-div" class="w-60">
                    <form action="search" method="get" class="d-flex branco-fundo flex-row gap-0 g-0 m-0">
                        <div class="w-90">
                            <input type="search" name="s" id="input-search" class="w-100 border-0">
                        </div>
                        <div class="d-flex align-items-center w-10">
                            <button type="submit" id="submit-search"
                                class="header-btn text-dark border-0 w-100 bg-transparent icon">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <div id="header-icones-div">
                    <div class="header-icones">
                        <a href="./carrinho" class="icon"><i class="fa-solid fa-shopping-cart"></i></a>
                    </div>
                    <div class="header-icones" id="header-bars">
                        <button class="icon" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvas"
                            aria-controls="offcanvas">
                            <i class="fa-solid fa-bars"></i>
                        </button>
                    </div>
                    <div class="header-icones">
                        <a href="./perfil" class="icon"> <i class="fa-solid fa-circle-user"></i></a>
                    </div>
                </div>
            </div>
        </header>



        <header>
            <div id="div-header">
                <div id="div-logo">
                    <a href="./home" id="link-home">
                        <div>
                            <img src="./assets/logo-nobg.png" alt="">
                        </div>
                        <div>
                            <span>
                                Maxi
                            </span>
                        </div>
                    </a>
                </div>
                <div id="div-search">
                    <form action="search">
                        <div>
                            <input type="submit" name="s">
                        </div>
                        <div>
                            <button type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <div id="div-icones">
                    <div id="icones-carrinho">
                        <a href="">
                            <i class="fa-solid fa-shopping-cart"></i>
                        </a>
                    </div>
                    <div id="icones-barras">
                        <button type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvas"
                            aria-controls="offcanvas">
                            <i class="fa-solid fa-bars"></i>
                        </button>
                    </div>
                    <div id="icones-perfil">
                        <a href="">
                            <i class="fa-solid fa-circle-user"></i>
                        </a>
                    </div>
                </div>
            </div>
        </header>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvas" aria-labelledby="offcanvasLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasLabel">Menu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" id="close-offcanvas"
                    aria-label="Close"></button><label class="ms-1" for="close-offcanvas">Fechar</label>
            </div>
            <div class="offcanvas-body">
                <div>
                    <p class="fs-5">Atualmente logado como:</br> ${user.nome}</p>
                </div>
            </div>
        </div>