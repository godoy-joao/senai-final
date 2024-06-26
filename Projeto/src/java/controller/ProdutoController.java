/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Categoria;
import model.bean.Produto;
import model.bean.Imagem;
import model.bean.Usuario;
import model.dao.AvaliacaoDAO;
import model.dao.CategoriaDAO;
import model.dao.ImagemDAO;
import model.dao.ProdutoDAO;
import model.dao.UsuarioDAO;

/**
 *
 * @author João Guilherme
 */
public class ProdutoController extends HttpServlet {

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
        ProdutoDAO pDao = new ProdutoDAO();
        ImagemDAO iDao = new ImagemDAO();
        CategoriaDAO cDao = new CategoriaDAO();
        UsuarioDAO uDao = new UsuarioDAO();
        AvaliacaoDAO avDAO = new AvaliacaoDAO();
        Produto produto = pDao.selecionarPorId(Integer.parseInt(request.getParameter("id")));
        produto.setImagemBase64(Base64.getEncoder().encodeToString(iDao.selecionarPrimeiraImagem(produto).getImagem()));
        List<Imagem> imagens = iDao.selecionarListaDeImagens(produto);
        List<Categoria> categorias = cDao.listarCategoriasDoProduto(produto);
        Usuario usuario = new Usuario();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("login") && !(cookie.getValue().equals(""))) {
                    usuario = uDao.selecionarUsuarioPorId(Integer.parseInt(cookie.getValue()));
                    usuario.setFotoBase64(Base64.getEncoder().encodeToString(usuario.getFoto()));
                    request.setAttribute("usuario", usuario);
                }
            }
        }
        List<byte[]> fotoBytes = avDAO.pegarFotosComentarios(produto);
        List<String> fotoBase64 = new ArrayList();
        for (int i = 0; i < fotoBytes.size(); i++) {
            String base = Base64.getEncoder().encodeToString(fotoBytes.get(i));
            fotoBase64.add(base);
        }
        for (int i = 0; i < imagens.size(); i++) {
            imagens.get(i).setImagemBase64(Base64.getEncoder().encodeToString(imagens.get(i).getImagem()));
        }
        request.setAttribute("fotoComentarios", fotoBase64);
        request.setAttribute("produtoCategorias", categorias);
        request.setAttribute("produtoImagens", imagens);
        request.setAttribute("produto", produto);
        String nextPage = "/WEB-INF/jsp/produto.jsp";
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
        
        if (url.equals("/postarComentario")) {
            
        } else if (url.equals("/deletarComentario")) {
            
        } 
        
        else {
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
