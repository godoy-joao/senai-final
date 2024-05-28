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
import model.bean.Imagem;
import model.bean.Produto;
import model.bean.Usuario;
import model.dao.CarrinhoDAO;
import model.dao.ImagemDAO;
import model.dao.ProdutoDAO;
import model.dao.UsuarioDAO;

/**
 *
 * @author João Guilherme
 */
public class CarrinhoController extends HttpServlet {

    CarrinhoDAO cDao = new CarrinhoDAO();
    UsuarioDAO uDao = new UsuarioDAO();
    ImagemDAO iDao = new ImagemDAO();
    ProdutoDAO pDao = new ProdutoDAO();

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

        Usuario u = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("login") && !cookie.getValue().equals("")) {
                u = uDao.selecionarUsuarioPorId(Integer.parseInt(cookie.getValue()));
            }
        }
        if (u == null || u.getIdUsuario() <= 0) {
            response.sendRedirect("./login");
        } else {
            try {
                List<Produto> produtos = cDao.lerProdutos(u);
                Float valorFinal = 0f;
                for (int i = 0; i < produtos.size(); i++) {
                    Imagem img = iDao.selecionarPrimeiraImagem(produtos.get(i));
                    produtos.get(i).setImagemBase64(Base64.getEncoder().encodeToString(img.getImagem()));
                    valorFinal += produtos.get(i).getValorFinal();
                }
                request.setAttribute("produtos", produtos);
                request.setAttribute("valorFinal", valorFinal);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        if (!response.isCommitted()) {
            String nextPage = "/WEB-INF/jsp/carrinho.jsp";
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
        Usuario u = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("login") && !cookie.getValue().equals("")) {
                u = uDao.selecionarUsuarioPorId(Integer.parseInt(cookie.getValue()));
            }
        }
        if (url.equals("/esvaziarCarrinho")) {
            cDao.esvaziarCarrinho(u);
            response.sendRedirect("./carrinho");
        } else if (url.equals("/removerItem")) {
            cDao.removerProduto(pDao.selecionarPorId(Integer.parseInt(request.getParameter("item"))), cDao.selecionarCarrinho(u));
            response.sendRedirect("./carrinho");
        } else if (url.equals("/adicionarItem")) {
            cDao.adicionarProduto(pDao.selecionarPorId(Integer.parseInt(request.getParameter("item"))), cDao.selecionarCarrinho(u));
            response.sendRedirect("./carrinho");
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
