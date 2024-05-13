<%-- Document : perfil Created on : 30/04/2024, 14:48:25 Author : João guilherme --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" name="viewport" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>

        <body>
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
        </body>

        </html>