/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Imagem;
import model.bean.Pedido;
import model.bean.Produto;
import model.bean.Usuario;
import model.dao.ImagemDAO;
import model.dao.PedidoDAO;
import model.dao.ProdutoDAO;
import model.dao.UsuarioDAO;

/**
 *
 * @author João Guilherme
 */
public class HistoricoPedidosController extends HttpServlet {

    PedidoDAO pedDao = new PedidoDAO();
    ProdutoDAO pDao = new ProdutoDAO();
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
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        Usuario u = new Usuario();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("login") && !cookie.getValue().equals("")) {
                    u = uDao.selecionarUsuarioPorId(Integer.parseInt(cookie.getValue()));
                }
            }
        }
        if (u.getIdUsuario() < 1) {
            response.sendRedirect("./login");
        } else {

            List<Pedido> pedidos = pedDao.lerPedidos(u);
            List<List<Produto>> itensDoPedido = new ArrayList();
            pedidos.forEach((p) -> {
                List<Produto> produtos = pedDao.selecionarProdutosDoPedido(p);
                for (int i = 0; i < produtos.size(); i++) {
                    Imagem img = iDao.selecionarPrimeiraImagem(produtos.get(i));
                    String imagemBase64 = Base64.getEncoder().encodeToString(img.getImagem());
                }
                itensDoPedido.add(produtos);
            });
            request.setAttribute("itensDoPedido", itensDoPedido);
            request.setAttribute("pedidos", pedidos);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/jsp/pedidosUsuario.jsp");
            rd.forward(request, response);
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
