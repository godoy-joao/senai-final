/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Categoria;
import model.bean.Imagem;
import model.bean.Produto;
import model.dao.CategoriaDAO;
import model.dao.ImagemDAO;
import model.dao.ProdutoDAO;
import model.dao.UsuarioDAO;

/**
 *
 * @author Senai
 */
public class HomeController extends HttpServlet {

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
        String nextPage = "/WEB-INF/jsp/index.jsp";
        CategoriaDAO cDao = new CategoriaDAO();
        List<Categoria> categorias = cDao.listarTodos();
        ProdutoDAO pDao = new ProdutoDAO();
        List<Produto> produtos = pDao.listarTodos();
        ImagemDAO iDao = new ImagemDAO();
        List<Produto> descontos = pDao.listarTodosComDesconto();
        if (descontos.size() > 0) {
            for (int i = 0; i < descontos.size(); i++) {
                Imagem img = iDao.getFirstImagem(descontos.get(i));
                String imagemBase64 = Base64.getEncoder().encodeToString(img.getImagem());
                descontos.get(i).setImagemBase64(imagemBase64);
            }
            request.setAttribute("descontos", descontos);
        }
        if (produtos.size() > 0) {
            for (int i = 0; i < produtos.size(); i++) {
                Imagem img = iDao.getFirstImagem(produtos.get(i));
                String imagemBase64 = Base64.getEncoder().encodeToString(img.getImagem());
                produtos.get(i).setImagemBase64(imagemBase64);
            }
            request.setAttribute("produtos", produtos); 
        }

        UsuarioDAO uDao = new UsuarioDAO();
        Cookie[] cookies = request.getCookies();
        int idUsuario = 0;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("login")) {
                idUsuario = Integer.parseInt(cookie.getValue());
            }
        }
        if (idUsuario > 0) {
            request.setAttribute("user", uDao.getUsuarioById(idUsuario));
        }
        request.setAttribute("categorias", categorias);

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
        String url = request.getServletPath();
        if (url.equals("/search")) {
            String busca = request.getParameter("search");
            response.sendRedirect("./search?s=" + busca);
        } else {
            processRequest(request, response);
        }
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
        processRequest(request, response);
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
