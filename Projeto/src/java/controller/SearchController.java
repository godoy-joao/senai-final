/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Imagem;
import model.bean.Produto;
import model.dao.CategoriaDAO;
import model.dao.ImagemDAO;
import model.dao.ProdutoDAO;

/**
 *
 * @author João Guilherme
 */
public class SearchController extends HttpServlet {

    ProdutoDAO pdao = new ProdutoDAO();
    ImagemDAO iDao = new ImagemDAO();
    CategoriaDAO cDao = new CategoriaDAO();

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
        String busca = request.getParameter("s");
        List<Produto> produtos = null;
        if (busca == null || busca.equals("")) {
            produtos = pdao.listarTodos();
        } else {

        }
        if (produtos.size() > 0) {
            for (int i = 0; i < produtos.size(); i++) {
                Imagem img = iDao.selecionarPrimeiraImagem(produtos.get(i));
                String imagemBase64 = Base64.getEncoder().encodeToString(img.getImagem());
                produtos.get(i).setImagemBase64(imagemBase64);

            }
        }
        request.setAttribute("produtos", produtos);
        request.setAttribute("categorias", cDao.listarTodos());
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

        request.setCharacterEncoding("UTF-8");
        String[] cat = request.getParameterValues("c");
        int valorMin = 0, valorMax = 20000;
        List<Produto> produtos = null;
        String valorMinString = request.getParameter("range-preco-min");
        String valorMaxString = request.getParameter("range-preco-max");
        if (valorMinString != null && valorMaxString != null) {
            valorMin = Integer.parseInt(valorMinString);
            valorMax = Integer.parseInt(valorMaxString);
        }
        List<String> categorias = new ArrayList();
        if (cat != null) {
            categorias.addAll(Arrays.asList(cat));
        }
        String busca = request.getParameter("s");
        produtos = pdao.listarPorPesquisaCategoria(busca, categorias, valorMin, valorMax);
        if (produtos.size() > 0) {
            for (int i = 0; i < produtos.size(); i++) {
                Imagem img = iDao.selecionarPrimeiraImagem(produtos.get(i));
                String imagemBase64 = Base64.getEncoder().encodeToString(img.getImagem());
                produtos.get(i).setImagemBase64(imagemBase64);
            }
        }
        request.setAttribute("produtos", produtos);
        request.setAttribute("categorias", cDao.listarTodos());
        String nextPage = "/WEB-INF/jsp/search.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
        dispatcher.forward(request, response);

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
