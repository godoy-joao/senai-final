/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Usuario;
import model.dao.UsuarioDAO;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

/**
 *
 * @author Senai
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String nextPage = "/WEB-INF/jsp/login.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String url = request.getServletPath();
        if (url.equals("/logon")) {
            UsuarioDAO uDAO = new UsuarioDAO();
            Usuario usuario = new Usuario();
            usuario.setEmail(request.getParameter("loginUser"));
            usuario.setTelefone(request.getParameter("loginUser"));
            usuario.setSenha(request.getParameter("loginPass"));

            try {
                if (uDAO.logar(usuario) != -1) {
                    boolean cookieExiste = false;
                    for (Cookie cookie : request.getCookies()) {
                        if (cookie.getName().equals("login")) {
                            cookieExiste = true;
                            cookie.setValue(Integer.toString(uDAO.logar(usuario)));
                        }
                    }
                    if (!cookieExiste) {
                        Cookie cookieLogin = new Cookie("login", Integer.toString(uDAO.logar(usuario)));
                        response.addCookie(cookieLogin);
                    }
                    response.sendRedirect("./home");
                } else {
                    request.setAttribute("errorMessage", "Usuário ou senha inválidos");
                    response.sendRedirect("./login");

                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("./login");
                request.setAttribute("errorMessage", "Usuário ou senha inválidos");
            }
        } else if (url.equals("/signup")) {
            Usuario u = new Usuario();
            UsuarioDAO uDAO = new UsuarioDAO();
            u.setNome(request.getParameter("nome"));
            System.out.println("Nome: " + u.getNome());
            u.setDataNasc(Date.valueOf(request.getParameter("dataNascimento")));
            u.setEmail(request.getParameter("email"));
            u.setTelefone(request.getParameter("telefone"));
            u.setSenha(request.getParameter("senha"));

            Resource res = new ClassPathResource("placeholder.png");
            byte[] data = null;
            try (InputStream stream = res.getInputStream();
                    ByteArrayOutputStream bOut = new ByteArrayOutputStream()) {
                byte[] img = new byte[4096];
                int byteRead = -1;
                while ((byteRead = stream.read(img)) != -1) {
                    bOut.write(img, 0, byteRead);
                }
                data = bOut.toByteArray();
            }
            u.setFoto(data);
            try {
                uDAO.criar(u);
                response.sendRedirect("./login");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorCadastro", "Algo deu errado. Confira os dados e tente novamente.");
                request.setAttribute("telaInicial", "cadastro");
                response.sendRedirect("./login");
            }
        } else {
            processRequest(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
