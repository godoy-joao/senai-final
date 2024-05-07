/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Usuario;
import model.dao.UsuarioDAO;

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
        String url = request.getServletPath();
        if (url.equals("/logon")) {
            UsuarioDAO uDAO = new UsuarioDAO();
            Usuario usuario = new Usuario();
             usuario.setEmail(request.getParameter("loginUser"));
             usuario.setTelefone(request.getParameter("loginUser"));
             usuario.setSenha(request.getParameter("loginPass"));
           
            try {
                if (uDAO.login(usuario) != -1) {
                    response.sendRedirect("./home?u="+uDAO.login(usuario));
                } else {
                    response.sendRedirect("./login");
                    request.setAttribute("errorMessage", "Usuário ou senha inválidos");
                }                
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("./login");
                request.setAttribute("errorMessage", "Usuário ou senha inválidos");
            }
        } else if (url.equals("/signup")) {
            String nextPage = "/WEB-INF/jsp/login.jsp";
            Usuario u = new Usuario();
            UsuarioDAO uDAO = new UsuarioDAO();
            u.setNome(request.getParameter("nome"));
            System.out.println("Teste data: "+request.getParameter("dataNascimento")+"<fim");
            u.setDataNasc(Date.valueOf(request.getParameter("dataNascimento")));
            u.setEmail(request.getParameter("email"));
            u.setTelefone(request.getParameter("telefone"));
            u.setSenha(request.getParameter("senha"));           
            u.setNome(u.getNome().replaceAll("Ã£", "ã"));
            try {
                uDAO.create(u);
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
