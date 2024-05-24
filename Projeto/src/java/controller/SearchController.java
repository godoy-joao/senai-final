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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Imagem;
import model.bean.Produto;
import model.dao.ImagemDAO;
import model.dao.ProdutoDAO;

/**
 *
 * @author João Guilherme
 */
public class SearchController extends HttpServlet {

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
        ProdutoDAO pdao = new ProdutoDAO();
        ImagemDAO iDao = new ImagemDAO();
        String busca = request.getParameter("s");
        List<Produto> produtos = null;
        if (busca.equals("")) {
            produtos = pdao.listarTodos();
        } else {
            busca = "%" + busca + "%";
            produtos = pdao.listarPorPesquisa(busca);
        }
        if (produtos.size() > 0) {
            for (int i = 0; i < produtos.size(); i++) {
                Imagem img = iDao.selecionarPrimeiraImagem(produtos.get(i));
                String imagemBase64 = Base64.getEncoder().encodeToString(img.getImagem());
                produtos.get(i).setImagemBase64(imagemBase64);
               
            }
        }
        request.setAttribute("produtos", produtos);
        String nextPage = "/WEB-INF/jsp/search.jsp";
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
