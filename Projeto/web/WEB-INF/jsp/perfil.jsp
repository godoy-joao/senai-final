<%-- Document : perfil Created on : 30/04/2024, 14:48:25 Author : João guilherme --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8">
            <title>Perfil</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="./css/header.css">
            <link rel="stylesheet" href="./css/base.css">
        </head>

        <body class="overflow-x-hidden">
            <%@ include file="/WEB-INF/jspf/header.jspf" %>
                <main>
                    <div id="barraLateral">
                        <div>
                            <button></button>
                        </div>
                        <div>
                            <button></button>
                        </div>
                        <div>
                            <button></button>
                        </div>
                    </div>
                    <div id="areaPrincipal">
                        <div>
                            <div>
                                <img src="data:image/jpg;base64,${produto.imagemBase64}" alt="">
                            </div>
                            <div>

                            </div>
                        </div>
                        <div>

                        </div>
                    </div>
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