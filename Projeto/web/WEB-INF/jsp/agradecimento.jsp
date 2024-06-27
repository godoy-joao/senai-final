<%-- Document : agradecimento Created on : 18/06/2024, 19:36:21 Author : João Guilherme --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" name="viewport"
                content="width=device-width, initial-scale=1.0, text/html, charset=UTF-8">
            <link rel="stylesheet" href="./css/base.css">
            <link rel="stylesheet" href="./css/agradecimento.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://kit.fontawesome.com/aca8650e9f.js" crossorigin="anonymous"></script>
            <title>Obrigado!</title>
        </head>

        <body class="vh-100 vw-100">
            <div class="w-100 h-100 d-flex flex-column justify-content-center gap-4">
                <div class="text-success d-flex justify-content-center align-items-center w-100"
                    style="font-size: 70px;">
                    <i class="fa-solid fa-check"></i>
                </div>
                <div class="d-flex justify-content-center align-items-center flex-column w-100">
                    <span class="text-center">
                        Obrigado!
                    </span>
                    <span class="text-center">
                        Sua compra foi bem sucedida, obrigado por comprar conosco!
                    </span>
                </div>
                <div class="d-flex justify-content-center align-items-center w-100">
                    <a href="./home" class="btn btn-info ">
                        Voltar às compras
                    </a>
                </div>
            </div>
        </body>

        </html>