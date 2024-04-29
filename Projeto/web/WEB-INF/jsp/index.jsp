<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

        <html>

        <head>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
            <meta http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Home</title>
            <link rel="stylesheet" href="./css/index.css">
        </head>

        <body>
            <header>
                <div id="div-header">
                    <div class="w-100 row px-5 justify-content-between">
                        <div class="col-2 m-auto">
                            <div>
                                <p>Aqui terá a logo</p>
                            </div>
                        </div>
                        <div class="col-4 m-auto">
                            <div id="searchWrapper" class="w-100 row rounded rounded-pill">
                                <div id="searchInputDiv" class="col-10 pe-0">
                                    <input class="w-100 border-0" type="search" name="search" id="searchInput">
                                </div>
                                <div id="searchButtonDiv"
                                    class="col-2 ps-0 d-flex align-items-center">
                                    <a href="./search" class="text-black w-100 d-flex justify-content-center" style="font-size: 1.3rem;"><i
                                            class="fa-solid fa-magnifying-glass"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-3 m-auto align-items-center justify-content-center d-flex">
                            <div class="row ">
                                <div class="col">
                                    <a href="./carrinho" class="text-black" style="font-size: 1.3rem;"><i
                                            class="fa-solid fa-shopping-cart"></i></a>
                                </div>
                                <div class="col">
                                    <button><i class="fa-solid fa-bars"></i></button>
                                </div>
                                <div class="col">
                                    <a href="./perfil" class="text-black" style="font-size: 1.3rem;"><i
                                            class="fa-solid fa-circle-user"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="div-nav">

                </div>
            </header>

            <main>

            </main>
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