/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.bean.Categoria;
import model.bean.Estoque;
import model.bean.Imagem;
import model.bean.Produto;
import model.dao.CategoriaDAO;
import model.dao.EstoqueDAO;
import model.dao.ImagemDAO;
import model.dao.ProdutoDAO;

/**
 *
 * @author Senai
 */
@MultipartConfig
public class AdminController extends HttpServlet {

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
        String nextPage = "/WEB-INF/jsp/admin.jsp";
        CategoriaDAO cDao = new CategoriaDAO();
        List<Categoria> categorias = cDao.listarTodos();
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
        if (url.equals("/addProduto")) {
            //----------------------------
            Produto p = new Produto();
            Estoque e = new Estoque();
            EstoqueDAO eDao = new EstoqueDAO();
            ProdutoDAO pDao = new ProdutoDAO();
            ImagemDAO iDao = new ImagemDAO();
            //----------------------------
            p.setNome(request.getParameter("nome"));
            p.setDescricao(request.getParameter("descricao"));
            p.setValor(Float.parseFloat(request.getParameter("valor")));
            p.setDesconto(Float.parseFloat(request.getParameter("desconto")));
            int idProduto = pDao.create(p);
            //Pegando as 'parts' do documento e transformando o conteúdo em bytes
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                if (part.getName().equals("imagem")) {
                    Imagem imagem = new Imagem();
                    imagem.setImagem(iDao.partToBytes(part));
                    imagem.setProduto(idProduto);
                    iDao.insertImagem(imagem);
                }
            }
            //Adicionando categorias
            String[] categorias = request.getParameterValues("selectCategoria");
            for (int i = 0; i < categorias.length; i++) {
                String categoria = categorias[i];
                pDao.addCategoria(idProduto, Integer.parseInt(categoria));
            }

            //Definindo estoque
            e.setProduto(idProduto);
            e.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            e.setCusto(p.getValor());
            eDao.create(e);
            response.sendRedirect("./admin");
        } else if (url.equals("/addCategoria")) {
            Categoria c = new Categoria();
            CategoriaDAO cDao = new CategoriaDAO();
            ImagemDAO iDao = new ImagemDAO();
            c.setNome(request.getParameter("nomeCategoria"));
            Part filePart = request.getPart("imagemCategoria");
            if (filePart != null) {
                c.setCapa(iDao.partToBytes(filePart));
            }
            try {
                cDao.create(c);
                response.sendRedirect("./admin");
            } catch (Exception e) {
                System.out.println("FALHA AO ADICIONAR CATEGORIA");
                e.printStackTrace();
            }
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
