<%-- Document : produto Created on : 01/05/2024, 23:00:40 Author : João Guilherme --%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
            </head>

            <body>
                <header>
                    <div id="div-header" class="d-flex justify-content-center">
                        <div class="vw-100 row px-lg-5 px-sm-3 justify-content-center">
                            <div class="col-2 m-auto">
                                <div>
                                    <a href="./home" class="text-black text-decoration-none">
                                        <p>Aqui terá a logo</p>
                                    </a>
                                </div>
                            </div>
                            <div class="col-6 col-sm-5 m-auto">
                                <div id="searchWrapper" class="w-100 row rounded rounded-pill">
                                    <div id="searchInputDiv" class="col-10 pe-0">
                                        <input class="w-100 border-0" type="search" name="search" id="searchInput">
                                    </div>
                                    <div id="searchButtonDiv" class="col-2 ps-0 d-flex align-items-center">
                                        <a href="./search" class="text-black w-100 d-flex justify-content-center"
                                            style="font-size: 1.3rem;"><i class="fa-solid fa-magnifying-glass"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-4 col-sm-3 m-auto align-items-center justify-content-end d-flex">
                                <div class="row ">
                                    <div class="col-3">
                                        <a href="./carrinho" class="text-black" style="font-size: 1.3rem;">
                                            <i class="fa-solid fa-shopping-cart"></i>
                                        </a>
                                    </div>
                                    <div class="col-3 mx-sm-1">
                                        <button><i class="fa-solid fa-bars"></i></button>
                                    </div>
                                    <div class="col-3 mx-sm-1">
                                        <a href="./perfil" class="text-black" style="font-size: 1.3rem;"><i
                                                class="fa-solid fa-circle-user"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="div-nav" class="row justify-content-evenly px-2">

                    </div>
                </header>
                <main>

                </main>
            </body>

            </html>