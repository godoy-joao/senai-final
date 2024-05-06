<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Home</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="./css/index.css">
        </head>

        <body>
            <header>
                <div id="div-header" class="d-flex justify-content-center py-2">
                    <div class="vw-100 row px-lg-5 px-sm-3 justify-content-center">
                        <div class="col-2 m-auto">
                            <div class="d-flex justify-content-center">
                                <a href="./home" class="text-black text-decoration-none" style="font-size: 1.5rem;">
                                    <p class="m-0">Aqui terá a logo</p>
                                </a>
                            </div>
                        </div>
                        <div class="col-6 col-sm-5 m-auto">
                            <div id="searchWrapper" class="addShadow w-100 rounded rounded-pill">
                                <form action="search" method="get" class="row mw-100">
                                    <div id="searchInputDiv" class="col-11 px-0">
                                        <input class="w-100 border-0 bg-transparent ps-3 fs-5" type="search"
                                            name="search" id="searchInput">
                                    </div>
                                    <div id="searchButtonDiv" class="col-1 ps-0 d-flex align-items-center">
                                        <button type="submit">
                                            <i class="fa-solid fa-magnifying-glass"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-4 col-sm-3 m-auto align-items-center justify-content-center d-flex">
                            <div class="row w-75 justify-content-between">
                                <div class="col-3 g-0 d-flex justify-content-center align-items-center mx-sm-1">
                                    <a href="./carrinho" class="text-black fs-4"><i
                                            class="fa-solid fa-shopping-cart"></i></a>
                                </div>
                                <div class="col-3 p-0 mx-sm-1 d-flex justify-content-center">
                                    <button class="btn bg-transparent py-0" type="button" data-bs-toggle="offcanvas"
                                        data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                                        <p class="text-black mb-0 fs-4">
                                            <i class="fa-solid fa-bars"></i>
                                        </p>
                                    </button>
                                </div>
                                <div class="col-3 g-0 d-flex align-items-center mx-sm-1 d-flex justify-content-center">
                                    <a href="./perfil?u=${usuario}" class="fs-4 text-black"><i
                                            class="fa-solid fa-circle-user"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="div-nav" class="row justify-content-evenly px-2">
                </div>
            </header>

            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample"
                aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasExampleLabel">Menu</h5>

                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" id="close-offcanvas"
                        aria-label="Close"></button><label class="ms-1" for="close-offcanvas">Fechar</label>
                </div>
                <div class="offcanvas-body">
                    <div>
                        Some text as placeholder. In real life you can have the elements you have chosen. Like, text,
                        images, lists, etc.
                    </div>
                </div>
            </div>
            <main>

            </main>
            <footer>

            </footer>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                crossorigin="anonymous"></script>
        </body>

        </html>