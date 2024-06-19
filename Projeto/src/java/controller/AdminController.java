/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.bean.Categoria;
import model.bean.Estoque;
import model.bean.Imagem;
import model.bean.Produto;
import model.bean.Usuario;
import model.dao.CategoriaDAO;
import model.dao.EstoqueDAO;
import model.dao.ImagemDAO;
import model.dao.ProdutoDAO;
import model.dao.UsuarioDAO;

/**
 *
 * @author Senai
 */
@MultipartConfig
public class AdminController extends HttpServlet {
CategoriaDAO cDao = new CategoriaDAO();
        ProdutoDAO pDao = new ProdutoDAO();
        UsuarioDAO uDao = new UsuarioDAO();
        EstoqueDAO eDao = new EstoqueDAO();
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
        
       Cookie[] cookies = request.getCookies();
        Usuario u = new Usuario();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("login")) {
                    u = uDao.selecionarUsuarioPorId(Integer.parseInt(cookie.getValue()));
                }
            }
        }
        List<Categoria> categorias = cDao.listarTodos();
        request.setAttribute("categorias", categorias);
        List<Produto> produtos = pDao.listarTodos(); 
        request.setAttribute("produtos", produtos);
        List<Estoque> estoques = eDao.listarTodos();
        request.setAttribute("estoques", estoques);
        if (u.getTipo() != 1) {
            response.sendRedirect("./home");
        } else {
            String nextPage = "/WEB-INF/jsp/admin.jsp";
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
        if (url.equals("/addProduto")) {
            //---------------------------- separadores pra ler isso daqui, até pq ngm é de ferro
            Produto p = new Produto();
            Estoque e = new Estoque();    
            //----------------------------
            p.setNome(request.getParameter("nome"));
            p.setDescricao(request.getParameter("descricao"));
            p.setValor(Float.parseFloat(request.getParameter("valor")));
            p.setDesconto(Float.parseFloat(request.getParameter("desconto")));
            int idProduto = pDao.criar(p);
            //Pegando as 'parts' do documento e transformando o conteúdo em bytes
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                if (part.getName().equals("imagem")) {
                    Imagem imagem = new Imagem();
                    imagem.setImagem(iDao.partParaBytes(part));
                    imagem.setProduto(idProduto);
                    imagem.setFormato(iDao.pegarExtensaoDoArquivo(part.getSubmittedFileName()));
                    iDao.inserirImagem(imagem);
                }
            }
            //Adicionando categorias
            String[] categorias = request.getParameterValues("selectCategoria");
            for (int i = 0; i < categorias.length; i++) {
                String categoria = categorias[i];
                pDao.adicionarCategoria(idProduto, Integer.parseInt(categoria));
            }

            //Definindo estoque
            e.setProduto(idProduto);
            e.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
            e.setCusto(p.getValor());
            eDao.criar(e);
            response.sendRedirect("./admin");
        } else if (url.equals("/addCategoria")) {
            Categoria c = new Categoria();
            
            c.setNome(request.getParameter("nomeCategoria"));
            Part filePart = request.getPart("imagemCategoria");
            if (filePart != null) {
                c.setCapa(iDao.partParaBytes(filePart));
            }
            try {
                cDao.criar(c);
                response.sendRedirect("./admin");
            } catch (Exception e) {
                System.out.println("FALHA AO ADICIONAR CATEGORIA");
                e.printStackTrace();
            }
        } else if (url.equals("editarProduto")) {
            Produto p = new Produto();
            p.setIdProduto(Integer.parseInt(request.getParameter("editId")));
            p.setNome(request.getParameter("novoNome"));
            p.setValor(Float.parseFloat(request.getParameter("novoValor")));
            p.setDesconto(Float.parseFloat(request.getParameter("novoDesconto")));
            p.setDescricao(request.getParameter("novaDescricao"));
            Estoque e = eDao.selecionarEstoquePorIdProduto(p);
            e.setQuantidade(Integer.parseInt(request.getParameter("novaQtd")));
            pDao.atualizar(p);            
        } else if (url.equals("excluirProduto")) {
            
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
