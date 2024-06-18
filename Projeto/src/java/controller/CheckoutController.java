/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.CarrinhoProduto;
import model.bean.Endereco;
import model.bean.Imagem;
import model.bean.Pedido;
import model.bean.Produto;
import model.bean.Usuario;
import model.dao.CarrinhoDAO;
import model.dao.EnderecoDAO;
import model.dao.ImagemDAO;
import model.dao.PedidoDAO;
import model.dao.ProdutoDAO;
import model.dao.UsuarioDAO;

/**
 *
 * @author João Guilherme
 */
public class CheckoutController extends HttpServlet {

    UsuarioDAO uDao = new UsuarioDAO();
    CarrinhoDAO cDao = new CarrinhoDAO();
    ProdutoDAO pDao = new ProdutoDAO();
    PedidoDAO pedDao = new PedidoDAO();
    ImagemDAO iDao = new ImagemDAO();
    EnderecoDAO eDao = new EnderecoDAO();

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
        Cookie[] cookies = request.getCookies();
        Usuario u = new Usuario();
        boolean permite = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("criarPedido") && cookie.getValue().equals("true")) {
                    permite = true;
                    //cookie.setMaxAge(0);
                    //response.addCookie(cookie);
                }
                if (cookie.getName().equals("login") && !cookie.getValue().equals("")) {
                    u = uDao.selecionarUsuarioPorId(Integer.parseInt(cookie.getValue()));
                }
            }
        }

        List<Produto> produtos = cDao.lerProdutos(u);
        if (!permite || produtos.size() < 1) {
            response.sendRedirect("./carrinho");
        } else {
            System.out.println(u.getIdUsuario());

            List<CarrinhoProduto> cartProd = cDao.selecionarQuantidades(cDao.selecionarCarrinho(u));
            float total = 0;
            for (int i = 0; i < produtos.size(); i++) {
                float valor = produtos.get(i).getValorFinal();
                int quantidade = cartProd.get(i).getQuantidade();
                total += valor * quantidade;
                Imagem img = iDao.selecionarPrimeiraImagem(produtos.get(i));
                produtos.get(i).setImagemBase64(Base64.getEncoder().encodeToString(img.getImagem()));
            }
            request.setAttribute("produtos", produtos);
            request.setAttribute("cartProd", cartProd);
            request.setAttribute("usuario", u);
            request.setAttribute("totalPedido", total);
            String nextPage = "/WEB-INF/jsp/checkout.jsp";
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
        String url = request.getServletPath();
        Cookie[] cookies = request.getCookies();
        Usuario u = new Usuario();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("login") && !cookie.getValue().equals("")) {
                    u = uDao.selecionarUsuarioPorId(Integer.parseInt(cookie.getValue()));
                }
            }
        }
        if (url.equals("/toCheckout")) {
            Cookie c = new Cookie("criarPedido", "true");
            response.addCookie(c);
            response.sendRedirect("./checkout");
        } else if (url.equals("/concluirPedido")) {
            Endereco e = new Endereco();
            Pedido p = new Pedido();
            if (!(request.getParameter("select-endereco").equals("novo"))) {
                e = eDao.selecionarPorId(Integer.parseInt(request.getParameter("select-endereco")));
                p.setEnderecoEntrega(e.getIdEndereco());
            } else {
                e.setCep(request.getParameter("endereco-cep"));
                e.setEstado(request.getParameter("select-estado"));
                e.setCidade(request.getParameter("endereco-cidade"));
                e.setBairro(request.getParameter("endereco-bairro"));
                e.setRua(request.getParameter("endereco-rua"));
                e.setNumero(request.getParameter("endereco-numero"));
                e.setComplemento(request.getParameter("endereco-complemento"));
                e.setUsuario(u.getIdUsuario());
                p.setEnderecoEntrega(eDao.criar(e));
            }
            p.setDataHoraAtual();
            p.setValorTotal(Float.parseFloat(request.getAttribute("totalPedido").toString()));
            p.setFormaPagamento(request.getParameter("radio-pagamento"));
            p.setUsuario(u.getIdUsuario());

            int idPedido = pedDao.criar(p);
            p = pedDao.selecionarPorId(idPedido);
            List<CarrinhoProduto> produtos = cDao.selecionarQuantidades(cDao.selecionarCarrinho(u));
            pedDao.adicionarProdutos(produtos, p);
            cDao.esvaziarCarrinho(u);
            response.sendRedirect("./checkout");
        } else {
            response.sendRedirect("./checkout");
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
