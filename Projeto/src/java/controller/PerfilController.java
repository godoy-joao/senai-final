/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.bean.Usuario;
import model.dao.ImagemDAO;
import model.dao.UsuarioDAO;

/**
 *
 * @author Senai
 */
@MultipartConfig
public class PerfilController extends HttpServlet {

    UsuarioDAO uDao = new UsuarioDAO();
    ImagemDAO iDao = new ImagemDAO();

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
        String nextPage = "/WEB-INF/jsp/perfil.jsp";

        Cookie[] cookies = request.getCookies();
        Usuario u = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("login") && !cookie.getValue().equals("")) {
                    u = uDao.selecionarUsuarioPorId(Integer.parseInt(cookie.getValue()));
                }
            }
        }

        if (u == null || u.getIdUsuario() <= 0) {
            response.sendRedirect("./login");
        } else {

            request.setAttribute("user", u);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
        }
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
        Cookie[] cookies = request.getCookies();
        Cookie login = new Cookie("login", "null");
        int id = -1;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("login")) {
                login = cookie;
                id = Integer.parseInt(cookie.getValue());
            }
        }
        Usuario user = uDao.selecionarUsuarioPorId(id);
        if (url.equals("/updEmail")) {
            user.setEmail(request.getParameter("input-updEmail"));
            System.out.println(user.getEmail());
            uDao.atualizarEmail(user);
            response.sendRedirect("./perfil");
        } else if (url.equals("/updTel")) {
            user.setTelefone(request.getParameter("input-updTel"));
            uDao.atualizarTel(user);
            response.sendRedirect("./perfil");
        } else if (url.equals("/updSenha")) {
            user.setSenha(request.getParameter("input-updSenha"));
            uDao.atualizarSenha(user);
            response.sendRedirect("./perfil");
        } else if (url.equals("/updImg")) {
            Part filePart = request.getPart("input-updImg");
            if (filePart != null) {
                user.setFoto(iDao.partParaBytes(filePart));
                uDao.atualizarFoto(user);
            } else {

            }
            response.sendRedirect("./perfil");
        } else if (url.equals("/logout")) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("login")) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
            System.out.println("aqui" + response.isCommitted());
            response.sendRedirect("./home");
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
